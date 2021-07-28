name="tenacity-git"
url="https://github.com/tenacityteam/tenacity.git"
build_depends="build-essential cmake git python3-pip ffmpeg"
depends="libgtk2.0-dev libasound2-dev libavformat-dev libjack-jackd2-dev uuid-dev"
replace="audacity"
description="FLOSS Audacity Fork. No telemetry, crash reports and other shenanigans like that!"
optdepends="ffmpeg: additional import/export capabilities"
removescript="yes"
maintainer="echometer <guacamolek@yandex.com>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
          sudo pip3 install conan
}

build() {
        sudo chown -R $LOGNAME $SRCDIR
        mkdir build
        cd build
        cmake -G "Unix Makefiles" \
        -DESTDIR="$STOWDIR/$name" \
        -DCMAKE_BUILD_TYPE=Release \
        -Duse_ffmpeg=loaded ..
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR="$STOWDIR/$name"
}


removescript(){
          sudo rm /usr/local/bin/tenacity
          sudo rm /usr/local/share/applications/tenacity.desktop
          sudo rm /usr/local/share/doc/tenacity/LICENSE.txt
          sudo rm /usr/local/share/doc/tenacity/README.md
          sudo rm /usr/local/share/icons/hicolor/16x16/tenacity.png
          sudo rm /usr/local/share/icons/hicolor/22x22/tenacity.png
          sudo rm /usr/local/share/icons/hicolor/24x24/tenacity.png
          sudo rm /usr/local/share/icons/hicolor/32x32/tenacity.png
          sudo rm /usr/local/share/icons/hicolor/48x48/tenacity.png
          sudo rm /usr/local/share/icons/hicolor/scalable/apps/tenacity.svg
          sudo rm /usr/local/share/locale/af/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ar/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/be/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/bg/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/bn/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/bs/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ca/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ca@valencia/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/co/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/cs/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/cy/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/da/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/de/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/el/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/en/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/es/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/eu/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/fa/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/fi/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/fr/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ga/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/gl/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/he/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/hi/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/hr/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/hu/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/hy/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/id/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/it/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ja/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ka/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/km/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ko/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/lt/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/mk/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/mr/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/my/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/nb/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/nl/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/oc/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/pl/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/pt_BR/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/pt_PT/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ro/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ru/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/sk/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/sl/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/sr/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/sr_Latn/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/sv/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/ta/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/tg/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/tr/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/uk/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/vi/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/zh/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/locale/zh_Hant/LC_MESSAGES/tenacity.mo
          sudo rm /usr/local/share/man/man1/tenacity.1
          sudo rm /usr/local/share/metainfo/tenacity.appdata.xml
          sudo rm /usr/local/share/mime/packages/tenacity.xml
          sudo rm /usr/local/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm
          sudo rm /usr/local/share/pixmaps/tenacity.xpm
          sudo rm /usr/local/share/pixmaps/tenacity16.xpm
          sudo rm /usr/local/share/pixmaps/tenacity32.xpm
          sudo rm /usr/local/tenacity
}
