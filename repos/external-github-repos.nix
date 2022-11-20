{pkgs}: {
  console = pkgs.fetchFromGitHub {
    owner = "franko";
    repo = "console";
    rev = "08c3f5e1483627c3ae688ce5a99008e823357f2c";
    sha256 = "1s4naa64sz27a4srdpysz6cibmdammskvfadxw60jwvq3cid1vv9";
  };
  contextmenu = pkgs.fetchFromGitHub {
    owner = "takase1121";
    repo = "lite-contextmenu";
    rev = "5af041bf27319c6c26316c7fc8b7a60494be7d32";
    sha256 = "1hyvzhqb17bjpn53gcrm89zns5rs8g1aaar3mqnrn56bnsh1kpqh";
  };
  discord-presence = pkgs.fetchFromGitHub {
    owner = "vincens2005";
    repo = "lite-xl-discord";
    rev = "bb8b26af4944e74789f27967f71d16a6cbeceb1b";
    sha256 = "19a49dzav7w2p2h2k8d610kkrgi5gl0p68jdwf36i21l5a8qwj2m";
  };
  equationgrapher = pkgs.fetchFromGitHub {
    owner = "ThaCuber";
    repo = "equationgrapher";
    rev = "bd7056b5d4a6f6b98365e1a5e3e78e29ed843d13";
    sha256 = "09fmwqzfsjc3b2ib9l1zp7b2938q92ayykqpad03vmv4z262sy85";
  };
  exterm = pkgs.fetchFromGitHub {
    owner = "ShadiestGoat";
    repo = "lite-xl-exterm";
    rev = "aca8827fc1af831890cffd3dd122debac72429c6";
    sha256 = "1s5wxx5fnimfx8bggwkcg4vd1hyb0ggh7ajav7fjh9px7pkf2m7w";
  };
  fallbackfonts = pkgs.fetchFromGitHub {
    owner = "takase1121";
    repo = "lite-fallback-fonts";
    rev = "281cafc014f7931f041046f76496797695678bb4";
    sha256 = "0067bj71ynyd6dl8zyfvybf102yygfz6vbn9ij2xysm9zyr34j6f";
  };
  formatter = pkgs.fetchFromGitHub {
    owner = "vincens2005";
    repo = "lite-formatters";
    rev = "7e017080a967c01d437e484247a90c1ff52e8ef8";
    sha256 = "1xgshs77k3d49s2209spkdqiv18pqnpdh8265k8m7lqdk4lyj3ba";
  };
  gitblame = pkgs.fetchFromGitHub {
    owner = "juliardi";
    repo = "lite-xl-gitblame";
    rev = "80b53d886d1308048caa69ba892251e67d708f55";
    sha256 = "0j6l9n62c005h1ys6v5npxq0wi0m4sk700cnab6yv1xilyggq34z";
  };
  gitdiff_highlight = pkgs.fetchFromGitHub {
    owner = "vincens2005";
    repo = "lite-xl-gitdiff-highlight";
    rev = "12ddfa619054dfdd1ed86426d60b569dc536c43e";
    sha256 = "0l8bcs25i9s0pmn0467hmdzhw0kaysk9kyr4acch6vcvhkz0zn18";
  };
  immersive-title = pkgs.fetchFromGitHub {
    owner = "takase1121";
    repo = "lite-xl-immersive-title";
    rev = "094a1ca85b6153b21bd9110d8be0563451ac85ab";
    sha256 = "14gmfcs0d4kvx2h0qni6a0g5gzf0m2bz59c4sljbwgj57ln813xy";
  };
  kinc_projects = pkgs.fetchFromGitHub {
    owner = "Kode-Community";
    repo = "kinc_plugin";
    rev = "96939e5a1f83b05717f9103b40635f9a7eed7514";
    sha256 = "0klf85ldy51hz9jfxs8lb7zh9sjbnwyihw9x9x4j6zrbhfd345b2";
  };
  language_autohotkey = pkgs.fetchFromGitHub {
    owner = "devPnal";
    repo = "lite-plugin-autohotkey";
    rev = "e1597623163ab9e1d99ec1e8ee75cbe95b3e5d91";
    sha256 = "1gnin7nysf80rr9s4f9mcl5ndjcdz17aj7c3w5zj9dr4j72k31mh";
  };
  language_containerfile = pkgs.fetchFromGitHub {
    owner = "FilBot3";
    repo = "lite-xl-language-containerfile";
    rev = "2d5e46b1051c48d74f9b63f9844913c630d19b87";
    sha256 = "04bv0klhrnjwhqxd28498vi6ddhlgp4jdwyamcmvqpx6vpzam2ag";
  };
  language_crystal = pkgs.fetchFromGitHub {
    owner = "Tamnac";
    repo = "lite-plugin-crystal";
    rev = "a4240d15d2e5daa0417fe1b4a91f9db0e5d2235e";
    sha256 = "1jfj1kr1sgw95d2jji4w54halifz4lma7pxiyjpr8k5cmi3b8c5m";
  };
  language_env = pkgs.fetchFromGitHub {
    owner = "anthonyaxenov";
    repo = "lite-xl-env-syntax";
    rev = "89a4274af6a786963930d7a8fb542dfe61daa801";
    sha256 = "013bwlz16pdhkzpl6ag7s1i6xnkncx8csch4sczim0rcrx75p60m";
  };
  language_ignore = pkgs.fetchFromGitHub {
    owner = "anthonyaxenov";
    repo = "lite-xl-ignore-syntax";
    rev = "3a9a5e0ae03b82358473da5d1c6012944d65ea95";
    sha256 = "0nvxgd3n2j26qx76rqyrv6zkclfsh263vynbgg9lkw1hhpn9l75n";
  };
  language_nelua = pkgs.fetchFromGitHub {
    owner = "AKDev21";
    repo = "nelua-lite-xl";
    rev = "371d854b54042043daa8f1d27b1ceebae1120f41";
    sha256 = "1q649cpkg61cflyij4n1qva17a4r67k1j6ghca1z33pvlldfwfpb";
  };
  language_pony = pkgs.fetchFromGitHub {
    owner = "MrAnyx";
    repo = "lite-plugin-pony";
    rev = "34d9ec673eaa6c409bcef0febaa0a36cc3acdf4e";
    sha256 = "0m2kir5b0v2mfx1jn0s9j7x2w46wa0d600iprx6pb1q8jvbcqzdz";
  };
  lintplus = pkgs.fetchFromGitHub {
    owner = "liquid600pgm";
    repo = "lintplus";
    rev = "3268641818069070b270486a88966b2a8bfef97e";
    sha256 = "0g474h6cm0gg5pp5r6w1ysdwl3h23nxw1bj37m66cjb0ifr9jzm3";
  };
  linter = pkgs.fetchFromGitHub {
    owner = "drmargarido";
    repo = "linters";
    rev = "eb1611eaade6e5328df5172bd3f759d853c33a31";
    sha256 = "1bhz18da69skckgk7ydk9jihqzibrqfk1m1fcy099b9qknr53nhk";
  };
  litepresence = pkgs.fetchFromGitHub {
    owner = "TorchedSammy";
    repo = "Litepresence";
    rev = "859bd46c1713951a0249ca65f1779e389788d656";
    sha256 = "14v40z5xbagz60fsnfwf8djlf5fy6k60wyavm010202clac6rjqq";
  };
  lorem = pkgs.fetchFromGitHub {
    owner = "sheetcoder";
    repo = "lorem";
    rev = "b2da386519850d6f91ef67097e50141b3b11a90e";
    sha256 = "0vsy93pj8360hj197kblzvgyvk16sp52yf05w5zfwdrcs6n2szd1";
  };
  lsp = pkgs.fetchFromGitHub {
    owner = "lite-xl";
    repo = "lite-xl-lsp";
    rev = "ff35a605ac339e20b6de6da49247b789d361715e";
    sha256 = "1zsi92jabp5zxw87hszpbrvn0dw41h3f0s93ysxzawfsq37q0lfv";
  };
  lspkind = pkgs.fetchFromGitHub {
    owner = "TorchedSammy";
    repo = "lite-xl-lspkind";
    rev = "72c112b7e7bf13fbb789a3daf97a06094d9b2edb";
    sha256 = "0gaj3my5qywp1fiysw3jncf6hi3bcpk38mf413sz671ghlc66y02";
  };
  theme16 = pkgs.fetchFromGitHub {
    owner = "monolifed";
    repo = "theme16";
    rev = "c39b33cb318d4baa2b4b9cc6e6370cb3ede3ef22";
    sha256 = "152m3l0jw8lhmkjvh10rb78i5gw5mkf4rhzcs4gzsy199hl3rn54";
  };
  todotreeview = pkgs.fetchFromGitHub {
    owner = "drmargarido";
    repo = "TodoTreeView";
    rev = "a9371045ead3bc820224d3be55db6066398a11c5";
    sha256 = "0ndzkjh90fpca9fy74bxgif196x7h274prprmdlv4f5915h49250";
  };
  treeview-menu-extender = pkgs.fetchFromGitHub {
    owner = "juliardi";
    repo = "lite-xl-treeview-menu-extender";
    rev = "bd9063e453b4024dcd0bf6a4f775ded32ca24d1f";
    sha256 = "1x5h6lgx8nwqsdkg0irhvjazhnxdjiqs8sz31h09swdrrnma0l6d";
  };
  updatechecker = pkgs.fetchFromGitHub {
    owner = "vincens2005";
    repo = "lite-xl-updatechecker";
    rev = "3478abd43618da857d4315bcc8fddf08c27e1150";
    sha256 = "0w54v7cmsny4j4ab9iwh55dbs6s5a2fjinx9lydnq3frzwphqwgr";
  };
  vibe = pkgs.fetchFromGitHub {
    owner = "eugenpt";
    repo = "lite-xl-vibe";
    rev = "8a8d67da6439bc849bfb22a03a5efe3f75550dce";
    sha256 = "04wscp6w3vfp2nrf5ijydsqsf0d3dyfjq4i7f2np5y1nw5q0z4gy";
  };
  visu = pkgs.fetchFromGitHub {
    owner = "TorchedSammy";
    repo = "Visu";
    rev = "782c7b1ebde38dad2c3c6a1c1dee6761230dea16";
    sha256 = "0341igm8fkx8kfzbkkl5frb9f0xnkiypg2pzn5613w9cgmhw9pxx";
  };
  widget = pkgs.fetchFromGitHub {
    owner = "lite-xl";
    repo = "lite-xl-widgets";
    rev = "f703c4b68ac795326f6df1598733e84924232f5c";
    sha256 = "1ivhvza0d1ihzddkrad385d307qqaxm92xgxcabj53ny1vk05804";
  };
}
