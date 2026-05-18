pkgname="lutris-deb"
arch=("all")
pkgver="0.5.22"
gives="lutris"
repology=("project: lutris")
source=("https://github.com/lutris/lutris/releases/download/v${pkgver}/lutris_${pkgver}_all.deb")
depends=("python3-gi-cairo")
optdepends=("fluidsynth: For games that have MIDI music"
  "gamemode: Allows games to request a temporary set of optimisations"
  "innoextract: Extract Inno Setup installers"
  "mesa-vulkan-drivers: Vulkan support"
  "mangohud: Display the games FPS + other information"
  "python3-evdev: Controller support"
  "python3-pefile: Extract icons from Windows executables"
  "python3-protobuf: BattleNet integration"
  "wine: easiest way to get all the libraries missing from the Lutris runtime"
  "winetricks: use system winetricks"
  "mesa-vulkan-drivers:i386: lib32 Vulkan support")
pkgdesc="Open source gaming platform"
sha256sums=("88a350357e0438b423cdf93108f27942de094dc19f973df73839f3b0b0bafaa0")
maintainer=("Oren Klopfer <oren@taumoda.com>" "pejuton <pejuton@proton.me>")
license=("GPL-3.0-only")
url='https://lutris.net'
