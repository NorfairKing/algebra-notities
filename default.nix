{ pkgs ? import (import ./nixpkgs.nix) {}
}:

with pkgs;

let
  gitignoreSrc = pkgs.fetchFromGitHub {
    owner = "hercules-ci";
    repo = "gitignore";
    # put the latest commit sha of gitignore Nix library here:
    rev = "7415c4feb127845553943a3856cbc5cb967ee5e0";
    # use what nix suggests in the mismatch message here:
    sha256 = "sha256:1zd1ylgkndbb5szji32ivfhwh04mr1sbgrnvbrqpmfb67g2g3r9i";
  };
  inherit (import gitignoreSrc { inherit (pkgs) lib; }) gitignoreSource;

in
stdenv.mkDerivation {
  name = "algebra-notities";
  buildInputs = [ (texlive.combine {
                    inherit
                        (texlive)
                        scheme-basic
                        latexmk
                        babel-dutch
                        subfiles
                        algorithm2e
                        ifoddpage
                        relsize
                        todonotes
                        xkeyval
                        xcolor
                        pgf # tiks.sty
                        units # nicefrac.sty
                        libertine
                        mweights
                        fontaxes
                        newtx # newtxmath.sty
                        etoolbox
                        lastpage
                        float
                        mdframed
                        l3kernel # xparse.sty
                        l3packages # xparse.sty
                        needspace
                        fancyvrb
                        listings
                        txfonts # Weird error about txmi
                        times # Werid error about ptmr8r
                        boondox # Weird error about zxxrl7z
                      ;
                  })

                ];
  src = gitignoreSource ./.;
  phases = "unpackPhase buildPhase";
  buildPhase = ''
    latexmk -pdf main.tex
    mkdir -p $out
    cp -r main.pdf $out/algebra-notities.pdf
  '';
}
