pkgname="hfdownloader-bin"
gives="hfdownloader"
arch=("amd64" "arm64")
pkgver="3.2.0"
pkgdesc="Simple go utility to download HuggingFace Models and Datasets"
repology=("project: hfdownloader")
url='https://github.com/bodaay/HuggingFaceModelDownloader'
source_amd64=("https://github.com/bodaay/HuggingFaceModelDownloader/releases/download/v${pkgver}/hfdownloader_linux_amd64_v${pkgver}")
source_arm64=("https://github.com/bodaay/HuggingFaceModelDownloader/releases/download/v${pkgver}/hfdownloader_linux_arm64_v${pkgver}")
sha256sum_amd64=("95622af9e8f535bc1ba569aed50e78f4cfc05d77bd9f53d7167d7d725ad8e734")
sha256sum_arm64=("74c4e535e4e8382c57edad1e27ee6d1889d502a1de153af463dbefc19e3605b5")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")

package() {
  install -Dm755 "hfdownloader_linux_${CARCH}_v${pkgver}" "${pkgdir}/usr/bin/${gives}"
}
