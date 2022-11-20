{pkgs}: {
  black = pkgs.fetchFromSourcehut {
    owner = "~tmpod";
    repo = "black-lite";
    rev = "2a1ab1b703f954edb39efb73e72b44c0d18b30a2";
    hash = "sha256-Oxmxe+MquqXOzZMdNZwnf2vFnYYI2u8bp/Hhk+fCh0s=";
  };
  eofnewline = pkgs.fetchFromGitHub {
    owner = "bokunodev";
    repo = "lite_modules";
    rev = "a93a10dc55afd57c074cb2e2b9bbd917b756aa4d";
    sha256 = "sha256-ZEebVZlTynvXOJi4RfvPVogcKB1i1wF8mAf18lxI/Fg=";
  };
  language_ksy = pkgs.fetchFromGitHub {
    owner = "whiteh0le";
    repo = "lite-plugins";
    rev = "8ad4bf27354ad02b9179b4a5f26f768e2208ace2";
    sha256 = "sha256-d2oLmniqMVjme77OSyXbbtywmo+bIyHFn4SK1252KeY=";
  };
  nonicons_font = pkgs.fetchFromGitHub {
    owner = "yamatsum";
    repo = "nonicons";
    rev = "6a2faf4fbdfbe353c5ae6a496740ac4bfb6d0e74";
    sha256 = "sha256-/IyXiBwXozf9ZZNTkcATCbu7yx1zisMw0//EBPTiYj8=";
  };
}
