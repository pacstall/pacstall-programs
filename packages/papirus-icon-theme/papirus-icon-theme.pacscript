name="papirus-icon-theme"
version="20230104"
description="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${version}/${name}-${version}.tar.gz"
hash="a3e91076f41bd01c754237c9f8339d1c02e286c00998f86be471ffc280542d28"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks=("${name}" "${name}-git")
depends=("gtk-update-icon-cache")
build_depends=("make")

package() {
  sudo make DESTDIR="${pkgdir}" install
}
