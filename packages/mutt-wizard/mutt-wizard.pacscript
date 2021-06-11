# Based on https://aur.archlinux.org/packages/mutt-wizard/

maintainer="JonBoyleCoding <programmerfalcon@gmail.com>"

name="mutt-wizard"
version="3.2.1"
url="https://github.com/lukesmithxyz/$name/archive/v$version.tar.gz"
buld_depends=""
depends="neomutt isync msmtp notmuch pass curl"
breaks="mutt-wizard mutt-wizard-git"
description="Simple interface to auto-configure neomutt and isync with safe passwords"
hash="def5e792d46f217142b489e65f3d4059cdc8fca93eb83bab4474785c897d7f20"

# Some optional dependencies don't currently have an ubuntu package as far as I know,
# they have been marked with "No Pkg" in the optdepends.

optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
# No Pkg    'protonmail-bridge: use neomutt with protonmail accounts'
# No Pkg    'pam-gnupg: automatically unlock gpg keys at session login'
            'cron: set up automatic mail syncing')

prepare() {
    true
}

build() {
    true
}

install() {
    sudo make DESTDIR="/usr/src/pacstall/$name" install
    sudo install -Dm644 README.md -t "/usr/src/pacstall/$name/usr/local/share/doc/$name"
}
