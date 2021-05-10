name="bemenu-git"
pkgname="bemenu"
version="4b7b483"
url="https://github.com/Cloudef/bemenu.git"
description="Dynamic menu library and client program inspired by dmenu"
build_depends="libxinerama-dev libxkbcommon-dev libncurses-dev wayland-protocols libwayland-dev libcairo2-dev libpango1.0-dev libpangocairo-1.0-0"
gives="bemenu"
breaks="bemenu-bin"
maintainer="wizard-28 <basak.sb2006@gmail.com>"

prepare() {
    fancy_message info "What do you want as a backend?"
    echo "1. x11"
    echo "2. wayland"
    echo "3. curses"
    printf "Enter your choice (choice number): "
    read -r choice
    case $choice in
        1 )
            choice="x11"
            fancy_message info "Building using x11 as backend" ;;
        2 )
            choice="wayland"
            fancy_message info "Building using wayland as backend" ;;
        3 )
            choice="curses"
            fancy_message info "Building using curses as backend" ;;
        * )
            fancy_message error "Wrong choice!"
            exit 1 ;;
    esac
}

build() {
    make -j"$(nproc)" clients "$choice"
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/bemenu-git
}
