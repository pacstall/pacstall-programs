name="yt-dlp"
repology=("project: ${name}")
version="2022.04.08"
url="https://github.com/${name}/${name}/releases/download/${version}/${name}.tar.gz"
build_depends="make pandoc zip pytest"
depends="python3 ffmpeg python3-mutagen python3-pip python3-websockets python3-secretstorage python3-brotli python3-certifi python3-xattr atomicparsley rtmpdump phantomjs"
breaks="${name}-git ${name}-bin ${name}"
description="A youtube-dl fork with additional features and fixes"
hash="a9ea3753977dd82f051f0674fbdc3eb5ff49a67246f4bd3cac5745702828d1db"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo pip3 install pycryptodomex
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}

postinst() {
  yt-dlp -help
}
