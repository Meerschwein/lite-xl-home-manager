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
    rev = "93ac3abb7381fe6d5c9734e40c008cd26713f1a8";
    sha256 = "0zmx93arrdhsqw06yfd1kj7739wnzh76cw8bi3psvh5cxpv4yl2l";
  };
  encoding = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-encoding";
    rev = "b1ddf226277ea12a03ed9db2ddda458988020e91";
    sha256 = "0lpzrxi7wpiv8p3bwyzn7rgibzjj3xa4hah9dfw5phckbdx3yw76";
  };
  encodings = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-encoding";
    rev = "b1ddf226277ea12a03ed9db2ddda458988020e91";
    sha256 = "0lpzrxi7wpiv8p3bwyzn7rgibzjj3xa4hah9dfw5phckbdx3yw76";
  };
  equationgrapher = pkgs.fetchFromGitHub {
    owner = "ThaCuber";
    repo = "equationgrapher";
    rev = "bd7056b5d4a6f6b98365e1a5e3e78e29ed843d13";
    sha256 = "09fmwqzfsjc3b2ib9l1zp7b2938q92ayykqpad03vmv4z262sy85";
  };
  evergreen = pkgs.fetchFromGitHub {
    owner = "TorchedSammy";
    repo = "Evergreen.lxl";
    rev = "c4058bfdedd27aee3b23319905b5df7b4ca52ef8";
    sha256 = "1cd0pqzw8728anj2hckbdwxj10phx888615z9l3ys6r9pdmqq0vs";
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
    rev = "6de7a97bb2b635ac667750f49087afd9980f2e06";
    sha256 = "1d23m57hdv785dnx9bv7rl33335jza2vaaj0njxssqga1qzrkzlf";
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
    rev = "cf3a8029ac7154ea53ac819a95d44a6ff102f051";
    sha256 = "0jslk8qw2dphpk11alqrfnxgzhl2cpfmwvwm31xrr636592bbdfm";
  };
  kinc_projects = pkgs.fetchFromGitHub {
    owner = "Kode-Community";
    repo = "kinc_plugin";
    rev = "309fe4193a09cf739ed0a058b1a6966a463a1dbd";
    sha256 = "05qivfs0skgdi5p66f6wswhraw9ymhx3m9vhnz53qf2qkjfhd74w";
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
    rev = "1913a6dd23a7640b507943230291a15aecc3235d";
    sha256 = "11i4s3jszfi0qqpdnlr0xd0kb7b2gqcznf0rwl15hmjncf1kfx26";
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
    rev = "8bf0ec5e7bf2b8dc9d39e6ebaaa5344fc5969319";
    sha256 = "1vbczwf4l7yivqz8lazqqbg573dhvhfijq4apfasgzs1xavqvds1";
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
    rev = "1985e8a59feaaea5085a5add2521293a11f6d376";
    sha256 = "1a6n98ddw1b0mpsw733h8hjynjq463l4h2djfi54d5qfj4w0pjb2";
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
    rev = "6cd545b6e602bc09501423a089be98c81ae79df8";
    sha256 = "0jhxmi82jlmkgavnhp9bl7r5d6z29qyj77bnqs9j64vapgn1ap8s";
  };
  lspkind = pkgs.fetchFromGitHub {
    owner = "TorchedSammy";
    repo = "lite-xl-lspkind";
    rev = "272ebd0010cd3e205cfb486b1bae889080fec437";
    sha256 = "1c3gs8979js0khkp7njh4nsvq2g9s520vhqy0a89iivdh046zrrn";
  };
  multithreaded_find_file = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-threads";
    rev = "e61ffd28fc852b143fe468c4b43c68d605f22335";
    sha256 = "04aab455y5wwgigfwhpa0zhmyymzcm9bprz6499gcf8ipwa45kkp";
  };
  multithreaded_project_search = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-threads";
    rev = "e61ffd28fc852b143fe468c4b43c68d605f22335";
    sha256 = "04aab455y5wwgigfwhpa0zhmyymzcm9bprz6499gcf8ipwa45kkp";
  };
  net = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-net";
    rev = "a1930395c89e24344db686f2e83ce67a602c5dbf";
    sha256 = "11hw570xbq3n2zhm7lww4mmxvy02k0gvmrgcqrxm8jaswyaiwy1x";
  };
  theme16 = pkgs.fetchFromGitHub {
    owner = "monolifed";
    repo = "theme16";
    rev = "c39b33cb318d4baa2b4b9cc6e6370cb3ede3ef22";
    sha256 = "152m3l0jw8lhmkjvh10rb78i5gw5mkf4rhzcs4gzsy199hl3rn54";
  };
  threads = pkgs.fetchFromGitHub {
    owner = "jgmdev";
    repo = "lite-xl-threads";
    rev = "e61ffd28fc852b143fe468c4b43c68d605f22335";
    sha256 = "04aab455y5wwgigfwhpa0zhmyymzcm9bprz6499gcf8ipwa45kkp";
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
    rev = "651c4fc55a285eeacbf5992b355d9c80f4fc78cb";
    sha256 = "18wjd1q15zlrcs9189p8z40a77290k8wn0dg09h8gz03638l7qsy";
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
    rev = "03d7ec956e38eaebe492b00daa0baf8760372fe0";
    sha256 = "02xjfr2zhp4pafvv8gdv36rz0c214hfrnysjy3s76ix10byi3syv";
  };
}
