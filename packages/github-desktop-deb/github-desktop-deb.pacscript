name="github-desktop-deb"
pkgname="github-desktop"
gives="github-desktop"
pkgver="3.3.6"
arch=("amd64" "arm64" "armhf")
url="https://github.com/shiftkey/desktop/releases/download/release-${pkgver}-linux3/GitHubDesktop-linux-${CARCH}-${pkgver}-linux3.deb"
homepage='https://desktop.github.com'
repology=("project: github-desktop" "visiblename: github-desktop" "repo: aur")
pkgdesc="Fork of GitHub Desktop to support various Linux distributions"
maintainer="Elsie19 <elsie19@pm.me>"
case "${CARCH}" in
  amd64)
    hash="f74d0985f1cdefc0ae017a6d3d7d93a13bd3f44fa0fb1457aa6966df827d97a9"
    ;;
  arm64)
    hash="2c1faf2dbfff1c69cadf1b4ace7bae20fb64b492298698e2bfa56482e6f8a584"
    ;;
  armhf)
    hash="10d0220438d04983d8dd01a12d9c44c8616244fb3a31f0152f85a8809c3fea73"
    ;;
  *) ;;
esac
