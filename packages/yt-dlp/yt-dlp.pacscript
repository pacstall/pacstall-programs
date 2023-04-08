name="yt-dlp"
repology=("project: ${name}")
version="2023.03.04"
url="https://github.com/${name}/${name}/archive/refs/tags/${version}.tar.gz"
build_depends="make pandoc zip python3-pytest python3-setuptools python3-pip"
optdepends=("mpv: For downloading rstp streams")
depends="python3 ffmpeg python3-mutagen python3-websockets python3-secretstorage python3-brotli python3-certifi python3-xattr atomicparsley rtmpdump"
breaks="${name}-git ${name}-bin ${name}"
description="A youtube-dl fork with additional features and fixes"
hash="5e5abfe78b8f92f8b8307231d1e7ed0e462407f4cd861b48a0278559612de9aa"

prepare() {
  sudo pip3 install --upgrade pycryptodomex
}

build() {
  make -j"$(nproc)" pypi-files
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}

removescript() {
  yes | sudo pip3 uninstall pycryptodomex
}
