_majorver=21
_completever=21.0.10
_updatever=7
pkgrel=1
pkgver=${_completever}.u${_updatever}
_tag_ver=${_completever}+${_updatever}
_versuffix=U

pkgname=temurin-21-jdk
pkgdesc="Eclipse Temurin ${_majorver}"
arch=('amd64')
url='https://adoptium.net/'
license=('GPL-2.0')

depends=('libxrender1' 'libxtst6' 'libasound2t64')
optdepends=('libgtk-3-0t64: GUI')
provides=("temurin-21-jre")
options=(!strip)
maintainer=("Matthias Mailänder <matthias@mailaender.name>")

source=("https://github.com/adoptium/temurin${_majorver}-binaries/releases/download/jdk-${_tag_ver/+/%2B}/OpenJDK${_majorver}${_versuffix}-jdk_x64_linux_hotspot_${_tag_ver/+/_}.tar.gz")
sha256sums=('ea3b9bd464d6dd253e9a7accf59f7ccd2a36e4aa69640b7251e3370caef896a4')

_jvmdir="/usr/lib/jvm/temurin-${_majorver}-jdk-${CARCH}"
_jdkdir=jdk-${_tag_ver}

package() {
  install -dm 755 "${pkgdir}${_jvmdir}"
  cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"
}

post_install() {
  update-alternatives --install /usr/bin/java java "/usr/lib/jvm/temurin-21-jdk-${CARCH}/bin/java" 3000
}
