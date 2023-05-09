package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"os/exec"
	"strings"
)

type Manifest struct {
	Addons []Addon
}

type Addon struct {
	Description  string
	Id           string
	Mod_version  string
	Name         string
	Path         string
	Remote       string
	Type         string
	Url          string
	Version      string
	Checksum     string
	Dependencies map[string]any

	srcName string
}

type NixPrefetchGitOutput struct {
	Date           string
	DeepClone      bool
	DetchSubmodule bool
	FetchLFS       bool
	LeveDotGit     bool
	Path           string
	Rev            string
	Sha256         string
	Url            string
}

func nixPrefetchGit(remoteUrl string) *NixPrefetchGitOutput {
	args := []string{"--quiet"}

	lastIndex := strings.LastIndex(remoteUrl, ":")
	if lastIndex != -1 && lastIndex > 5 { // https:
		args = append(args, "--rev", remoteUrl[lastIndex+1:])
		remoteUrl = remoteUrl[:lastIndex]
	}

	args = append(args, "--url", remoteUrl)

	// println(strings.Join(args, " "))

	cmd := exec.Command("nix-prefetch-git", args...)
	result, err := cmd.Output()
	assertNoError(err)

	return mustUnmarshal[*NixPrefetchGitOutput](result)
}

type Remote struct {
	gitUrl  string
	srcName string

	manifest *Manifest
	prefetch *NixPrefetchGitOutput
}

func (r *Remote) LoadManifest() {
	// sanity checks
	if r.prefetch != nil && r.manifest != nil {
		return
	}
	if r.gitUrl == "" {
		panic("gitUrl empty")
	}
	if r.srcName == "" {
		panic("srcName empty")
	}

	r.prefetch = nixPrefetchGit(r.gitUrl)

	manifestFile, err := os.Open(r.prefetch.Path + "/manifest.json")
	if err == nil {

		manifestFileContents, err := io.ReadAll(manifestFile)
		assertNoError(err)

		r.manifest = mustUnmarshal[*Manifest](manifestFileContents)

		AddSource(r)
		return
	}

	_, err = os.Stat(r.prefetch.Path + "/init.lua")
	if err == nil {
		AddSource(r)

		config := fmt.Sprintf(
			`(mkIf cfg.plugins.%s {home.file."${config.xdg.configHome}/lite-xl/plugins/%s".source = "${%s-src}";})`,
			r.srcName, r.srcName, r.srcName)

		AddPlugin(r.srcName, config)

		r.manifest = &Manifest{}
		return
	}

	srcDir, err := os.Open(r.prefetch.Path)
	assertNoError(err)

	names, err := srcDir.Readdirnames(-1)
	assertNoError(err)

	for _, s := range names {
		if strings.HasSuffix(s, ".lua") {
			AddSource(r)
			config := fmt.Sprintf(
				`(mkIf cfg.plugins.%s {home.file."${config.xdg.configHome}/lite-xl/plugins/%s".source = "${%s-src}/%s";})`,
				r.srcName, s, r.srcName, s)

			AddPlugin(r.srcName, config)

			r.manifest = &Manifest{}
			return
		}
	}

	panic("no idea here")
}

func (a *Addon) GetDependenciesConfig() string {
	deps := []string{}
	for dep := range a.Dependencies {
		deps = append(deps, fmt.Sprintf(`programs.lite-xl.plugins.%s = true;`, dep))
		depsNeeded[dep] = true
	}
	return strings.Join(deps, "\n")
}

