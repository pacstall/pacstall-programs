name="yt-dlp"
repology=("project: ${name}")
version="2023.07.06"
url="https://github.com/${name}/${name}/archive/refs/tags/${version}.tar.gz"
build_depends=("make" "pandoc" "zip" "python3-pytest" "python3-setuptools" "python3-pip")
optdepends=("mpv: For downloading rstp streams")
depends=("python3" "ffmpeg" "python3-mutagen" "python3-websockets" "python3-secretstorage" "python3-brotli" "python3-certifi" "python3-xattr" "atomicparsley" "rtmpdump")
breaks=("${name}-git" "${name}-bin" "${name}")
description="A youtube-dl fork with additional features and fixes"
hash="dcb9dd73745b647756d3b23b705514affe456253e482f0f0a1b5be84e9e29208"
release="$(lsb_release -cs)"
modern=("devel" "sid" "lunar" "bookworm" "mantic")

# shellcheck disable=SC2076
if [[ " ${modern[*]} " =~ " ${release} " ]]; then
  pyhack=("--break-system-packages")
else
  pyhack=()
fi

prepare() {
  sudo pip3 install --upgrade pycryptodomex "${pyhack[@]}"
}

build() {
  make -j"$(nproc)" pypi-files
  python3 setup.py build
}

package() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}

removescript() {
  yes | sudo pip3 uninstall pycryptodomex "${pyhack[@]}"
}
