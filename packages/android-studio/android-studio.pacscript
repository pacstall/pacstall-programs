name="android-studio"
version="2020.3.1.24"
url="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$version/android-studio-$version-linux.tar.gz"
depends="libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386"
description="Android Studio is the official integrated development environment (IDE) for Google's Android operating system, built on JetBrains' IntelliJ IDEA software and designed specifically for Android development."
hash="f498ac0446b1fe32d9d5dda2b508049eb6732d9499619e2adf5ec9bb1166124d"
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
    sudo install -D ./* -t "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r bin "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r jre "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r lib "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r license "$STOWDIR/$name/opt/android-studio/"
    sudo cp -r plugins "$STOWDIR/$name/opt/android-studio/"
    # Creating a launcher in $PATH
    sudo ln -s "$STOWDIR/$name/opt/android-studio/bin/studio.sh" "/usr/bin/android-studio"
}
postinst(){
    wget https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/android-studio/android-studio.desktop -O /usr/src/pacstall/usr/share/applications/android-studio.desktop
    sudo update-desktop-database -q
    # Finished installation
    fancy_message info "Finished installation. Please start Android Studio to configure it!"
}
removescript(){
    # Removing .desktop file
    sudo rm /usr/share/applications/android-studio.desktop
    sudo update-desktop-database -q
    # Removing launcher
    sudo rm /usr/bin/android-studio
}