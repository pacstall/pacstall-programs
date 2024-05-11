pkgname="unicorn-desktop-git"
source=("https://github.com/rhino-linux/unicorn.git")
pkgver="0.0.1"
pkgrel="2"
depends=("xfwm4" "xfdashboard" "xfdashboard-plugins" "xfce4-appmenu-plugin" "vala-panel-plugins-wnck"
  "vala-panel-appmenu" "appmenu-gtk2-module" "appmenu-gtk3-module" "xfce4-power-manager"
  "xfce4-power-manager-plugins" "xfce4-pulseaudio-plugin" "xfce4-helpers" "pavucontrol"
  "plank" "dconf-cli" "yaru-theme-icon" "yaru-theme-gtk" "papirus-icon-theme" "firmware-sof-signed"
  "dbus-x11" "hardinfo" "xarchiver" "xdg-desktop-portal-gtk" "xserver-xorg-video-vesa"
  "xserver-xorg-video-fbdev" "light-locker" "light-locker-settings" "tumbler" "tumbler-plugins-extra"
  "ffmpegthumbnailer" "bluez-firmware" "xserver-xorg-input-multitouch" "xserver-xorg-input-synaptics"
  "ukui-touchpadserver" "pipewire-audio" "bluetooth")
pacdeps=("lightpad-git" "papirus-folders" "ulauncher-deb" "cortile-bin")
gives="unicorn-desktop"
replaces=("unicorn-mobile" "unicorn-mobile-git")
priority="required"
pkgdesc="Unicorn Desktop by the Rhino Linux Team"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")

build() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/share/backgrounds"
  mkdir -p "${pkgdir}/usr/share/doc"
  mkdir -p "${pkgdir}/etc/skel/.config"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/plank/themes"
  mkdir -p "${pkgdir}/etc/skel/.lightpad"
  mkdir -p "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  mkdir -p "${pkgdir}/usr/share/xsessions"
  mkdir -p "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  mkdir -p "${pkgdir}/usr/share/themes"
  mkdir -p "${pkgdir}/etc/X11/xorg.conf.d"
}

package() {
  cd "${_archive}"
  # Install doc
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  # Install
  for i in xfce4 plank autostart cortile ulauncher; do
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
  cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  cp icons/* "${pkgdir}/usr/share/icons"
  cp applications/* "${pkgdir}/usr/share/applications"
  cp lightpad/* "${pkgdir}/etc/skel/.lightpad"
  cp -r unicorn-dashboard "${pkgdir}/usr/share/themes"
  install -Dm644 "50-synaptics.conf" -t "${pkgdir}/etc/X11/xorg.conf.d"
  install -Dm644 "unicorn_badge-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
}

post_install() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in plank autostart cortile ulauncher; do
    cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/${i}"
  done
  if ! [[ -d "${homedir}/.lightpad" ]]; then
    mkdir -p "${homedir}/.lightpad"
  fi
  cp /etc/skel/.lightpad/* "${homedir}/.lightpad"
  if ! [[ -f "${homedir}/.config/docks.ini" ]]; then
    cp -r "/etc/skel/.config/docks.ini" "${homedir}/.config/docks.ini"
  fi
  sudo chown -cR "${PACSTALL_USER}" "${homedir}/.config/docks.ini"
  sudo cp "/etc/xdg/xdg-unicorn/.bashrc" "/etc/skel/.bashrc"
  papirus-folders -C violet --theme Papirus-Dark
  if ! [[ -f /etc/NetworkManager/conf.d/10-globally-managed-devices.conf ]]; then
    echo "[keyfile]" | sudo tee -a /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
    echo "unmanaged-devices=none" | sudo tee -a /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
  fi
}
