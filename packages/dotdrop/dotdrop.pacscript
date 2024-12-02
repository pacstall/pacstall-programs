pkgname="dotdrop"
arch=("all")
pkgver="1.13.2"
source=("@${pkgname}~${pkgver}::https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${pkgver}.zip")
sha256sums=("b69deab3cf22b0cde5faacf5d90292abcade142da0b00513dc774dfc2e8f6203")
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
