name="python3-levenshtein-deb"
pkgver="0.12.2-2build3"
gives="python3-levenshtein"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Forward port of Python3 Levenshtein to latest Ubuntu versions"
arch=('amd64' 'arm64')
compatible=("ubuntu:devel" "ubuntu:noble")
if [[ ${CARCH} == "arm64" ]]; then
  entry_link="ports.ubuntu.com/ubuntu-ports"
  hash="4f1df7e194b1e8994fcc74bfaaab27c275f6f5c782c9b200a9c6e8411394c3ca"
else
  entry_link="archive.ubuntu.com/ubuntu"
  hash="cb1b5c7062b3ea13ce77c2a7df55f6d552af6c34419c4d328a29b6fa3b583200"
fi
url="http://${entry_link}/pool/universe/p/python-levenshtein/${gives}_${pkgver}_${CARCH}.deb"
