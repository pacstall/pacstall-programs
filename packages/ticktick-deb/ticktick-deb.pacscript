name="ticktick-deb"
gives="ticktick"
version="1.0.60"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
depends=("libgtk-3-0" "libnotify4" "libnss3" "libxss1" "libxtst6" "xdg-utils" "libatspi2.0-0" "libuuid1" "libappindicator3-1" "libsecret-1-0")
case "${CARCH}" in
  amd64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${version}-amd64.deb"
    hash="64df313873391d78038d5465f1ceafb105dcb74aa1675b837dffe75dcf7ab568"
    arch=("amd64")
    ;;
  arm64)
    url="https://ticktick-download-linux.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-${version}-arm64.deb"
    hash="66f19c06aedfcaefece90d09db23267872e4bd153f067ad908106a9d306ee014"
    arch=("arm64")
    ;;
  *)
    return 1
    ;;
esac
homepage="https://ticktick.com"
description="A powerful to-do & task management app with seamless cloud synchronization across all your devices. Whether you need to schedule an agenda, make memos, share shopping lists, collaborate in a team, or even develop a new habit, TickTick is always here to help you get stuff done and keep life on track"
