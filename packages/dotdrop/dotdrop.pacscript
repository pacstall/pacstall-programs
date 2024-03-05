name="dotdrop"
pkgver="1.13.2"
source=("https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${pkgver}.zip")
hash=("b69deab3cf22b0cde5faacf5d90292abcade142da0b00513dc774dfc2e8f6203")
maintainer="Elsie19 <elsie19@pm.me>"
pkgdesc="Save your dotfiles once, deploy them everywhere"
depends=("python3" "python3-docopt" "python3-setools" "python3-jinja2" "python3-ruamel.yaml" "python3-magic" "diffutils")
repology=("project: ${name}")

package() {
  sudo python3 setup.py install --root="${pkgdir}/" --optimize=1
  sudo install -Dm644 completion/dotdrop-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${name}"
  sudo install -Dm644 completion/_dotdrop-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${name}"
  sudo install -Dm644 completion/dotdrop.fish "${pkgdir}/usr/share/fish/completions/${name}.fish"
}

# vim:set ft=sh ts=2 sw=2 et:
