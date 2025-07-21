pkgname="jsonnet-bundler-bin"
gives="jb"
repology=("project: jsonnet-bundler")
arch=('amd64' 'arm64')
pkgver="0.6.0"
sha256sums_amd64=("78e54afbbc3ff3e0942b1576b4992277df4f6beb64cddd58528a76f0cd70db54")
sha256sums_arm64=("19f2da64816137cd87a82dd963c752ff4b7c8701fc1ed7b979c356321dcf3f5a")
source_amd64=("${gives}~${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-amd64")
source_arm64=("${gives}~${pkgver}::https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${pkgver}/jb-linux-arm64")
pkgdesc="Jsonnet package manager"
maintainer=("faelau <git@faessler.sh>")

package() {
  install -Dm755 "${gives}~${pkgver}" "${pkgdir}/usr/bin/${gives}"
}
