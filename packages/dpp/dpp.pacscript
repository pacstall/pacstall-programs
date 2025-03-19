pkgname="dpp"
_pkgname="DPP"
_relname="libdpp"
arch=("amd64" "arm64" "i386")
pkgrel="1"
pkgver="10.1.1"
pkgdesc="Lightweight and Scalable C++ Discord API Bot Library"
url="https://dpp.dev/"
_url="https://github.com/brainboxdotcc/${_pkgname}"
license=("Apache-2.0")
maintainer=("japandotorg <japandotorg@pm.me> [https://github.com/japandotorg]")
depends=("nlohmann-json3-dev")
source_i386=(
    "${_url}/releases/download/v${pkgver}/${_relname}-${pkgver}-linux-i386.deb"
)
source_amd64=(
    "${_url}/releases/download/v${pkgver}/${_relname}-${pkgver}-linux-x64.deb"
)
source_arm64=(
    "${_url}/releases/download/v${pkgver}/${_relname}-${pkgver}-linux-rpi-arm64.deb"
)
sha256sums_i386=(
    "41748112b7ec4eb8baa1dfb0f93dbcf2b911189da8f43f026da2466210dec0b7"
)
sha256sums_amd64=(
    "bc3e6fc2ddd525fc05bf4557f09e0504b776a15acaa89daadb21469b4e8bdaa5"
)
sha256sums_arm64=(
    "f59a5c229d68d82dd8888c399db71456166947cce2c4261abc7d52e083879827"
)

package() {
    ln -s "/usr/include/nlohmann" "${pkgdir}/usr/include/dpp/nlohmann"
}

post_install() {
    function color() {
        local color_name="$1"
        local echo_text="$2"

        local RED="\033[0;31m"
        local GREEN="\033[0;32m"
        local EMPTY="\033[0;37m"

        case "${color_name}" in
            red)
                echo -e "${RED}${echo_text}${EMPTY}"
                ;;
            green)
                echo -e "${GREEN}${echo_text}${EMPTY}"
                ;;
            *)
                echo "Can only use red or green!"
                return 1
                ;;
        esac
    }
    color red "Be aware one of the time conversion tests fail on devices not set to UTC."
	color red "This shouldn't affect your server deploys but may play role on your dev machine."
	echo ""
	color green "We build and package with packaged nlohmann/json. This is now properly supported by"
	color green "library build system. You may want to set the new build time flag."
    color green "Symlink has been provided for convenience, but you may prefer to use it directly."
    echo ""
	color red "Package now includes experimental coroutine support."
	color red "It's not considered production ready, but it's available for your excperiments."
}

post_upgrade() {
    function green () {
        local echo_text="$1"

        local GREEN="\033[0;32m"
        local EMPTY="\033[0;37m"

        echo -e "${GREEN}${echo_text}${EMPTY}"
    }
	green "Symlink has been provided for the embedded nlohmann/json library."
	green "We keep using the systemwide version. You may want to set the new build time flag."
}