pkgname="u-boot-mobian-deb"
gives="u-boot-menu"
replaces=("${gives}")
arch=("all")
pkgver="4.2.2mobian1"
source=("https://repo.mobian-project.org/pool/main/u/${gives}/${gives}_${pkgver}_all.deb")
pkgdesc="Deb packaging for u-boot-menu with Mobian patches"
sha256sums=("6fffdf8359c0514e0f841cdf27726e05f582884b55e436235defc2c02d759f31")
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: u-boot-menu")
