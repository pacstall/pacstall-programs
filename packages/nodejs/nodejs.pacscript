name="nodejs"
pkgname="nodejs" # if this is a -git, -bin, etc. package, this would be the package name without extension
breaks="${pkgname} ${pkgname}-git ${pkgname}-bin ${pkgname}-app ${pkgname}-deb"
replace="${pkgname} node"
gives="${pkgname} node"
depends="python3 g++ make"
description="Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine."
maintainer="Paul Cosma <paul.cosma97@gmail.com>"

pkgver() {
 curl -Ls https://nodejs.org/en/download | grep -o "Latest LTS Version: <strong>.*</strong>" | grep -o --color=never "[1-9][0-9]*\.[0-9]*\.[0-9]*"
}

version="$(pkgver)"
url="https://github.com/nodejs/node/archive/v$version/nodejs-$version.tar.gz"
hash="fbfc347c0f07df1d575b27f660abda97b65f336577797ba56a8837385ddb5fc6d55bf80c95042ff74ad9f4bd12e5188672b8f307a085287db89e1b9fdaba2567"

build() {
  cd "node-$version"
  ./configure
  make -j"$(nproc)"
}

install() {
  git clone -b "$version" "$url"
  cd node

  # It is recommended for paths to be condensed with
  # variables and to be wrapped by double quotes
  sudo make install DESTDIR="${STOWDIR}/${name}"

  # If the package comes already compiled, use 'install'
  # sudo install -Dm755 ${name} -t "${STOWDIR}/${name}/usr/bin"
}