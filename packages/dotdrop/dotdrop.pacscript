name="dotdrop"
version="1.7.1"
url="https://github.com/deadc0de6/dotdrop/archive/refs/tags/v${version}.zip"
hash="165347e1950c99dfb442ea19b670d1ad2769610682a1e2bf9abf7f51b64cb61c"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
depends="python3 python3-docopt python3-setools python3-jinja2 python3-ruamel.yaml python3-magic"

prepare() {
  true
}

build() {
  true
}

install() {
  python3 setup.py install --root="$STOWDIR/$name/" --optimize=1
  sudo install -Dm644 completion/dotdrop-completion.bash "$STOWDIR/"$name"/usr/share/bash-completion/completions/${name}"
  sudo install -Dm644 completion/_dotdrop-completion.zsh "$STOWDIR/"$name"/usr/share/zsh/site-functions/_${name}"
  sudo install -Dm644 completion/dotdrop.fish "$STOWDIR/"$name"/usr/share/fish/completions/${name}.fish"
}


# vim:set ft=sh ts=2 sw=2 et:
