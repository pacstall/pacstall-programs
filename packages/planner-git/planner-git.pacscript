name="planner-git"
url="https://github.com/alainm23/planner.git"
build_depends="meson ninja-build libgtk-3-dev libgee-0.8-dev libjson-glib-dev libsqlite3-dev libsoup2.4-dev libgranite-dev libwebkit2gtk-4.0-dev libecal2.0-dev libedataserver1.2-dev libpeas-dev libical-dev"
depends="libgtk-3-0 libgee-0.8-2 libjson-glib-1.0-0 libjson-glib-1.0-common libsqlite3-0 libsoup2.4-1 libgranite5 libgranite-common libwebkit2gtk-4.0-37 libecal-2.0-1 libedataserver-1.2-26 libpeas-1.0-0 libpeas-common libical3 libhandy-1-0 valac elementary-icon-theme libevolution"
description="Task manager with Todoist support designed for GNU/Linux"
maintainer="echometerain <echometer@disroot.org>"
removescript="yes"

pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
    wget "http://mirrors.kernel.org/ubuntu/pool/main/libh/libhandy-1/gir1.2-handy-1_1.2.0-1_amd64.deb"
    wget "http://mirrors.kernel.org/ubuntu/pool/universe/libh/libhandy-1/libhandy-1-dev_1.2.0-1_amd64.deb"
    sudo dpkg -i gir1.2-handy-1_1.2.0-1_amd64.deb
    sudo dpkg -i libhandy-1-dev_1.2.0-1_amd64.deb
}

build() {
    meson build --prefix="$STOWDIR/$name/usr"
    cd build
    ninja
}

install() {
    cd build
    sudo ninja install
}

postinst(){
    true
}

removescript(){
    sudo rm -rf /usr/share/applications/mimeinfo.cache
	sudo rm -rf /usr/share/glib-2.0/schemas/gschemas.compiled
	sudo rm -rf /usr/share/icons/hicolor/icon-theme.cache
	sudo rm -rf /usr/share/locale/aa/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ab/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ae/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/af/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ak/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/am/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/an/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ar/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/as/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ast/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/av/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ay/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/az/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ba/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/be/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bh/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bm/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/br/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/bs/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ca/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ce/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ch/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ckb/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/co/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/cr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/cs/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/cu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/cv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/cy/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/da/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/de/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/dv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/dz/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ee/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/el/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/en_AU/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/en_CA/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/en_GB/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/eo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/es/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/et/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/eu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fa/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ff/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fil/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fj/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fr_CA/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/fy/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ga/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/gd/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/gl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/gn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/gu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/gv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ha/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/he/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/hi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ho/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/hr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ht/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/hu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/hy/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/hz/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ia/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/id/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ie/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ig/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ii/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ik/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/io/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/is/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/it/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/iu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ja/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/jv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ka/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ki/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kj/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kk/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/km/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ko/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ks/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ku/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/kw/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ky/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/la/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lb/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/li/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ln/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lt/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/lv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mh/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mk/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ml/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ms/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/mt/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/my/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/na/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nb_NO/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nd/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ne/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ng/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/nv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ny/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/oc/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/oj/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/om/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/or/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/os/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pa/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ps/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pt/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pt_BR/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/pt_PT/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/qu/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/rm/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/rn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ro/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ru/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/rue/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/rw/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sa/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sc/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sd/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/se/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/si/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sk/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sm/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sma/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/so/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sq/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sr@latin/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ss/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/st/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/su/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sv/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/sw/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ta/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/te/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tg/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/th/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ti/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tk/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tl/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tn/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/to/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tr/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ts/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tt/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/tw/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ty/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ug/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/uk/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ur/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/uz/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/ve/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/vi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/vo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/wa/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/wo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/xh/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/yi/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/yo/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/za/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/zh_HK/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/zh_Hans/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/zh_TW/LC_MESSAGES/com.github.alainm23.planner.mo
	sudo rm -rf /usr/share/locale/zu/LC_MESSAGES/com.github.alainm23.planner.mo
}
