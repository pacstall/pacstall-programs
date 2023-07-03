name="dotdrop"
version="1.13.0"
url="https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${version}.zip"
hash="9c87b77030ee233989a1e53292dbeb1085055c1b609743e04fde06fc54477d00"
maintainer="Elsie19 <hwengerstickel@pm.me>"
description="Save your dotfiles once, deploy them everywhere"
depends=("python3" "python3-docopt" "python3-setools" "python3-setuptools" "python3-jinja2" "python3-ruamel.yaml" "python3-magic" "diffutils")
repology=("project: ${name}")

package() {
  sudo python3 setup.py install --root="${pkgdir}/" --optimize=1
  sudo install -Dm644 completion/dotdrop-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${name}"
  sudo install -Dm644 completion/_dotdrop-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${name}"
  sudo install -Dm644 completion/dotdrop.fish "${pkgdir}/usr/share/fish/completions/${name}.fish"
}

# vim:set ft=sh ts=2 sw=2 et:
