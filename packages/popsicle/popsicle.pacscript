name="popsicle"
pkgname="popsicle"
version="1.3.0"
url="https://github.com/pop-os/popsicle/archive/refs/tags/1.3.0.zip"
license="MIT"
build_depends="cargo make help2man"
depends=""
gives="popsicle"
breaks=""
description="Multiple USB File Flasher"
hash="4dd0f92f46d0befabd56c0cea50829b4db6d2ae8a8673e3d31c7e4228b02248b "

build() {
  make -j$(nproc)
}

install() {
   make install DESTDIR=/usr/src/pacstall/popsicle
}
