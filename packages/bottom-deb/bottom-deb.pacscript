name="bottom-deb"
gives="bottom"
arch=('amd64' 'arm64' 'armhf')
repology=("project: ${gives}")
pkgver="0.9.6"
homepage="https://clementtsang.github.io/${gives}/"
url="https://github.com/ClementTsang/${gives}/releases/download/${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
breaks=("${gives}-git" "${gives}-bin")
replace=("${gives}")
pkgdesc="A customizable cross-platform graphical process/system monitor for the terminal."
case "${CARCH}" in
amd64)
  hash="34a095029d5c74ee577e2ceb01044a5361c8622f89cdcd24784d2fdfeeb92a53"
  ;;
armhf)
  hash="f5a621b23392ba41f89376ee75aa7e2e5ed83069ea19b2ab25209ef5a28c1ccc"
  ;;
arm64)
  hash="e7f86573271cb0b17579827de0093d91b9805fa2e3a137b23767059e1c0d9c75"
  ;;
*) ;;
esac
maintainer="Nezred <jmnezred@pm.me>"
