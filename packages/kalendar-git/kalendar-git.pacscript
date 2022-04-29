name="kalendar-git"
pkgname="kalendar"
url="https://invent.kde.org/pim/kalendar.git"
build_depends="git cmake build-essential extra-cmake-modules qtbase5-dev qtdeclarative5-dev libqt5svg5-dev qtquickcontrols2-5-dev kirigami2-dev libkf5i18n-dev libkf5coreaddons-dev qtlocation5-dev qtpositioning5-dev libkf5mime-dev libkf5calendarsupport-dev libkf5akonadicontact-dev libkf5akonadi-dev libkf5windowsystem-dev libkf5package-dev libkf5calendarcore-dev libkf5configwidgets-dev libkf5contacts-dev libkf5people-dev libkf5eventviews-dev libkf5notifications-dev libkf5qqc2desktopstyle-dev ninja-build"
depends="gettext qml-module-org-kde-kirigami2 qml-module-qtquick-layouts qml-module-qtlocation qml-module-qt-labs-qmlmodels qml-module-qtpositioning kdepim-runtime"
breaks="${pkgname} ${pkgname}-bin ${pkgname}-app ${pkgname}-deb"
description="A calendar application using Akonadi to sync with external services (Nextcloud, GMail, ...)"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  mkdir build && cd build || exit
  cmake .. -DCMAKE_INSTALL_PREFIX="${STOWDIR}/${name}/usr" -GNinja
  ninja -j"$(nproc)"
}

install() {
  sudo cmake --install .
  sudo install -Dm644 "../LICENSES/"* -t "${STOWDIR}/${name}/usr/share/licenses/${name}/"
}
