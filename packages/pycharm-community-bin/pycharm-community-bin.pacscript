name="pycharm-community-bin"
version="2021.3.3"
pkgname="pycharm-community"
gives="pycharm-community"
maintainer="Emil Aarestrup <emil@aarestrup.nu>"
description="Python IDE for professional developers aimed at productivity with a keyboard-centric focus."
url="https://download.jetbrains.com/python/pycharm-community-${version}.tar.gz"
hash="06ef4152d59b97da1186cdf288588d20d69a689fe75b2140130fa5d8326d07ad"

desktop_files_path="$STOWDIR/$name/usr/share/applications"
application_files_path="$STOWDIR/$name/usr/bin/$pkgname"

prepare() {
  sudo mkdir -p "$STOWDIR/$name" "$application_files_path" "$desktop_files_path"
}

build() {
  true
}

install() {
  sudo cp -R . "$application_files_path"

  # grab desktop file
  wget -qO "PyCharm.desktop" "https://raw.githubusercontent.com/ObsidianPresidium/pacstall-programs/master/packages/$name/PyCharm.desktop"
  sudo install -Dm644 "PyCharm.desktop" "$desktop_files_path/PyCharm.desktop"

  sudo cp $application_files_path/bin/pycharm.svg $STOWDIR/$name/usr/share/icons/pycharm.svg
}
