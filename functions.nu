def colors-rev [] {open refs.toml | get colors}
def plugins-rev [] {open refs.toml | get plugins}

def get-colors-info [] {
  fetch $"https://raw.githubusercontent.com/lite-xl/lite-xl-colors/(colors-rev)/README.md"
  | lines 
  | where ($it | str starts-with '[') 
  | each { |it| $it | parse --regex '\[`(?P<name>.*)`\]\((?P<path>colors/.*\.lua).*' }
  | flatten
  | update name { |it| $it.name | str kebab-case }
  | save "info/colors.json"
}

def get-plugins-info [] {
  fetch $"https://raw.githubusercontent.com/lite-xl/lite-xl-plugins/(plugins-rev)/README.md"
  | lines
  | where ( $it | str starts-with "| [" )
  | str trim
  | each { |it| $it | parse --regex '\|\s+\[`(?P<name>.*)`\]\((?P<path>.*)\)(?:\\\*)?\s*\|(?P<description>.*)\|' }
  | flatten
  | str trim
  | update name { |it| $it.name | str downcase | str replace '\+' 'plus' | str replace ' ' '_' }
  | update path { |it| $it.path | str replace '\?raw=.*$' '' }
  | update description { |it| $it.description | str replace '\n' ' ' }
  | insert type { |$it|
    if ($it.path | str starts-with "plugins/") {
      "local"
    } else if ($it.path | str starts-with "https://github.com") {
      "github"
    } else {
      "unknown"
    } 
  }
  | save "info/plugins.json"
}

def nix-pkgs-fetchFromGitHub [
  owner: string
  repo: string
  rev: string
  sha256: string
] {
  $'pkgs.fetchFromGitHub{owner="($owner)";repo="($repo)";rev="($rev)";sha256="($sha256)";}'
}

def nix-pkgs-func [] {$'{pkgs}:($in)'}
def nix-add-name [name:string] {$'($name)=($in);'}
def nix-to-set [] {$'{($in)}'}

def update-lite-xl-plugins-repo [] {
  let res = (nix-prefetch-git --quiet --rev (plugins-rev) "https://github.com/lite-xl/lite-xl-plugins" | from json)
  nix-pkgs-fetchFromGitHub "lite-xl" "lite-xl-plugins" (plugins-rev) $res.sha256 | nix-pkgs-func
    | save "repos/lite-xl-plugins.nix"
}

def update-lite-xl-colors-repo [] {
  let res = (nix-prefetch-git --quiet --rev (colors-rev) "https://github.com/lite-xl/lite-xl-colors" | from json)
  nix-pkgs-fetchFromGitHub "lite-xl" "lite-xl-colors" (colors-rev) $res.sha256 | nix-pkgs-func
    | save "repos/lite-xl-colors.nix"
}

def update-external-plugin-repos [] {
  open "info/plugins.json"
  | where type == "github"
  | where ($it.path | str contains "https://github.com")
  | each { |it| $it | insert _ ($it.path | parse --regex "https://github.com/(?P<owner>.*)/(?P<repo>.*)") } | flatten
  | where not ($it.owner | str contains "/")
  | each { |it| $it | insert _ (nix-prefetch-git --quiet $it.path | from json | select rev sha256) }
  | flatten
  | each { |it| nix-pkgs-fetchFromGitHub $it.owner $it.repo $it.rev $it.sha256 | nix-add-name $it.name }
  | str collect | nix-to-set | nix-pkgs-func 
  | save "repos/external-github-repos.nix"
}