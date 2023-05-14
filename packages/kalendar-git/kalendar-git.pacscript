name="kalendar-git"
pkgname="kalendar"
url="https://invent.kde.org/pim/kalendar.git"
build_depends=("git" "cmake" "build-essential" "extra-cmake-modules" "qtbase5-dev" "qtdeclarative5-dev" "libqt5svg5-dev" "qtquickcontrols2-5-dev" "kirigami2-dev" "libkf5i18n-dev" "libkf5coreaddons-dev" "qtlocation5-dev" "qtpositioning5-dev" "libkf5mime-dev" "libkf5calendarsupport-dev" "libkf5akonadicontact-dev" "libkf5akonadi-dev" "libkf5windowsystem-dev" "libkf5package-dev" "libkf5calendarcore-dev" "libkf5configwidgets-dev" "libkf5contacts-dev" "libkf5people-dev" "libkf5eventviews-dev" "libkf5notifications-dev" "libkf5qqc2desktopstyle-dev" "ninja-build" "libgpgme-dev" "libkf5mailcommon-dev" "libkf5pimcommon-dev" "libkf5templateparser-dev" "libkf5webengineviewer-dev" "libkf5messageviewer-dev" "libkf5messagecomposer-dev" "kirigami-addons-dev")
depends=("gettext" "qml-module-org-kde-kirigami2" "qml-module-qtquick-layouts" "qml-module-qtlocation" "qml-module-qt-labs-qmlmodels" "qml-module-qtpositioning" "kdepim-runtime" "akonadi-server" "libc6" "libgcc-s1" "libkf5akonadicalendar5abi2" "libkf5akonadicontact5abi1" "libkf5akonadicore-bin" "libkf5akonadicore5abi2" "libkf5akonadiwidgets5abi1" "libkf5calendarcore5abi2" "libkf5calendarsupport5abi1" "libkf5configcore5" "libkf5configgui5" "libkf5configwidgets5" "libkf5contacts5" "libkf5coreaddons5" "libkf5dbusaddons5" "libkf5eventviews5abi1" "libkf5i18n5" "libkf5itemmodels5" "libkf5widgetsaddons5" "libkf5windowsystem5" "libkf5xmlgui5" "libqt5core5a" "libqt5dbus5" "libqt5gui5" "libqt5qml5" "libqt5quick5" "libqt5quickcontrols2-5" "libqt5widgets5" "libstdc++6" "qml-module-org-kde-kirigami2" "qml-module-qt-labs-qmlmodels" "qml-module-qtlocation" "qml-module-qtpositioning")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-app" "${pkgname}-deb")
description="A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)"
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
maintainer="Zahrun <Zahrun@github.com>"
arch=('amd64')
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  mkdir build && cd build || exit
  cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -GNinja
  ninja -j"$(nproc)"
}

install() {
  cd build || exit
  sudo cmake --install .
  sudo install -Dm644 "../LICENSES/"* -t "${pkgdir}/usr/share/licenses/${name}/"
  cd "${pkgdir}/usr/lib/x86_64-linux-gnu/" || exit
  sudo mkdir qt5
  sudo mv qml qt5
}
