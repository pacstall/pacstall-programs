pkgname="flyctl-bin"
repology=("project: flyctl")
pkgver="0.2.31"
arch=("amd64" "arm64")
sha256sums_amd64=("2af82bd13c9fed05fd11682ddc646c436353c87519d91482350d7a0edbb59841")
sha256sums_arm64=("b7d5b38c6e6e0d6907520db81caf66cefd086a34d959b9d1fcf7427510f63c60")
if [[ ${CARCH} == amd64 ]]; then
    arch_suffix="x86_64"
else
    arch_suffix="arm64"
fi
source=("https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_${arch_suffix}.tar.gz")
pkgdesc="Command line tool for fly.io services"
homepage='https://fly.io'
maintainer=("Andrew Barchuk <andrew@raindev.io>")

package() {
  cd "${_archive}"
  install -Dm755 "./flyctl" -t "${pkgdir}/usr/bin"
  ln -s /usr/bin/flyctl "${pkdir}/usr/bin/fly"
}

# vim:set ft=sh ts=2 sw=2 et:
