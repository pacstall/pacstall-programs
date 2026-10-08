pkgname="dotdrop"
arch=("all")
pkgver="1.16.2"
source=("@${pkgname}~${pkgver}::https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${pkgver}.zip")
sha256sums=("f331a9cc9e32f54aa97869e2e26d5b92f1b7d164295da54ea22b578f017d2a32")
maintainer=("Elsie19 <elsie19@pm.me>")
pkgdesc="Save your dotfiles once, deploy them everywhere"
depends=("python3" "python3-docopt" "python3-setools" "python3-jinja2" "python3-ruamel.yaml" "python3-magic" "diffutils")
repology=("project: ${pkgname}")

package() {
  cd "${pkgname}~${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 completion/dotdrop-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion/_dotdrop-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 completion/dotdrop.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
}

# vim:set ft=sh ts=2 sw=2 et:
