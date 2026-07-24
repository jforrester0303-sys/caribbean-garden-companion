# Sprint 1 Development Setup Guide

Complete step-by-step guide to set up your development environment for Sprint 1.

---

## ✅ Pre-requisites Check

### System Requirements
- **OS**: macOS, Windows, or Linux
- **RAM**: 8GB minimum (16GB recommended)
- **Disk Space**: 20GB free
- **Internet**: Stable connection required

### Required Software
- [ ] Git (2.30+)
- [ ] Flutter SDK (3.13.0+)
- [ ] Dart SDK (3.0.0+)
- [ ] Android Studio OR VS Code
- [ ] Xcode (for iOS, macOS only)
- [ ] Node.js (16+, for Firebase CLI)

---

## 🔧 Step 1: Install Development Tools

### Install Flutter

**macOS/Linux:**
```bash
# Clone Flutter repository
git clone https://github.com/flutter/flutter.git ~/flutter

# Add to PATH (add to ~/.zshrc or ~/.bash_profile)
export PATH="$PATH:$HOME/flutter/bin"

# Reload shell
source ~/.zshrc
```

**Windows:**
1. Download Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
2. Extract to `C:\src\flutter`
3. Add `C:\src\flutter\bin` to PATH environment variable

**Verify Installation:**
```bash
flutter --version
dart --version
```

### Install Firebase CLI

```bash
# Install globally
npm install -g firebase-tools

# Verify
firebase --version

# Login to Firebase
firebase login
```

### Install Android Studio OR VS Code

