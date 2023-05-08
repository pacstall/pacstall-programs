name=kiri-git
repology=("project: kiri")
homepage="https://github.com/leoheck/kiri"
build_depends=("python3-pip")
depends=("build-essential" "libgtk-3-dev" "pkg-config" "opam" "python-is-python3" "python3-pip" "kicad" "dos2unix" "coreutils" "zenity" "librsvg2-bin" "imagemagick" "xdotool" "rename")
gives=("kiri")
description="A tool for reviewing Schematics and Layouts of Git-versioned Kicad-projects, visually"
maintainer="Marcel Robitaille <mail@marcelrobitaille.me>"
arch=("any")
provides=("kiri")
conflicts=("kiri")
pacdeps=("kicad-diff-git")
url="https://github.com/leoheck/kiri.git"

pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version=$(pkgver)

prepare() {
  pip install -r python-requirements.txt
  git submodule init
  git -c protocol.file.allow=always submodule update
  cd submodules/kicad_parser
  git submodule init
  git -c protocol.file.allow=always submodule update
}

install() {
  sudo mkdir -p "${pkgdir}/opt/kiri/"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo cp -r ./* "${pkgdir}/opt/kiri"
  for bin in "find_kicad5_sch_hier" "find_kicad6_sch_hier" "fix_svg_vias" "git-imgdiff" "kicad6_sheet_instances" "kicad_rev" "kicad_version" "kicad_version.py" "kicad_version_cliclick" "kicad_version_xdotool" "kiri" "kiri-file-picker" "kiri-server" "plot_kicad_sch" "plot_kicad_sch_macos" "plotgitsch_svg_tweaks"; do
    sudo ln -s "../../opt/kiri/bin/${bin}" "${pkgdir}/usr/bin/${bin}"
  done
}
