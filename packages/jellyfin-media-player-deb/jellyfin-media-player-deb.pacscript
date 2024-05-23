pkgname="jellyfin-media-player-deb"
gives="jellyfin-media-player"
pkgver="1.10.1"
arch=('amd64')
breaks=("${pkgname}-bin" "${pkgname}" "${pkgname}-app")
incompatible=("debian:sid")
pkgdesc="Jellyfin desktop client using jellyfin-web with embedded MPV player"
source=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-${DISTRO#*:}.deb")
sha256sums_trixie=("6e0a75bab90d77e6eb18caba074d2057696e1307d33343ae8ef3370f34f0c271")
sha256sums_noble=("84c4c778efa82fba76487848286883c469b18bba6d24a51c6be6c82532676b3f")
sha256sums_jammy=("7d8cfb451895c8128729f1a00b28236d4d90e78796bf110384320882ace7c41a")
sha256sums_mantic=("cb065679575bc1e43e3e66a623baf33bde9a825ff097832b3b148b381d694827")
if [[ ! "trixie noble jammy mantic" =~ ${DISTRO#*:} ]]; then
  source=("https://github.com/jellyfin/jellyfin-media-player/releases/download/v${pkgver}/${gives}_${pkgver}-1_amd64-bookworm.deb")
  sha256sums=("eb3cb89140cf1ddf8f54c5457fe052d6875b8ec63cbaa6a8f48d4997cfe583f7")
fi
maintainer=("Gianluca Mastrolonardo <gianlucamastrolonardo10@gmail.com>")
repology=("project: ${gives}")

# vim:set ft=sh ts=2 sw=2 et:
