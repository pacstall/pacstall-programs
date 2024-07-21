pkgname="lutris-git"
gives="lutris"
pkgver="0.5.17"
pkgdesc="Open Gaming Platform"
url='https://lutris.net'
license=("GPL-3.0-or-later")
provides=("${gives}-git")
conflicts=("${gives}-deb" "${gives}")
source=("git+https://github.com/lutris/lutris.git")
sha256sums=("SKIP")
depends=("cabextract"
  "curl"
  "libglib2.0-0"
  "libgtk-3-0"
  "hicolor-icon-theme"
  "mesa-utils"
  "p7zip"
  "psmisc"
  "python3-cairo"
  "python3-certifi"
  "python3-dbus"
  "python3-distro"
  "python3-gi-cairo"
  "python3-gi"
  "python3-lxml"
  "python3-pillow"
  "python3-requests"
  "python3-yaml"
  "unzip"
  "libwebkit2gtk-4.1-0"
  "xdg-desktop-portal"
  "xdg-utils"
  "libxrandr2")
pacdeps=("python3-moddb")
makedepends=("git" "meson" "gettext" "desktop-file-utils" "appstream-util")
checkdepends=("libappstream-glib-dev")
optdepends=('fluidsynth: For games that have MIDI music'
  'gamemode: Allows games to request a temporary set of optimisations'
  'gamescope: Draw the game window isolated from your desktop'
  'gvfs: GVFS backend'
  'innoextract: Extract Inno Setup installers'
  'mesa-vulkan-drivers: Vulkan support'
  'linux-steam-integration: start Steam with LSI'
  'mangohud: Display the games FPS + other information'
  'python3-evdev: Controller support'
  'python3-pefile: Extract icons from Windows executables'
  'python3-protobuf: BattleNet integration'
  'python3-pypresence: Discord Rich Presence integration'
  'libvkd3d1: DirectX 12 support'
  'vulkan-icd: Vulkan support'
  'vulkan-tools: Vulkan support'
  'wine: easiest way to get all the libraries missing from the Lutris runtime'
  'winetricks: use system winetricks'
  'libc6:i386: for 32bit games support'
  'mangohud:i386: Display the games FPS + other information'
  'libvkd3d1:i386: DirectX 12 support'
  'mesa-vulkan-drivers:i386: lib32 Vulkan support')
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "${gives}"
}

build() {
  meson "${gives}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
