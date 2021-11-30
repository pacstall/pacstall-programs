name="epson-printer-utility-deb"
gives="epson-printer-utility"
version="1.1.1-1lsb3.2"
url="https://download3.ebz.epson.net/dsc/f/03/00/13/07/74/f70da64c23f7901ec278896fbbe6fce911011521/${gives}_${version}_amd64.deb"
depends="lsb libqtgui4"
ppa=("gezakovacs/ppa")
description="This is a Printer Utility program for Epson Printer Driver. Using this software, you can check ink levels, view error and other status... on EPSON Printers."
hash="417b637173c0b866a94eb5d9785aecbcd10fc99fd1d7149eb49f02f450e6b61f"
maintainer="Zahrun <Zahrun@github.com>"

postinst() {
  # install .desktop file
  wget -q https://gist.github.com/Zahrun/0759d7356d7b55985292b65642e976f6/raw/c9ef796e550812456dc2990879118ad1a481d792/epson-printer-utility.desktop
  sudo install -Dm644 "$gives.desktop" "/usr/share/applications/"
  # enable service to avoid communication error
  sudo systemctl enable ecbd.service
  sudo systemctl start ecbd.service
  # fix ppa if ubuntu release is posterior to groovy
  codename=$(lsb_release -cs)
  case $codename in
    focal | groovy) ;;

    *)
      sudo sed -i "s/$codename/groovy/g" "/etc/apt/sources.list.d/gezakovacs-ubuntu-ppa-$codename.list"
      ;;
  esac
  sudo apt update
  sudo apt install -y libqtgui4
}

removescript() {
  sudo rm /usr/share/applications/${gives}.desktop
  sudo systemctl disable ecbd.service
  sudo systemctl stop ecbd.service
}
