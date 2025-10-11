pkgname="direnv-bin"
gives="direnv"
pkgver="2.37.1"
pkgdesc="A shell extension that manages your environment"
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
repology=("project: direnv")
arch=("amd64" "arm64" "armel" "i386" "ppc64el" "s390x")
conflict=("direnv")
depends=("libc6>=2.32")
replaces=("${conflicts[@]}")
source=("${pkgname}~${pkgver}::https://github.com/direnv/direnv.git#tag=v${pkgver}")
sha256sums=("c8ec5e3152420121179e74a92589c4a65158f4e21cc35dc838541feb5c28b734")
source_amd64=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-amd64")
sha256sums_amd64=("1f1b93dd6f38523fde26dfac96151ef9d31a374e3005cd3345fb93555ae0c9b5")
source_arm64=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-arm64")
sha256sums_arm64=("2a9cef8d73521d6a3ec3f2871c4b747b8c4cc038628c1b57a7efa42b393a2d82")
source_armel=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-arm")
sha256sums_armel=("ab141dd906735c7f0b291bd5d0c569143056cfcbcfa6747ed800f368c4206908")
source_i386=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-386")
sha256sums_i386=("daf4f85043b7073067847fe23b39f2ef3cd9ff9ebb791cd760ce5ce13ec2488d")
source_ppc64el=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-ppc64le")
sha256sums_ppc64el=("8555ed5e6ac1e011108e27ad4466588d3fabf6b65c0c777329e5730aa0feeaf0")
source_s390x=("direnv::https://github.com/direnv/direnv/releases/download/v${pkgver}/direnv.linux-s390x")
sha256sums_s390x=("c8ec5e3152420121179e74a92589c4a65158f4e21cc35dc838541feb5c28b734")

package() {
  install -Dm755 direnv -t "${pkgdir}/usr/bin"
  cd "${pkgname}~${pkgver}"
  cd man
  find . -name '*.1' -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/man/man1/{}" \;
}
