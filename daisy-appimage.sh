#!/bin/bash

# Download appimage-builder
wget -O appimage-builder-x86_64.AppImage https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage
chmod +x appimage-builder-x86_64.AppImage

# Create daisy appimage
./appimage-builder-x86_64.AppImage
mv -v daisy-latest-x86_64.AppImage daisy.AppImage

# Create udev rule deb package
rm -rfv PKG_SOURCE | true
mkdir -pv PKG_SOURCE/DEBIAN/
cp -v debian/control PKG_SOURCE/DEBIAN/
mkdir -pv PKG_SOURCE/usr/lib/udev/rules.d/
cp -v AppDir/DAISY/install/nhands.rules PKG_SOURCE/usr/lib/udev/rules.d/
dpkg-deb --root-owner-group --build PKG_SOURCE daisy-nhands-rules_0.1-1_all.deb