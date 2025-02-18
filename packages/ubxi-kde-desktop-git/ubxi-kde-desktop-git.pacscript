pkgname="ubxi-kde-desktop-git"
arch=("amd64" "arm64")
pkgver="0.0.1"
source=("https://github.com/villamorrd/ubxi-kde-desktop.git")
depends=("plasma-desktop" "konsole" "systemsettings" "plasma-nm" "plasma-disks"
  "plasma-firewall" "plasma-pa" "plasma-systemmonitor" "kinfocenter" "kmenuedit"
  "kscreen" "dolphin" "kio-extras" "kdegraphics-thumbnailers" "kde-config-gtk-style" "kde-config-screenlocker"
  "breeze-gtk-theme" "xdg-desktop-portal-gtk" "xdg-desktop-portal-kde" "ufw" "vulkan-tools"
  "wayland-utils" "pulseaudio-utils" "aha" "clinfo")
pacdeps=("rhino-ubxi-core")
optdeps=(
  "kde-spectacle: a simple application for capturing desktop screenshots"
  "ark: File archiver by KDE"
  "plasma-vault: Plasma applet and services for creating encrypted vaults"
  "plasma-thunderbolt: Plasma addons for managing Thunderbolt devices"
  "powerdevil: Global power saver settings"
)
gives="ubxi-kde-desktop"
replaces=("unicorn-desktop")
priority='required'
pkgdesc="UBXI KDE Plasma Desktop"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
incompatible=('debian:*')
license=('GPL-3.0-or-later')

build() {
  cd "${gives}"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/wallpapers"
  mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
  mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel"
  mkdir -p "${pkgdir}/usr/share/plasma/layout-templates"
  mkdir -p "${pkgdir}/usr/share/color-schemes"
  mkdir -p "${pkgdir}/etc/xdg"
}

package() {
  cd "${gives}"
  # Icons
  install -Dm644 "rhino/logos/logo.png" -t "${pkgdir}/usr/share/icons"
  install -Dm644 "rhino/logos/logo.svg" -t "${pkgdir}/usr/share/icons"

  # Wallpapers for Plasma
  cp -r rhino/wallpapers "${pkgdir}/usr/share"

  # Plasma Global Theme
  cp -r plasma/look-and-feel/org.rhinolinux.unicorn.desktop "${pkgdir}/usr/share/plasma/look-and-feel"

  # Plasma Style
  cp -r plasma/desktoptheme/unicorn "${pkgdir}/usr/share/plasma/desktoptheme"

  # Plasma Layout Template
  cp -r plasma/layout-templates/org.rhinolinux.desktop.defaultPanel "${pkgdir}/usr/share/plasma/layout-templates"

  # Unicorn color scheme
  install -Dm644 "plasma/color-schemes/Unicorn.colors" "${pkgdir}/usr/share/color-schemes"

  # Plasma config
  install -Dm644 "plasma/kcm-about-distrorc" -t "${pkgdir}/etc/xdg"
  install -Dm644 "plasma/kdeglobals" -t "${pkgdir}/etc/xdg"
}