**Android Studio:**
1. Download from [developer.android.com](https://developer.android.com/studio)
2. Install Android SDK (API 33+)
3. Accept licenses: `flutter doctor --android-licenses`

**VS Code:**
1. Download from [code.visualstudio.com](https://code.visualstudio.com)
2. Install extensions:
   - Flutter
   - Dart
   - Firebase Explorer
   - Thunder Client (REST)

### Install Xcode (macOS only)

```bash
# Install Xcode Command Line Tools
xcode-select --install

# Or full Xcode from App Store
# After installation, accept license
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

---

## 🔍 Step 2: Run Flutter Doctor

Verify all dependencies are installed:

```bash
flutter doctor -v
```

You should see ✅ for:
- [ ] Flutter SDK location
- [ ] Android toolchain
- [ ] Xcode (iOS development)
- [ ] VS Code / Android Studio
- [ ] Connected devices (or emulators)

---

## 📱 Step 3: Set Up Emulators/Simulators

### Android Emulator
```bash
# List available emulators
flutter emulators

# Create new emulator (if needed)
flutter emulators --create --name pixel_5

# Launch emulator
flutter emulators --launch pixel_5
```

### iOS Simulator (macOS)
```bash
# List available simulators
xcrun simctl list devices

# Launch simulator
open -a Simulator
```

---

## 🔐 Step 4: Firebase Project Setup

### Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add Project"
3. Project name: `caribbean-garden-companion`
4. Enable Google Analytics: `No` (optional)
5. Click "Create Project"
6. Wait for project creation (2-3 minutes)

### Enable Required Services

In Firebase Console, enable:
- ✅ Authentication
- ✅ Firestore Database
- ✅ Cloud Storage
- ✅ Cloud Messaging

#### Enable Email/Password Authentication
1. Go to **Authentication → Sign-in method**
2. Click **Email/Password**
3. Toggle **Enable**
4. Save

#### Create Firestore Database
1. Go to **Firestore Database**
2. Click **Create database**
3. Select **Production mode**
4. Choose region (closest to your users)
5. Click **Enable**

#### Create Cloud Storage Bucket
1. Go to **Storage**
2. Click **Get started**
3. Accept default rules (will update later)
4. Choose location
5. Click **Done**

#### Enable Cloud Messaging
1. Go to **Cloud Messaging**
2. Note your **Sender ID**
3. Create service account

---

## 📥 Step 5: Download Configuration Files

### Android Configuration

1. In Firebase Console, go to **Project Settings** ⚙️
2. Click **Add app** → **Android**
3. Fill in:
   - Package name: `com.caribbeangarden.companion`
   - (Optional) Debug signing certificate SHA-1
4. Click **Register app**
5. Download `google-services.json`
6. Save to: `android/app/google-services.json`

### iOS Configuration

1. In Firebase Console, go to **Project Settings** ⚙️
2. Click **Add app** → **iOS**
3. Fill in:
   - Bundle ID: `com.caribbeangarden.companion`
   - App nickname: `Caribbean Garden Companion`
4. Click **Register app**
5. Download `GoogleService-Info.plist`
6. Open `ios/Runner.xcworkspace` in Xcode
7. Drag `GoogleService-Info.plist` into **Runner** folder
8. Ensure "Copy items if needed" is checked

---

## 📂 Step 6: Clone & Set Up Repository

```bash
# Clone the repository
git clone https://github.com/jforrester0303-sys/caribbean-garden-companion.git
cd caribbean-garden-companion

# Navigate to mobile app
cd mobile_app

# Get Flutter dependencies
flutter pub get

# Generate config files
flutter pub get
```

---

## 🔑 Step 7: Environment Variables

Create `.env` file in `mobile_app/` root:

```bash
# .env file
FIREBASE_API_KEY=YOUR_API_KEY_HERE
FIREBASE_AUTH_DOMAIN=caribbean-garden-companion.firebaseapp.com
FIREBASE_PROJECT_ID=caribbean-garden-companion
FIREBASE_STORAGE_BUCKET=caribbean-garden-companion.appspot.com
FIREBASE_MESSAGING_SENDER_ID=YOUR_SENDER_ID_HERE
FIREBASE_APP_ID=YOUR_APP_ID_HERE
WEATHER_API_KEY=YOUR_WEATHER_API_KEY_HERE
```

**How to find these values:**

1. Go to Firebase Console → **Project Settings** ⚙️
2. Scroll to **Your apps**
3. Click Android or iOS app
4. Look for configuration values
5. Copy to `.env`

---

## 🔐 Step 8: Deploy Firestore Rules

```bash
# Go to database directory
cd ../database

# Set Firebase project
firebase use caribbean-garden-companion

# Deploy Firestore security rules
firebase deploy --only firestore:rules

# Deploy Storage rules
firebase deploy --only storage
```

---

## ▶️ Step 9: Run the App

### Run on Android Emulator
```bash
cd mobile_app
flutter run
```

### Run on iOS Simulator (macOS)
```bash
cd mobile_app
flutter run -d macos  # or specific device
```

### Run on Connected Device
```bash
# List connected devices
flutter devices

# Run on device
flutter run -d <device-id>
```

### Run with Release Mode
```bash
flutter run --release
```

---

## 📝 Step 10: Create Project Structure

```bash
cd mobile_app/lib

# Create directories
mkdir -p models screens services providers widgets dialogs theme utils l10n

# Create subdirectories
mkdir -p screens/{auth,home,gardens,containers,plants,water,harvest,journal,notifications,profile}
```

---

## ✨ Step 11: Verify Setup

Test Firebase connection by running:

```bash
flutter run
```

Expected output:
- ✅ App launches without errors
- ✅ Can navigate to login screen
- ✅ No Firebase connection errors

---

## 🔄 Git Configuration

### Configure Git for Team

```bash
# Set up Git user
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Create feature branch
git checkout -b feature/module-1-setup

# Check status
git status

# Add changes
git add .

# Commit
git commit -m "feat: Initialize Module 1 setup"

# Push to repository
git push origin feature/module-1-setup
```

### Git Workflow
1. Always create feature branch from `main`
2. Branch naming: `feature/module-name` or `fix/issue-name`
3. Make commits with clear messages
4. Push and create Pull Request
5. Request code review
6. Merge when approved

---

## 🧪 IDE Configuration

### VS Code (Recommended for Flutter)

**Install Extensions:**
1. Flutter
2. Dart
3. Firebase Explorer
4. Thunder Client
5. JSON to Dart

**Create `.vscode/settings.json`:**
```json
{
  "dart.lineLength": 100,
  "dart.formatOnSave": true,
  "dart.flutterCreateOrganizationName": "com.caribbeangarden",
  "dart.flutterCreateProjectName": "companion",
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "Dart-Code.dart-code"
}
```

**Create `.vscode/launch.json`:**
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    }
  ]
}
```

### Android Studio

1. Install Flutter & Dart plugins
2. Open project: `File → Open → caribbean-garden-companion/mobile_app`
3. Wait for Gradle sync
4. Create AVD (Android Virtual Device)
5. Run app

---

## 🐛 Troubleshooting

### Flutter Doctor Fails
```bash
# Run detailed diagnostics
flutter doctor -v

# Fix Android issues
flutter doctor --android-licenses

# Clean and reset
flutter clean
rm -rf pubspec.lock
flutter pub get
```

### Firebase Connection Issues
```bash
# Reinstall Flutter dependencies
flutter clean
flutter pub get

# Check Firebase configuration
firebase projects:list

# Verify credentials in .env
cat .env
```

### Pod Install Fails (iOS)
```bash
cd ios
rm -rf Pods
rm -rf Podfile.lock
pod install
cd ..
```

### Hot Reload Issues
```bash
# Stop the app
# Press 'q' in terminal

# Restart with no cache
flutter run --no-fast-start

# Or do a full rebuild
flutter clean
flutter run
```

### Port Already in Use
```bash
# Kill process using port 8888
lsof -i :8888
kill -9 <PID>

# Or use different port
flutter run --host 127.0.0.1 --device-port 8889
```

---

## 📊 Development Tools

### Code Analysis
```bash
# Run analyzer
flutter analyze

# Fix issues
dart fix --apply
```

### Format Code
```bash
# Format all files
dart format lib/

# Check without formatting
dart format --output=none --set-exit-if-changed lib/
```

### Run Tests
```bash
# Unit tests
flutter test

# Specific test
flutter test test/unit/models/user_model_test.dart

# With coverage
flutter test --coverage

# View coverage
lcov --list coverage/lcov.info
```

---

## 📚 Next Steps

1. ✅ Verify setup: `flutter doctor`
2. ✅ Run app: `flutter run`
3. ✅ Create feature branch
4. ✅ Start Module 1 development
5. ✅ Follow SPRINT_1_PLAN.md for implementation

---

## 🆘 Quick Reference

| Command | Purpose |
|---------|---------|
| `flutter doctor` | Check setup status |
| `flutter pub get` | Install dependencies |
| `flutter run` | Run app on device/emulator |
| `flutter clean` | Clean build artifacts |
| `flutter test` | Run unit tests |
| `flutter analyze` | Analyze code |
| `dart format lib/` | Format code |
| `firebase deploy` | Deploy Firebase rules |
| `flutter build apk` | Build Android APK |
| `flutter build ipa` | Build iOS app |

---

## 📞 Support Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase for Flutter](https://firebase.google.com/docs/flutter/setup)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Provider State Management](https://pub.dev/packages/provider)
- [Flutter Community](https://fluttercommunity.dev)

---

## ✅ Setup Verification Checklist

- [ ] Flutter SDK installed
- [ ] Android Studio / VS Code installed
- [ ] Firebase CLI installed
- [ ] Firebase project created
- [ ] Configuration files downloaded
- [ ] `.env` file created
- [ ] `google-services.json` in `android/app/`
- [ ] `GoogleService-Info.plist` in iOS project
- [ ] `flutter pub get` completed
- [ ] Firestore rules deployed
- [ ] Emulator/simulator running
- [ ] App launches successfully
- [ ] No Firebase connection errors
- [ ] Git configured

---

**Last Updated**: 2024
**Ready to Start?** → Continue to [SPRINT_1_PLAN.md](./SPRINT_1_PLAN.md)
