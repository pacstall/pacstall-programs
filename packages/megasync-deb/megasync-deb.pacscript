name="megasync-deb"
gives="megasync"
repology=("project: megasync")
version="4.9.4"
replace=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
#incompatible=('*:21.04' '*21:10')
release=$(lsb_release -r | awk '{ print $2 }')
case "${release}" in
  23.04)
    hash="e1c6d66b9946d0e5a427560a39c0b2affe72714b57b3a41ceefac8304a0a3113"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.35)" "libgcc-s1 (>= 3.0)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.15.1)" "libqt5dbus5 (>= 5.14.1)" "libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1)" "libqt5network5 (>= 5.14.1)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl3 (>= 3.0.0)" "libstdc++6 (>= 12)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  22.10)
    hash="aab733084d4ec041bc15423df9d33319ec1302576ef248708768cf5e23cb1336"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.35)" "libgcc-s1 (>= 3.0)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.15.1)" "libqt5dbus5 (>= 5.14.1)" "libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1)" "libqt5network5 (>= 5.14.1)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl3 (>= 3.0.0)" "libstdc++6 (>= 12)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  22.04)
    hash="35a22daee1b9b5b8b2c619ebf80614a9781314cc1c5a3ad80d55af9d6cd6e378"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.35)" "libgcc-s1 (>= 3.0)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.15.1)" "libqt5dbus5 (>= 5.14.1)" "libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1)" "libqt5network5 (>= 5.14.1)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl3 (>= 3.0.0~~alpha1)" "libstdc++6 (>= 12)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  21.10)
    hash="18d13274c045358671d07b63c5e603f05d68e9996a50261a1fc78a402390cfc6"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.34)" "libgcc-s1 (>= 3.0)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.15.1)" "libqt5dbus5 (>= 5.14.1)" "libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1)" "libqt5network5 (>= 5.14.1)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl1.1 (>= 1.1.1)" "libstdc++6 (>= 11)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  21.04)
    hash="4d71da3485f1b8ea8a8df753d9987e0832a597c5f75ac9773fdbdcafed520c32"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.33)" "libgcc-s1 (>= 3.3.1)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.15.1)" "libqt5dbus5 (>= 5.14.1)" "libqt5gui5 (>= 5.14.1) | libqt5gui5-gles (>= 5.14.1)" "libqt5network5 (>= 5.14.1)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl1.1 (>= 1.1.1)" "libstdc++6 (>= 9)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  20.04)
    hash="ba47073ef29f8b5a6146fd23d204605d2602b6b86cb84e90e8e88b743d3e041d"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.30)" "libgcc-s1 (>= 3.0)" "libmediainfo0v5 (>= 0.7.56)" "libqt5core5a (>= 5.12.2)" "libqt5dbus5 (>= 5.0.2)" "libqt5gui5 (>= 5.10.0) | libqt5gui5-gles (>= 5.10.0)" "libqt5network5 (>= 5.1.0)" "libqt5svg5 (>= 5.6.0beta)" "libqt5widgets5 (>= 5.11.0rc1)" "libqt5x11extras5 (>= 5.6.0)" "libsqlite3-0 (>= 3.5.9)" "libssl1.1 (>= 1.1.1)" "libstdc++6 (>= 9)" "libudev1 (>= 183)" "libxcb1" "libzen0v5 (>= 0.4.31-2)" "apt-transport-https" "gpg")
    ;;
  18.04)
    hash="8179e9da977ae1532c69634e89109eab5733de7d3cb67495c92b3bd3c825547a"
    depends=("libc-ares2 (>= 1.11.0rc1)" "libc6 (>= 2.27)" "libcrypto++6" "libdrm2 (>= 2.4.62)" "libfontconfig1 (>= 2.12)" "libfreetype6 (>= 2.6)" "libgcc1 (>= 1:3.4)" "libgl1" "libmediainfo0v5 (>= 0.7.56)" "libpng16-16 (>= 1.6.2-1)" "libsqlite3-0 (>= 3.5.9)" "libssl1.1 (>= 1.1.1)" "libstdc++6 (>= 7)" "libudev1 (>= 183)" "libx11-6" "libx11-xcb1" "libxcb1 (>= 1.8)" "libxkbcommon-x11-0 (>= 0.5.0)" "libxkbcommon0 (>= 0.5.0)" "libzen0v5 (>= 0.4.31-2)" "zlib1g (>= 1:1.1.4)" "apt-transport-https" "gpg")
    ;;
  *)
    return 1
    ;;
esac
#url="https://mega.nz/linux/repo/xUbuntu_${release}/amd64/megasync_${version}_amd64.deb"
url="https://mega.nz/linux/repo/xUbuntu_${release}/amd64/megasync-xUbuntu_${release}_amd64.deb"
homepage="https://mega.nz"
description="Easy automated syncing between your computers and your MEGA cloud drive"
#maintainer="Arrowsome <ramtintoosi@gmail.com>"
