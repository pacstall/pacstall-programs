name="thorium-deb"
gives="thorium-browser"
pkgver="119.0.6045.214"
homepage="https://thorium.rocks"
arch=('arm64' 'amd64' 'i386')
case "${CARCH}" in
  arm64)
    url="https://github.com/Alex313031/Thorium-Raspi/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
    hash="811dded7557b0ca9a93c3a50e5ce6658f2d185b9858443a76d359485598856b5"
    ;;
  i386)
    url="https://github.com/Alex313031/Thorium-Other/releases/download/${pkgver}-2/${gives}_${pkgver}_${CARCH}.deb"
    hash="ee5443c8547bb1828e7a105fb5f1ca4eaa43d5a16fd683a37bb1b2e9f57db21c"
    ;;
  amd64)
    if grep -q avx2 /proc/cpuinfo; then
      url="https://github.com/Alex313031/Thorium-Other/releases/download/${pkgver}/${gives}_${pkgver}_AVX2.deb"
      hash="ad575d63d7706a29bb2084c8146b88c781495aa196914d846696d64dbd5e5dcf"
    elif grep -q avx /proc/cpuinfo; then
      url="https://github.com/Alex313031/thorium/releases/download/M${pkgver}/${gives}_${pkgver}_${CARCH}.deb"
      hash="5e4f5ffb357ae37dbb3dc3ed2da46cd47781037d3cd6f3cb59d77572724f8e5a"
    else
      url="https://github.com/Alex313031/Thorium-SSE3/releases/download/M${pkgver}/${gives}_${pkgver}_SSE3.deb"
      hash="cc2c0033f9743788840abbfbed3b6bc952a8dca827c7703cbad2cdf2ba876b82"
    fi
    ;;
  *) ;;
esac
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Chromium fork for linux with extra patches"
repology=("project: thorium-browser")