func (r *Remote) createFile() {
	r.LoadManifest()

	for _, a := range r.manifest.Addons {
		a.srcName = r.srcName

		location := "plugins"
		if a.Type == "library" {
			location = "libraries"
		}

		if a.Path != "" {
			fsInfo, err := os.Stat(r.prefetch.Path + "/" + a.Path)
			assertNoError(err)

			config := fmt.Sprintf(
				`(mkIf cfg.plugins.%s {home.file."${config.xdg.configHome}/lite-xl/plugins/%s".source = "${%s-src}/%s";%s})`,
				a.Id, fsInfo.Name(), a.srcName, a.Path, a.GetDependenciesConfig())

			AddPlugin(a.Id, config)

			continue
		}

		if a.Url != "" && a.Checksum != "" {
			config := fmt.Sprintf(
				`(mkIf cfg.plugins.%s {home.file."${config.xdg.configHome}/lite-xl/%s/%s".source = pkgs.fetchurl {url="%s";sha256="%s";};%s})`,
				a.Id, location, a.Id+".lua", a.Url, a.Checksum, a.GetDependenciesConfig())

			AddPlugin(a.Id, config)
			continue
		}

		if a.Remote != "" {
			remote := Remote{
				gitUrl:  a.Remote,
				srcName: a.Id,
			}
			remote.createFile()
			continue
		}

		_, err := os.Stat(r.prefetch.Path + "/init.lua")
		if err == nil {

			config := fmt.Sprintf(
				`(mkIf cfg.plugins.%s {home.file."${config.xdg.configHome}/lite-xl/%s/%s".source = "${%s-src}";%s})`,
				a.Id, location, a.Id, r.srcName, a.GetDependenciesConfig())

			AddPlugin(a.Id, config)
			continue
		}

		// println(fmt.Sprintf("skipped Addon: %v", a))
	}
}

type Plugin struct {
	option string
	config string
}

var (
	plugins    map[string]Plugin = make(map[string]Plugin)
	srcs       map[string]string = make(map[string]string)
	depsNeeded map[string]bool   = make(map[string]bool)
)

func AddSource(remote *Remote) {
	_, found := srcs[remote.srcName]
	if !found {
		srcs[remote.srcName] = fmt.Sprintf(
			`%s-src = builtins.fetchGit {url = "%s";rev = "%s";};`,
			remote.srcName, remote.prefetch.Url, remote.prefetch.Rev)
	}
}

func AddPlugin(name, config string) {
	_, found := plugins[name]
	if !found {
		plugins[name] = Plugin{
			option: fmt.Sprintf(`%s = mkEnableOption "%s";`, name, name),
			config: config,
		}
	}
}

func main() {
	litexl_plugins := Remote{
		// gitUrl:  "https://github.com/lite-xl/lite-xl-plugins", // nelua is gone :(
		gitUrl:  "https://github.com/Meerschwein/lite-xl-plugins",
		srcName: "lite-xl-plugins",
	}
	litexl_plugins.createFile()

	sources := []string{}
	for _, s := range srcs {
		sources = append(sources, s)
	}

	options := []string{}
	configs := []string{}
	for _, p := range plugins {
		options = append(options, p.option)
		configs = append(configs, p.config)
	}

	depsOptions := []string{}
	depsAssertions := []string{}
	for dep := range depsNeeded {
		_, found := plugins[dep]
		if !found {
			depsOptions = append(depsOptions, fmt.Sprintf(`%s = mkEnableOption "%s";`, dep, dep))
			depsAssertions = append(depsAssertions, fmt.Sprintf(`{assertion = !cfg.plugins.%s;message="%s is only a dummy";}`, dep, dep))
		}
	}

	fileContents := fmt.Sprintf(
		`{config, lib, pkgs, ...}: with lib; let
cfg = config.programs.lite-xl;
%s
in {
options.programs.lite-xl.plugins = {
%s
# dummy dependencies
%s
};
config = mkIf cfg.enable (mkMerge [
%s
# dummy dependencies
({assertions = [ %s ];})
]);
}
`,
		strings.Join(sources, "\n"),
		strings.Join(options, "\n"),
		strings.Join(depsOptions, "\n"),
		strings.Join(configs, "\n"),
		strings.Join(depsAssertions, "\n"),
	)

	f, err := os.Create("./plugins.nix")
	assertNoError(err)

	_, err = io.WriteString(f, fileContents)
	assertNoError(err)
}

// HELPERS

func assertNoError(err error) {
	if err != nil {
		panic(err)
	}
}

func mustUnmarshal[T any](data []byte) T {
	res := new(T)
	err := json.Unmarshal(data, res)
	assertNoError(err)
	return *res
}
