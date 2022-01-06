name="nodejs-lts-deb"
pkgname="nodejs-lts" # if this is a -git, -bin, etc. package, this would be the package name without extension
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app ${pkgname}-deb"
replace="${pkgname} node nodejs"
gives="${pkgname} node nodejs"
url="https://deb.nodesource.com/setup_lts.x"
description="Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine."
hash="05dc283d949b7cdd58f37385e310973c2aaa52e0f8cda08a93a5e4812d225338"
maintainer="Paul Cosma <paul.cosma97@gmail.com>"

pkgver() {
  curl -Ls https://nodejs.org/en/download | grep -o "Latest LTS Version: <strong>.*</strong>" | grep -o --color=never "[1-9][0-9]*\.[0-9]*\.[0-9]*"
}

version="$(pkgver)"

install() {
  cd "$SRCDIR"
  mkdir "$name"
  cd "$name"
  curl -fsSL https://deb.nodesource.com/setup_lts.x > install.sh
  chmod +x ./install.sh
  sudo bash ./install.sh
  # It is recommended for paths to be condensed with
  # variables and to be wrapped by double quotes
  # sudo make install DESTDIR="${STOWDIR}/${name}"
  sudo apt-get install nodejs -y

  # If the package comes already compiled, use 'install'
  # sudo install -Dm755 ${name} -t "${STOWDIR}/${name}/usr/bin"
}