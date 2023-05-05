name="kicad-diff-git"
repology=("project: kicad-diff-git")
epoch="1"
homepage="https://github.com/leoheck/KiCad-Diff"
build_depends=("git" "python3-pip")
depends=("python3")
gives="kicad-diff"
description=" Scripts for performing image diffs between pcbnew layout revisions Resources"
maintainer="Marcel Robitaille <mail@marcelrobitaille.me>"
arch=("any")
provides=("kicad-diff")
conflicts=("kicad-diff")
url="https://github.com/leoheck/KiCad-Diff.git"

pkgver() {
	git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version=$(pkgver)

prepare() {
	pip install -r requirements.txt
}

install() {
	sudo mkdir -p "$pkgdir/opt/KiCad-Diff/"
	sudo mkdir -p "$pkgdir/usr/bin"
	sudo cp -r . "$pkgdir/opt/KiCad-Diff"
	for bin in "kidiff" "kicad_svg_tweaks" "plot_kicad_pcb"; do
		sudo ln -s "../../opt/KiCad-Diff/bin/$bin" "$pkgdir/usr/bin/$bin"
	done
}
