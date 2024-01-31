#!/bin/bash

# Install dependencies
sudo apt install -y libqtcore4 libqtgui4 libqt4-opengl

# Extract daisy tarball
DIR="$(basename *.tgz .tgz)"
mkdir -p AppDir/
tar -xzvf *.tgz
mv $DIR DAISY
mv DAISY AppDir/

# Create udev rule deb package
mkdir -p PKG_SOURCE/DEBIAN/
cp debian/control PKG_SOURCE/DEBIAN/
mkdir -p PKG_SOURCE/etc/udev/rules.d/
cp AppDir/DAISY/install/nhands.rules PKG_SOURCE/etc/udev/rules.d/
dpkg-deb --root-owner-group --build PKG_SOURCE daisy-nhands-rules.deb

# Download appimage-builder
wget -O appimage-builder-x86_64.AppImage https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
chmod +x appimage-builder-x86_64.AppImage

# Create daisy appimage
./appimage-builder-x86_64.AppImage
mv daisy-latest-x86_64.AppImage daisy.AppImage