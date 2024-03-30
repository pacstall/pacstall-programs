name="stremio-deb"
gives="stremio"
breaks=("${gives}-bin" "${gives}-git")
repology=("project: ${gives}")
replace=("${gives}")
pkgver="4.4.168"
arch=('amd64')
pacdeps=("libssl1.1-deb" "libfdk-aac1-deb")
url="https://dl.strem.io/shell-linux/v${pkgver}/${gives}_${pkgver}-1_amd64.deb"
pkgdesc="Stremio is a free and open-source software that lets you watch movies, TV shows, web channels, sport, podcasts and more across your devices"
hash="1028f1a38a70fc66bfcda1c8a9e1674231e17ac81774fc48859ed8f53c7a6039"
maintainer="Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>"

# vim:set ft=sh ts=2 sw=2 et:
