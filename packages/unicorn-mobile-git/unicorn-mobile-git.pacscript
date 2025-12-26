pkgname="unicorn-mobile-git"
source=("https://github.com/rhino-linux/unicorn.git#branch=mobile")
arch=("all")
pkgver="0.0.1"
pkgrel="6"
depends=(
  "xfwm4"
  "xfdashboard"
  "xfdashboard-plugins"
  "plank"
  "dconf-cli"
  "yaru-theme-icon"
  "yaru-theme-gtk"
  "papirus-icon-theme"
  "onboard"
  "xfce4-helpers"
  "xiccd"
  "xfce4"
  "dbus-x11"
  "hardinfo"
  "xarchiver"
  "xdg-desktop-portal-gtk"
  "xserver-xorg-video-fbdev"
  "tumbler"
  "tumbler-plugins-extra"
  "ffmpegthumbnailer"
  "bluez-firmware | linux-firmware-raspi"
  "xserver-xorg-input-multitouch"
  "xserver-xorg-input-synaptics"
  "ukui-touchpadserver"
  "pipewire-audio | pulseaudio-module-bluetooth"
  "bluetooth"
  "alsa-ucm-conf"
)
pacdeps=(
  "xfce4-settings-pine-git"
  "lightpad-git"
  "papirus-folders"
  "ulauncher-deb"
  "cortile"
  "adw-gtk-theme"
  "rhino-xfwm4-theme-git"
  "xfce4-dynamic-workspaces-rs-bin"
)
gives="unicorn-mobile"
replaces=("unicorn-desktop" "unicorn-desktop-git")
priority="required"
pkgdesc="Unicorn Desktop Mobile variant by the Rhino Linux Team"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")
backup=('etc/X11/xorg.conf.d/50-synaptics.conf')

build() {
  cd "unicorn"
  mkdir -p "${pkgdir}/usr/share/backgrounds"
  mkdir -p "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/etc/skel/.config"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/plank/themes"
  mkdir -p "${pkgdir}/usr/share/onboard"
  mkdir -p "${pkgdir}/etc/skel/.lightpad"
  mkdir -p "${pkgdir}/etc/skel/.local/share"
  mkdir -p "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  mkdir -p "${pkgdir}/usr/share/xsessions"
  mkdir -p "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  mkdir -p "${pkgdir}/usr/share/themes"
  mkdir -p "${pkgdir}/etc/X11/xorg.conf.d"
}

package() {
  cd "unicorn"
  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  # Install
  for i in xfce4 plank autostart cortile ulauncher gtk-3.0 gtk-4.0; do
    cp -r "${i}" "${pkgdir}/etc/skel/.config"
  done
  install -Dm755 "startunicorn" -t "${pkgdir}/usr/bin"
  install -Dm755 "unicorn-session" -t "${pkgdir}/usr/bin"
  install -Dm755 ".xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  install -Dm755 "xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  install -Dm755 ".bashrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  cp -r failsafe/xfce4/* "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  install -Dm644 "unicorn.desktop" -t "${pkgdir}/usr/share/xsessions"
  install -Dm644 "60-unicorn.conf" -t "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  cp -r rhino "${pkgdir}/usr/share/backgrounds/"
  cp -r rhinoplank "${pkgdir}/usr/share/plank/themes"
  cp docks.ini "${pkgdir}/etc/skel/.config"
  cp onboard.ini "${pkgdir}/usr/share/onboard"
  cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  cp icons/* "${pkgdir}/usr/share/icons"
  cp applications/* "${pkgdir}/usr/share/applications"
  cp lightpad/* "${pkgdir}/etc/skel/.lightpad"
  cp -r unicorn-dashboard "${pkgdir}/usr/share/themes"
  install -Dm644 "50-synaptics.conf" -t "${pkgdir}/etc/X11/xorg.conf.d"
  install -Dm644 "unicorn_badge-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
  cp -r onboard "${pkgdir}/etc/skel/.local/share"
  cp -r Dot-Transparent "${pkgdir}/usr/share/icons"
}

post_install() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in gtk-3.0 gtk-4.0; do
    if [[ -f "${homedir}/.config/${i}/gtk.css" && ! -f "${homedir}/.config/${i}/gtk.css-unicorn.bak" ]]; then
      mv "${homedir}/.config/${i}/gtk.css" "${homedir}/.config/${i}/gtk.css-unicorn.bak"
      cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
      sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
    fi
  done
  if [[ -f "${homedir}/.config/gtk-3.0/gtk.css" ]]; then
    sudo sed -i '/^\.-vala-panel-appmenu-core > \* {/,/^}/d' "${homedir}/.config/gtk-3.0/gtk.css"
  fi
  for i in plank autostart cortile ulauncher; do
    cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
  done
  if ! [[ -d "${homedir}/.lightpad" ]]; then
    mkdir -p "${homedir}/.lightpad"
  fi
  cp /etc/skel/.lightpad/* "${homedir}/.lightpad"
  sudo chown -cR "${PACSTALL_USER}" "${homedir}/.lightpad"
  if ! [[ -f "${homedir}/.config/docks.ini" ]]; then
    cp -r "/etc/skel/.config/docks.ini" "${homedir}/.config/docks.ini"
  fi
  sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/docks.ini"
  sudo cp "/etc/xdg/xdg-unicorn/.bashrc" "/etc/skel/.bashrc"
  papirus-folders -C violet --theme Papirus-Dark
  if ! [[ -d "${homedir}/.local/share" ]]; then
    mkdir -p "${homedir}/.local/share"
  fi
  cp -r "/etc/skel/.local/share/onboard" "${homedir}/.local/share"
  if ! [[ -f /etc/NetworkManager/conf.d/10-globally-managed-devices.conf ]]; then
    sudo mkdir -p /etc/NetworkManager/conf.d
    echo "[keyfile]" | sudo tee -a /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
    echo "unmanaged-devices=none" | sudo tee -a /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
  fi
}

post_upgrade() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  if [[ -f "${homedir}/.config/gtk-3.0/gtk.css" ]]; then
    sudo sed -i '/^\.-vala-panel-appmenu-core > \* {/,/^}/d' "${homedir}/.config/gtk-3.0/gtk.css"
  fi
  if [[ -f "${homedir}/.config/autostart/plank_theme.desktop" ]]; then
    sudo mv "${homedir}/.config/autostart/plank_theme.desktop" "${homedir}/.config/autostart/plank_theme.desktop.bak"
  fi
}
