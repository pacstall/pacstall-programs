name="github-desktop-deb"
pkgname="github-desktop"
gives="github-desktop"
pkgver="3.3.10"
arch=("amd64" "arm64" "armhf")
url="https://github.com/shiftkey/desktop/releases/download/release-${pkgver}-linux1/GitHubDesktop-linux-${CARCH}-${pkgver}-linux1.deb"
homepage='https://desktop.github.com'
repology=("project: github-desktop" "visiblename: github-desktop" "repo: aur")
pkgdesc="Fork of GitHub Desktop to support various Linux distributions"
maintainer="Elsie19 <elsie19@pm.me>"
case "${CARCH}" in
  amd64)
    hash="cf3abaa7f0c0426812c38280518aadad02a420f92c2f39144231b3c0edba5a04"
    ;;
  arm64)
    hash="aec957d95ec694113a650395a7e71f37d469192c3364358fe5b9b6fe44ed853a"
    ;;
  armhf)
    hash="fd1340f570d06cdb6ef7652a49fc475ced8bbe2511af7f97359c2a7ebba2491f"
    ;;
  *) ;;
esac
