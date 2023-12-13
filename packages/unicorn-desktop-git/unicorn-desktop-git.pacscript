name="unicorn-desktop-git"
url="https://github.com/rhino-linux/unicorn.git"
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
replace=("unicorn-mobile" "unicorn-mobile-git")
priority="required"
pkgdesc="Unicorn Desktop by the Rhino Linux Team"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
incompatible=("debian:*")

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  sudo mkdir -p "${pkgdir}/usr/share/plank/themes"
  sudo mkdir -p "${pkgdir}/etc/skel/.lightpad"
  sudo mkdir -p "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  sudo mkdir -p "${pkgdir}/usr/share/xsessions"
  sudo mkdir -p "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  sudo mkdir -p "${pkgdir}/usr/share/themes"
  sudo mkdir -p "${pkgdir}/etc/X11/xorg.conf.d"
}

package() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  for i in xfce4 plank autostart cortile ulauncher; do
    sudo cp -r "${i}" "${pkgdir}/etc/skel/.config"
  done
  sudo install -Dm755 "startunicorn" -t "${pkgdir}/usr/bin"
  sudo install -Dm755 "unicorn-session" -t "${pkgdir}/usr/bin"
  sudo install -Dm755 ".xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  sudo install -Dm755 "xinitrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  sudo install -Dm755 ".bashrc" -t "${pkgdir}/etc/xdg/xdg-unicorn"
  sudo cp -r failsafe/xfce4/* "${pkgdir}/etc/xdg/xdg-unicorn/xfce4"
  sudo install -Dm644 "unicorn.desktop" -t "${pkgdir}/usr/share/xsessions"
  sudo install -Dm644 "60-unicorn.conf" -t "${pkgdir}/usr/share/lightdm/lightdm.conf.d"
  sudo cp -r rhino "${pkgdir}/usr/share/backgrounds/"
  sudo cp -r rhinoplank "${pkgdir}/usr/share/plank/themes"
  sudo cp docks.ini "${pkgdir}/etc/skel/.config"
  sudo cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  sudo cp icons/* "${pkgdir}/usr/share/icons"
  sudo cp applications/* "${pkgdir}/usr/share/applications"
  sudo cp lightpad/* "${pkgdir}/etc/skel/.lightpad"
  sudo cp -r unicorn-dashboard "${pkgdir}/usr/share/themes"
  sudo install -Dm644 "50-synaptics.conf" -t "${pkgdir}/etc/X11/xorg.conf.d"
  sudo install -Dm644 "unicorn_badge-symbolic.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/places"
  sudo install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  sudo install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
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
