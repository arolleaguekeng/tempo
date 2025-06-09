# Tempo

AI music generator

## Getting Started

This project is a starting point for a Flutter application.


## Sample project requirements
### 1 install Flutter Sdk
https://docs.flutter.dev/get-started/install


## General setup

In this section you create your sample app with settings that will apply to all platforms.

### Use the stable channel

Make sure you're on the stable channel with the most recent version of Flutter.r


flutter channel stable

## the project is using flutter 3.10.5

## The dart SDK version is 3.0.5

# For Run Project

```
flutter pub get
flutter run 
```

# Build Project

## 1- install dependencies

```
flutter pub get
```

## 2- install internationalization

```
flutter gen-l10n
```

## 3- Update launcher icons

```
flutter pub run flutter_launcher_icons
```
## 4- Build Project Android

```
flutter build apk --release
```

## Buil Project Android Specify version

```
flutter build appbundle --build-name=0.0.1 --build-number=1
```

# Build Project IOS

```
flutter build ios --build-name=1.0.2 --build-number=3
```

#How to build flutter app for prod
https://docs.flutter.dev/deployment/android

#Gen key to keystore 
```agsl
keytool -genkey -v -keystore ~/keystore.jks -keyalg RSA   -keysize 2048 -validity 10000 -alias upload -storepass Tempo22@ -keypass Tempo22@


#Get SHA For release
```agsl
keytool -list -v -keystore ~/keystore.jks -keyalg RSA   -keysize 2048 -validity 10000 -alias upload -storepass Tempo22@ -keypass Tempo22@

```
