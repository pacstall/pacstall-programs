name="qtile-git"
pkgname="qtile"
version="0.21.0"
url="https://github.com/qtile/qtile.git"
license="MIT"
depends="python3-cffi xserver-xorg python3-xcffib python3-cairocffi libpangocairo-1.0-0 python3-pip python3-dbus libpulse-dev pavucontrol"
description="A full-featured, hackable tiling window manager written and configured in Python"

prepare() {
  cd "${HOME}" || exit
  git clone "${url}"
  cd qtile || exit
}

build() {
  true
}

install() {
  pip install --upgrade --no-cache --force-reinstall cairocffi
  pip3 install dbus-next
  pip3 install .
  sudo python3 setup.py install
  sudo mkdir -p /usr/src/pacstall/qtile-git
  sudo cp -r ../qtile /usr/src/pacstall/qtile-git
}

postinst() {
  echo "Creating file qtile.desktop"
  sudo touch /usr/share/xsessions/qtile.desktop
  sudo echo "[Desktop Entry]
             Name=Qtile
             Comment=Qtile Session
             Exec=qtile start
             Type=Application
             Keywords=wm;tiling" | sudo tee -a /usr/share/xsessions/qtile.desktop
  echo "Copying default config file to .config/qtile/config.py"
  mkdir "${HOME}"/.config/qtile || exit
  cp "${HOME}"/qtile/libqtile/resources/default_config.py "${HOME}"/.config/qtile/default_config.py || exit
  mv "${HOME}"/.config/qtile/default_config.py "${HOME}"/.config/qtile/config.py || exit
  echo "Installation Complete.."
  echo "Logout of the current session and Login to Qtile!"
}
