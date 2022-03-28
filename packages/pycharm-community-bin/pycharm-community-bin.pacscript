name="pycharm-community-bin"
version="2021.3.3"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="Emil Aarestrup <emil@aarestrup.nu>"
description="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
url="https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"
hash="06ef4152d59b97da1186cdf288588d20d69a689fe75b2140130fa5d8326d07ad"

prepare() {
true
}

build() {
true
}

install() {

sudo mkdir -p $STOWDIR/$name $application_files_path $desktop_files_path
sudo cp -R . $application_files_path

# create .desktop file
echo -e "[Desktop Entry]\n\
Type=Application\n\
Icon=pycharm-community\n\
Name=PyCharm Community Edition\n\
Exec=$STOWDIR/$name/$pkgname-$version/bin/pycharm.sh\n\
Path=$STOWDIR/$name/$pkgname-$version/bin\n\
Terminal=false\n\
Hidden=false\n\
Categories=Development" | sudo tee /usr/share/applications/PyCharm.desktop >> /dev/null
sudo chmod +x /usr/share/applications/PyCharm.desktop

}

removescript() {
sudo rm /usr/share/applications/PyCharm.desktop
}
