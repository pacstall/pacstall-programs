name="naps2-deb"
gives="naps2"
depends=("libsane2")
repology=("project: ${gives}")
pkgver="7.4.2"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/cyanfish/${gives}/releases/download/v${pkgver}/${gives}-${pkgver}-linux-arm64.deb"
  hash="b81bedd28f2f1774fc0fb7c9e5b60ace295b148214239bbfca46df6c198b305d"
else
  url="https://github.com/cyanfish/${gives}/releases/download/v${pkgver}/${gives}-${pkgver}-linux-x64.deb"
  hash="8ed4d4cf00b8270f841510b2cb848ddfa7627fcd60b8f29adb30878b5b56d48a"
fi
pkgdesc="NAPS2 is a document scanning application with a focus on simplicity and ease of use"
maintainer="vbrabandt2005 <vbrabandt@proton.me>"
