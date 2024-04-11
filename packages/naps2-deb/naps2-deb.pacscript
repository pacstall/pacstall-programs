name="naps2-deb"
gives="naps2"
depends=("libsane2")
repology=("project: ${gives}")
pkgver="7.4.1"
arch=('arm64' 'amd64')
if [[ ${CARCH} == "arm64" ]]; then
  url="https://github.com/cyanfish/${gives}/releases/download/v${pkgver}/${gives}-${pkgver}-linux-arm64.deb"
  hash="b8e7952f99c739ab4078a87fdc797bac773754f4828938a0f1b55b51dd7bc367"
else
  url="https://github.com/cyanfish/${gives}/releases/download/v${pkgver}/${gives}-${pkgver}-linux-x64.deb"
  hash="05864de80a466889111e7f288f9336d78aeb4934b3cbc92106ce8776802a36a5"
fi
pkgdesc="NAPS2 is a document scanning application with a focus on simplicity and ease of use"
maintainer="vbrabandt2005 <vbrabandt@proton.me>"
