pkgname="pnpm-bin"
gives="pnpm"
pkgver="11.24.0"
arch=("amd64" "arm64")
maintainer=("Ren Tatsumoto <tatsu@autistici.org>")
pkgdesc="Fast, disk space efficient package manager"
url='https://pnpm.io'
license=("MIT")
repology=("project: pnpm")
depends=("libatomic1")
breaks=("${gives}" "${gives}-git" "${gives}-deb" "${gives}-app")
replaces=("${gives}")
source=("LICENSE::https://raw.githubusercontent.com/pnpm/pnpm/v${pkgver}/LICENSE")
sha256sums=("4b8e2a57502758b2d034ece9cabf19dd098c5609003ed8dbdafd085274f25bd9")
source_amd64=("https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-x64.tar.gz")
sha256sums_amd64=("0a9b76dedb5fe8cc5e7f3a9fd70854181cfb08a487ebaf0c9cfb044dc860936c")
source_arm64=("https://github.com/pnpm/pnpm/releases/download/v${pkgver}/pnpm-linux-arm64.tar.gz")
sha256sums_arm64=("52f9cd410ef3bbb1cdd79c399b27772fa6d929bc3cf7c80ff3923a81e1c93be3")

package() {
  install -Dm755 "${srcdir}/pnpm" "${pkgdir}/usr/lib/pnpm/pnpm"
  cp -dr --no-preserve='ownership' "${srcdir}/dist" "${pkgdir}/usr/lib/pnpm/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/bin"
  cat <<- 'EOF' > "${pkgdir}/usr/bin/pnpm"
	#!/bin/sh
	exec /usr/lib/pnpm/pnpm "$@"
	EOF
  chmod 755 "${pkgdir}/usr/bin/pnpm"
}
