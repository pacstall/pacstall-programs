name="dotdrop"
version="1.9.0"
url="https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${version}.zip"
hash="708041846c0f67c595c56e329cf530cfd370346d46e88ed1fae46d3987c6c319"
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
