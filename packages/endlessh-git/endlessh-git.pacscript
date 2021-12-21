name="endlessh-git"
gives="endlessh"
breaks="${gives} ${gives}-deb ${gives}-app ${gives}-bin"
pkgdir="/usr/src/pacstall/${name}"
url="https://github.com/skeeto/endlessh.git"
description="SSH tarpit that very slowly sends an endless, random SSH banner"
pkgver() {
	git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
	wget -q https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/endlessh-git/sample-config
}

build() {
	make -j"$(nproc)"
}

install() {
	sudo make install DESTDIR="${pkgdir}"
	sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${name}"
	sudo install -Dm644 UNLICENSE -t "${pkgdir}/usr/share/licenses/${name}"
	sudo install -m644 sample-config "${pkgdir}/etc/endlessh/config"
}
# vim:set ft=sh ts=2 sw=2 et:
