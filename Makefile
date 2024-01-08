b:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs --enable-experiment=records

w:
	fvm flutter pub get
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs --enable-experiment=records

clean:
## Flutter cache
	rm ios/Podfile.lock | true
## ios Pod Lock file
	rm -rf ios/Pods | true
	rm ios/Flutter/Flutter.podspec | true
## pod cache
	rm -rf ~/Library/Developer/Xcode/DerivedData/ | true
## Xcode cache
	rm pubspec.lock | true
	fvm flutter clean
	fvm flutter pub get

## install pod
	cd ios&&pod update&&pod install