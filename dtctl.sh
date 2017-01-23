
#cp -ri DTENShare.app /Applications/DTENShare.app

#cd /Contents/Resource



cp "dtensvc" "/Library/Application Support/"
cp "com.drivercoding.dtensvc.plist" "/Library/LaunchDaemons"

cd /Library/LaunchDaemons
launchctl load com.drivercoding.dtensvc.plist
launchctl start com.drivercoding.dtensvc
launchctl list | grep dtensvc
