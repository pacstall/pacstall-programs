pkgname="muse-hub-deb"
gives="muse-hub"
repology=("project: muse-hub")
arch=("amd64")
pkgver="1.0.1.451"
source=("https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/Muse_Hub.deb")
depends=("icu-devtools")
pkgdesc="Manage MuseScore Libraries"
maintainer=("Rémy Huet <remy.huet@hds.utc.fr>")
sha256sums=("0896fd96d72cb18102c2436794caffadd67382d5377b84468a514601847cc3e9")
provides=('muse-hub' 'muse-hub-service')

post_remove() {
  # This is the default place where muse-hub stores dowloaded sounds
  sudo rm -rf /srv/muse-hub
}
