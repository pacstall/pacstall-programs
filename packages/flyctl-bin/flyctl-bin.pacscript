name="flyctl-bin"
repology=("project: flyctl")
pkgver="0.2.31"
arch=("amd64" "arm64")
if [[ ${CARCH} == amd64 ]]; then
    hash="2af82bd13c9fed05fd11682ddc646c436353c87519d91482350d7a0edbb59841"
    arch_suffix="x86_64"
else
    hash="b7d5b38c6e6e0d6907520db81caf66cefd086a34d959b9d1fcf7427510f63c60"
    arch_suffix="arm64"
fi
url="https://github.com/superfly/flyctl/releases/download/v${pkgver}/flyctl_${pkgver}_Linux_${arch_suffix}.tar.gz"
pkgdesc="Command line tool for fly.io services"
homepage='https://fly.io'
maintainer="Andrew Barchuk <andrew@raindev.io>"

package() {
  sudo install -Dm755 "./flyctl" -t "${pkgdir}/usr/bin"
  sudo ln -s /usr/bin/flyctl "${pkdir}/usr/bin/fly"
}

# vim:set ft=sh ts=2 sw=2 et:
