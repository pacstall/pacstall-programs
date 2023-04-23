name="dotdrop"
version="1.12.13"
url="https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${version}.zip"
hash="c9bb0b3513f983617ab27b57531024c5c160a7602d91dc9f7bdb0d486ad46f39"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Save your dotfiles once, deploy them everywhere"
depends=("python3" "python3-docopt" "python3-setools" "python3-setuptools" "python3-jinja2" "python3-ruamel.yaml" "python3-magic" "diffutils")
repology=("project: ${name}")

install() {
  sudo python3 setup.py install --root="${pkgdir}/" --optimize=1
  sudo install -Dm644 completion/dotdrop-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${name}"
  sudo install -Dm644 completion/_dotdrop-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${name}"
  sudo install -Dm644 completion/dotdrop.fish "${pkgdir}/usr/share/fish/completions/${name}.fish"
}

# vim:set ft=sh ts=2 sw=2 et:
