pkgname="legcord-deb"
gives="legcord"
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libsecret-1-0")
repology=("project: ${gives}")

# Auto-detect latest version from GitHub
pkgver="$(
  wget -qO- https://github.com/Legcord/Legcord/releases/latest \
    | sed -n 's|.*/tag/v\([0-9.]*\)".*|\1|p' \
    | head -n1
)"

arch=('arm64' 'amd64')

# Auto-generate SHA256 sums per architecture
sha256sums_arm64=("$(
  wget -qO- "https://github.com/Legcord/Legcord/releases/download/v${pkgver}/Legcord-${pkgver}-linux-arm64.deb" \
    | sha256sum \
    | awk '{print $1}'
)")

sha256sums_amd64=("$(
  wget -qO- "https://github.com/Legcord/Legcord/releases/download/v${pkgver}/Legcord-${pkgver}-linux-amd64.deb" \
    | sha256sum \
    | awk '{print $1}'
)")

source=("https://github.com/Legcord/Legcord/releases/download/v${pkgver}/Legcord-${pkgver}-linux-${CARCH}.deb")

pkgdesc="Custom client designed to enhance your Discord experience while keeping everything lightweight"
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
