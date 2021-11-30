name="android-studio"
version="2020.3.1.25"
url="https://dl.google.com/dl/android/studio/ide-zips/$version/android-studio-$version-linux.tar.gz"
depends="libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development."
hash="cfc96e4981ad17e27ba91681fada06553fb118960c95f49232f72f30c2e2f781"
removescript="yes"
maintainer="Korkmatik <9c54efc1-143b-4f5f-9d2f-f6f189583f0f@aleeas.com>"
prepare() {
    true
}
build() {
    true
}
install() {
    # Moving all android studio files to /opt
    sudo cp -a bin lib jre plugins license LICENSE.txt build.txt product-info.json "$STOWDIR/$name/opt/$name"

    # Creating a launcher in $PATH
    sudo ln -s "$STOWDIR/$name/opt/android-studio/bin/studio.sh" "$STOWDIR/$name/usr/bin/android-studio"

    sudo wget -q https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/android-studio/android-studio.desktop -O "$STOWDIR/$name/usr/share/applications/android-studio.desktop"

    sudo install -Dm644 bin/studio.png "$STOWDIR/$name/usr/share/pixmaps/$name.png"
    sudo chmod -R ugo+rX "$STOWDIR/$name/opt"
}
postinst(){
    sudo update-desktop-database -q
    # Finished installation
    fancy_message info "Finished installation. Please start Android Studio to configure it!"
}
removescript(){
    sudo update-desktop-database -q
}
