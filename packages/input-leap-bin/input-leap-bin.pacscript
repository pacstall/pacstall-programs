pkgname="input-leap-bin"
gives="input-leap"
pkgver="3.0.3"
pkgrel="2"
pkgdesc="Open-source KVM software"
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
repology=("project: input-leap")
depends=("libqt6widgets6" "libqt6network6" "qt6-qpa-plugins" "libavahi-compat-libdnssd1" "libxrandr2" "libxinerama1" "libxtst6" "libxi6")
depends_noble=("libei1" "libportal1")
depends_plucky=("libei1" "libportal1")
depends_questing=("libei1" "libportal1")
depends_trixie=("libei1" "libportal1")
depends_forky=("libei1" "libportal1")
depends_sid=("libei1" "libportal1")
arch=("any")
incompatible=("debian:bullseye")
sha256sums_jammy=("48516fe7ede3685da5036ae9887f2b37f98e3a8817dde1ed0704eaa844b9a863")
sha256sums_noble=("18f5f791e911bf373b2484757e60d9d38bcd7bbaae6d23bf78541eb22c337c5a")
sha256sums_plucky=("b0bd213b45aaf8dd3631dd630334d8c9d7ad973497b50fc496726228d54419e6")
sha256sums_questing=("b0bd213b45aaf8dd3631dd630334d8c9d7ad973497b50fc496726228d54419e6")
sha256sums_bookworm=("271a147bd73c3fe590635c3deee3fe424e5f8830ca4a14b7f927dc7c6fd19989")
sha256sums_trixie=("b08dd7575c57174030af5ce1eed2788e16f0543f938cfac390e46cfbb18ff53a")
sha256sums_forky=("b08dd7575c57174030af5ce1eed2788e16f0543f938cfac390e46cfbb18ff53a")
sha256sums_sid=("b08dd7575c57174030af5ce1eed2788e16f0543f938cfac390e46cfbb18ff53a")
source_jammy=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-22-04-v${pkgver}.tar.gz")
source_noble=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-24-04-v${pkgver}.tar.gz")
source_plucky=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-24-10-v${pkgver}.tar.gz")
source_questing=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-ubuntu-24-10-v${pkgver}.tar.gz")
source_bookworm=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-debian-12-v${pkgver}.tar.gz")
source_trixie=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-debian-12-latest-libei-v${pkgver}.tar.gz")
source_forky=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-debian-12-latest-libei-v${pkgver}.tar.gz")
source_sid=("https://github.com/input-leap/input-leap/releases/download/v${pkgver}/input-leap-debian-12-latest-libei-v${pkgver}.tar.gz")

package() {
  find . -name '*.tar.gz' -exec tar --strip-components=1 -xf {} \;

  find bin -type f -exec install -vDm755 '{}' "${pkgdir}/usr/{}" \;
  find share -type f -exec install -vDm644 '{}' "${pkgdir}/usr/{}" \;
}
