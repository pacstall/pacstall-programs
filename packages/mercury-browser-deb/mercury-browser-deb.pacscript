name="mercury-browser-deb"
gives="mercury-browser"
pkgver="121.0.1"
arch=('amd64')
if grep -q avx /proc/cpuinfo; then
  url="https://github.com/Alex313031/Mercury/releases/download/v.${pkgver}/${gives}_${pkgver}_amd64.deb"
  hash="ce046b4d1c1dbe6c7a02165af16bf2720d813b48dc7d9208b0cee807255251a4"
else
  url="https://github.com/Alex313031/Mercury/releases/download/v.${pkgver}/${gives}_${pkgver}_SSE3.deb"
  hash="f6d848decd5ae459c48a637578542b54de669ee0e1a699d53e98ef2903a4c38f"
fi
maintainer="vigress8 <vig@disroot.org>"
pkgdesc="Firefox fork with compiler optimizations and patches"
repology=("project: mercury-browser")
