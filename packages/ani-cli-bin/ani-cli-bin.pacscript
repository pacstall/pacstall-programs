name="ani-cli-bin"
pkgname="ani-cli"
version="3.3"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
hash="50e94f7b17dc3364b75da544de6047c9c7206e3d02df7811ee864d871214ee48"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli.1.gz"
}

build() {
  true
}

install() {
  sudo install -Dm755 "./ani-cli" "${STOWDIR}/${name}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${STOWDIR}/${name}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
