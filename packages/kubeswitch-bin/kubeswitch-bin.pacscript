pkgname="kubeswitch-bin"
gives="switcher"
repology=("project: kubeswitch")
arch=('amd64' 'arm64')
pkgver="0.9.3"
sha256sums_amd64=("8554ac5b8767ec337025e01d468bcf9e90be56a0b23891bbb47ecfe4191fa56f")
sha256sums_arm64=("7597a5f9f755100969e10ec2f6142dcd9b1ec4012adc227a3aa90ea04964974d")
source_amd64=("${gives}~${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_amd64")
source_arm64=("${gives}~${pkgver}::https://github.com/danielfoehrKn/kubeswitch/releases/download/${pkgver}/switcher_linux_arm64")
pkgdesc="The kubectx for operators"
maintainer=("faelau <git@faessler.sh>")

package() {
  install -Dm755 "${gives}~${pkgver}" "${pkgdir}/usr/bin/${gives}"
  # install init functions
  "${pkgdir}/usr/bin/${gives}" init bash | install -Dm644 /dev/stdin "${pkgdir}/etc/profile.d/kubeswitch.sh"
  "${pkgdir}/usr/bin/${gives}" init fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_functions.d/kubeswitch.fish"
  "${pkgdir}/usr/bin/${gives}" init zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/vendor-functions/switch"
}
