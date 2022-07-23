name="dotdrop"
version="1.10.3"
url="https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${version}.zip"
hash="9390a5e6abe34747b21a0c1dd12d7fee8837ae87400da4fcd5d77ca6160d65ff"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
depends="python3 python3-docopt python3-setools python3-setuptools python3-jinja2 python3-ruamel.yaml python3-magic diffutils"
repology=("project: ${name}")

prepare() {
  true
}

build() {
  true
}

install() {
  sudo python3 setup.py install --root="$STOWDIR/$name/" --optimize=1
  sudo install -Dm644 completion/dotdrop-completion.bash "$STOWDIR/"$name"/usr/share/bash-completion/completions/${name}"
  sudo install -Dm644 completion/_dotdrop-completion.zsh "$STOWDIR/"$name"/usr/share/zsh/site-functions/_${name}"
  sudo install -Dm644 completion/dotdrop.fish "$STOWDIR/"$name"/usr/share/fish/completions/${name}.fish"
}

# vim:set ft=sh ts=2 sw=2 et:
