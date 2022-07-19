name="chwp-deb"
gives="chwp"
breaks="${gives}"
replace="${gives}"
repology=("project: ${gives}")
pkgver() {
    git ls-remote --tags "https://github.com/rouhim/chwp" | cut -d/ -f3- | tail -n1 | cut -c 2-
}
version="$(pkgver)"
url="https://github.com/RouHim/chwp/releases/download/v${version}/chwp-x86-64.deb"
description="Changes the wallpaper from the command line"
maintainer="Rouven Himmelstein <rouven@himmelstein.info>"
