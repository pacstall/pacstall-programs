name="python3-levenshtein-deb"
pkgver="0.12.2-2+b5"
gives="python3-levenshtein"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Forward port of Python3 Levenshtein to latest Ubuntu versions"
arch=('amd64' 'arm64')
compatible=("ubuntu:devel" "ubuntu:noble")
if [[ ${CARCH} == "arm64" ]]; then
  hash="2ec9244df249c70f844823bcd24548c9a4f4897f74198dd90118a0f33055638d"
else
  hash="4c1dc750b05d670ee3ac4c7d2f6151a461417f1ff8a65b59c6cff5a40e83bf35"
fi
url="http://ftp.debian.org/debian/pool/main/p/python-levenshtein/${gives}_${pkgver}_${CARCH}.deb"
