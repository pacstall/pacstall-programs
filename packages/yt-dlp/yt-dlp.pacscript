name="yt-dlp"
repology=("project: ${name}")
version="2023.06.22"
url="https://github.com/${name}/${name}/archive/refs/tags/${version}.tar.gz"
build_depends=("make" "pandoc" "zip" "python3-pytest" "python3-setuptools" "python3-pip")
optdepends=("mpv: For downloading rstp streams")
depends=("python3" "ffmpeg" "python3-mutagen" "python3-websockets" "python3-secretstorage" "python3-brotli" "python3-certifi" "python3-xattr" "atomicparsley" "rtmpdump")
breaks=("${name}-git" "${name}-bin" "${name}")
description="A youtube-dl fork with additional features and fixes"
hash="6eba89cbcac49b2dab21bbd9ad272c88fb1e97503c839b6fe72e99c02539940e"
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

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}

removescript() {
  yes | sudo pip3 uninstall pycryptodomex "${pyhack[@]}"
}
