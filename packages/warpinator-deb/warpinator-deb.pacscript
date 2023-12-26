name="warpinator-deb"
repology=("project: warpinator" "repo: linux_mint_21_1")
gives="warpinator"
depends=("gir1.2-glib-2.0" "gir1.2-gtk-3.0" "gir1.2-xapp-1.0" "gir1.2-nm-1.0" "python3" "python3-gi" "python3-setproctitle" "python3-xapp" "python3-zeroconf" "python3-grpcio" "python3-cryptography" "python3-nacl")
pkgdesc="A tool to share files across the LAN"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"
case "${CARCH}" in
  amd64)
    _arch="amd64"
    pkgver="1.8.1+virginia"
    hash="ed98360dc13c97f59961b749a50498ca89c54b00b31a4f1c08a64be102ab0157"
    ;;
  *)
    _arch="all"
    pkgver="1.6.4+victoria"
    hash="80079695805ade880fc3779f1a40c3729b1642d459204993aa1c5babe246118d"
    ;;
esac

url="http://packages.linuxmint.com/pool/backport/w/warpinator/warpinator_${pkgver}_${_arch}.deb"
