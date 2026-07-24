# Sprint 1 – Caribbean Garden Companion MVP
## Implementation Plan & Progress

**Sprint Duration**: 2 weeks
**Goal**: Launch MVP with core gardening features
**Target Users**: Caribbean gardeners with basic to intermediate experience

---

## 🎯 Sprint Objectives

### Primary Goals
1. ✅ User can create account and login
2. ✅ User can create and manage gardens
3. ✅ User can add containers to gardens
4. ✅ User can plant crops and track growth
5. ✅ User can log watering and rainfall
6. ✅ User receives task reminders
7. ✅ User can record harvests
8. ✅ User can keep garden journal

---

## 📦 Deliverables by Module

### ✅ Module 1: Project Setup
**Status**: Design Phase
**Duration**: 3 days

#### Deliverables:
- [ ] Flutter project initialized
- [ ] Firebase authentication configured
- [ ] App navigation structure (bottom nav)
- [ ] Theme and styling system
- [ ] State management (Provider/Riverpod)

**Key Files**:
- `main.dart` - App entry point
- `screens/auth/` - Login & signup screens
- `screens/home/` - Main navigation
- `services/auth_service.dart` - Firebase auth
- `models/user_model.dart` - User data model
- `theme/app_theme.dart` - App styling

**Dependencies**:
```yaml
firebase_core
firebase_auth
cloud_firestore
firebase_storage
provider
intl
```

---

### ✅ Module 2: Garden Management
**Status**: Design Phase
**Duration**: 3 days

#### Deliverables:
- [ ] Garden creation form
- [ ] Garden list with cards
- [ ] Edit garden details
- [ ] Delete garden with confirmation
- [ ] Garden photos
- [ ] Garden statistics

**Key Files**:
- `screens/gardens/garden_list_screen.dart`
- `screens/gardens/garden_form_screen.dart`
- `screens/gardens/garden_detail_screen.dart`
- `models/garden_model.dart`
- `services/garden_service.dart`
- `widgets/garden_card.dart`

**Form Fields**:
- Garden name
- Description
- Location (lat/lng)
- Size (sq meters)
- Soil type (dropdown)
- Sun exposure (full/partial/shade)
- Drainage type
- Water source
- Irrigation system

---

### ✅ Module 3: Container Management
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Add container to garden
- [ ] Edit container details
- [ ] Delete container
- [ ] Container list in garden
- [ ] Container photos
- [ ] QR code generation & scanning

**Key Files**:
- `screens/containers/container_form_screen.dart`
- `screens/containers/container_list_screen.dart`
- `models/container_model.dart`
- `services/container_service.dart`
- `widgets/container_card.dart`
- `utils/qr_code_generator.dart`

**Container Data**:
```json
{
  "name": "Pot 1",
  "type": "pot|raised_bed|ground_bed|hanging_basket",
  "material": "terracotta|plastic|wood|concrete",
  "size": 20,
  "unit": "liters",
  "location": "north_corner",
  "soilType": "potting_mix|garden_soil|loam",
  "drainage": "good|moderate|poor",
  "color": "#ff6b6b",
  "sunExposure": "full_sun|partial_sun|shade",
  "qrCode": "container_id_encoded"
}
```

---

### ✅ Module 4: Plant Passport
**Status**: Design Phase
**Duration**: 3 days

#### Deliverables:
- [ ] Add plant to container
- [ ] Plant detail screen
- [ ] Plant growth stage tracker
- [ ] Health score indicator
- [ ] Photo timeline (before/during/after)
- [ ] Companion plant suggestions
- [ ] Notes section

**Key Files**:
- `screens/plants/plant_form_screen.dart`
- `screens/plants/plant_detail_screen.dart`
- `screens/plants/plant_gallery_screen.dart`
- `models/plant_model.dart`
- `services/plant_service.dart`
- `widgets/plant_card.dart`
- `widgets/plant_timeline.dart`
- `widgets/health_score_widget.dart`

**Plant Data**:
```json
{
  "commonName": "Okra",
  "variety": "Clemson Spineless",
  "cropLibraryId": "okra",
  "source": "seed|sprout|cutting",
  "dateSeedPlanted": "timestamp",
  "dateSpoted": "timestamp",
  "dateTransplanted": "timestamp",
  "expectedGermination": 7,
  "expectedHarvest": "timestamp",
  "stage": "seedling|vegetative|flowering|fruiting|mature",
  "healthScore": 95,
  "healthStatus": "healthy|struggling|diseased|pest_infested",
  "companionPlants": ["corn", "eggplant"],
  "notes": "Growing well",
  "photoTimeline": []
}
```

**Growth Stages**:
- Seedling (0-14 days)
- Vegetative (14-30 days)
- Flowering (30-45 days)
- Fruiting (45-60 days)
- Mature/Ready (60+ days)

---

### ✅ Module 5: Rain Smart™
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Quick rain logging dialog
- [ ] Rain level selection (Light/Moderate/Heavy/Storm)
- [ ] Duration selector
- [ ] Select affected gardens
- [ ] Select affected containers
- [ ] Auto-mark plants as watered
- [ ] Update rain history

**Key Files**:
- `screens/water/rain_log_screen.dart`
- `dialogs/rain_smart_dialog.dart`
- `models/rain_log_model.dart`
- `services/rain_service.dart`

**Rain Levels**:
- Light: 1-5mm
- Moderate: 5-15mm
- Heavy: 15-25mm
- Tropical Storm: 25mm+

**Triggers**:
- Auto-update watering reminders
- Mark containers as watered
- Add journal entry
- Send notification

---

### ✅ Module 6: Water Log
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Water logging form
- [ ] Select plant/container
- [ ] Watering method selector
- [ ] Date & time picker
- [ ] Soil moisture indicator
- [ ] Water log history

**Key Files**:
- `screens/water/water_log_screen.dart`
- `screens/water/water_history_screen.dart`
- `models/water_log_model.dart`
- `services/water_service.dart`
- `widgets/water_log_card.dart`

**Watering Methods**:
- Hand watering (hose)
- Watering can
- Rainfall
- Rain barrel
- Drip irrigation

**Data**:
```json
{
  "date": "timestamp",
  "time": "06:30",
  "plantId": "plant123",
  "containerId": "container123",
  "method": "hand_watering",
  "waterAmount": 2.0,
  "unit": "liters",
  "soilMoisture": "moist",
  "notes": "Plants responsive to watering"
}
```

---

### ✅ Module 7: Garden Journal
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Daily journal entry form
- [ ] Rich text editor
- [ ] Photo attachment
- [ ] Mood selector
- [ ] Weather condition selector
- [ ] Activity tags
- [ ] Journal list/timeline
- [ ] Search & filter

**Key Files**:
- `screens/journal/journal_list_screen.dart`
- `screens/journal/journal_entry_screen.dart`
- `models/journal_model.dart`
- `services/journal_service.dart`
- `widgets/journal_card.dart`
- `widgets/rich_text_editor.dart`

**Journal Entry Data**:
```json
{
  "date": "timestamp",
  "title": "First blooms on okra!",
  "content": "Rich text content",
  "mood": "excited|happy|neutral|worried|frustrated",
  "weather": "sunny|cloudy|rainy|stormy",
  "temperature": 28,
  "attachedPhotos": ["photo1", "photo2"],
  "attachedPlants": ["plant123"],
  "activities": ["watering", "fertilizing", "observation"],
  "tags": ["okra", "flowering", "milestone"]
}
```

---

### ✅ Module 8: Harvest Log
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Harvest recording form
- [ ] Select plant
- [ ] Quantity & weight input
- [ ] Quality rating
- [ ] Seed saving option
- [ ] Photo before/after
- [ ] Harvest history with yield tracking

**Key Files**:
- `screens/harvest/harvest_form_screen.dart`
- `screens/harvest/harvest_history_screen.dart`
- `models/harvest_model.dart`
- `services/harvest_service.dart`
- `widgets/harvest_card.dart`
- `widgets/yield_statistics.dart`

**Harvest Data**:
```json
{
  "plantId": "plant123",
  "harvestDate": "timestamp",
  "quantity": 2.5,
  "unit": "kg",
  "quality": "poor|fair|good|excellent",
  "savedSeeds": false,
  "notes": "Beautiful pods",
  "photosBefore": [],
  "photosAfter": [],
  "yield": {
    "totalKg": 2.5,
    "perPlant": 2.5,
    "valueEstimate": 500,
    "currency": "JMD"
  }
}
```

---

### ✅ Module 9: Notifications & Reminders
**Status**: Design Phase
**Duration**: 2 days

#### Deliverables:
- [ ] Firebase Cloud Messaging setup
- [ ] Task-based reminders (watering/fertilizing/harvesting)
- [ ] Weather alerts
- [ ] Rain detection notifications
- [ ] Storm warnings
- [ ] Notification permissions
- [ ] Notification history/center

**Key Files**:
- `services/notification_service.dart`
- `screens/notifications/notification_center_screen.dart`
- `models/notification_model.dart`
- `utils/notification_scheduler.dart`

**Notification Types**:
- Morning reminder: "Water your gardens today"
- Plant-specific: "Your okra is ready to harvest"
- Weather: "Heavy rain detected"
- Storm: "Tropical storm warning for your region"
- Achievement: "First harvest recorded!"

**Daily Schedule** (9 AM local time):
```
Morning Reminder
├─ Plants needing water
├─ Plants ready to harvest
├─ Fertilization due
└─ Other tasks
```

---

## 🗂️ Project Structure

```
caribbean-garden-companion/
├── mobile_app/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── models/
│   │   │   ├── user_model.dart
│   │   │   ├── garden_model.dart
│   │   │   ├── container_model.dart
│   │   │   ├── plant_model.dart
│   │   │   ├── water_log_model.dart
│   │   │   ├── rain_log_model.dart
│   │   │   ├── harvest_model.dart
│   │   │   ���── journal_model.dart
│   │   │   └── notification_model.dart
│   │   ├── screens/
│   │   │   ├── auth/
│   │   │   │   ├── login_screen.dart
│   │   │   │   ├── signup_screen.dart
│   │   │   │   └── forgot_password_screen.dart
│   │   │   ├── home/
│   │   │   │   ├── home_screen.dart
│   │   │   │   └── navigation_screen.dart
│   │   │   ├── gardens/
│   │   │   │   ├── garden_list_screen.dart
│   │   │   │   ├── garden_form_screen.dart
│   │   │   │   └── garden_detail_screen.dart
│   │   │   ├── containers/
│   │   │   │   ├── container_list_screen.dart
│   │   │   │   ├── container_form_screen.dart
│   │   │   │   └── container_detail_screen.dart
│   │   │   ├── plants/
│   │   │   │   ├── plant_form_screen.dart
│   │   │   │   ├── plant_detail_screen.dart
│   │   │   │   ├── plant_list_screen.dart
│   │   │   │   └── plant_gallery_screen.dart
│   │   │   ├── water/
│   │   │   │   ├── water_log_screen.dart
│   │   │   │   ├── rain_log_screen.dart
│   │   │   │   └── water_history_screen.dart
│   │   │   ├── harvest/
│   │   │   │   ├── harvest_form_screen.dart
│   │   │   │   └── harvest_history_screen.dart
│   │   │   ├── journal/
│   │   │   │   ├── journal_list_screen.dart
│   │   │   │   └── journal_entry_screen.dart
│   │   │   ├── notifications/
│   │   │   │   └── notification_center_screen.dart
│   │   │   └── profile/
│   │   │       └── profile_screen.dart
│   │   ├── services/
│   │   │   ├── auth_service.dart
│   │   │   ├── garden_service.dart
│   │   │   ├── container_service.dart
│   │   │   ├── plant_service.dart
│   │   │   ├── water_service.dart
│   │   │   ├── rain_service.dart
│   │   │   ├── harvest_service.dart
│   │   │   ├── journal_service.dart
│   │   │   ├── notification_service.dart
│   │   │   └── crop_library_service.dart
│   │   ├── providers/
│   │   │   ├── auth_provider.dart
│   │   │   ├── garden_provider.dart
│   │   │   ├── plant_provider.dart
│   │   │   ├── water_provider.dart
│   ���   │   └── notification_provider.dart
│   │   ├── widgets/
│   │   │   ├── garden_card.dart
│   │   │   ├── plant_card.dart
│   │   │   ├── container_card.dart
│   │   │   ├── plant_timeline.dart
│   │   │   ├── health_score_widget.dart
│   │   │   ├── water_log_card.dart
│   │   │   ├── harvest_card.dart
│   │   │   ├── journal_card.dart
│   │   │   └── custom_input_fields.dart
│   │   ├── dialogs/
│   │   │   ├── rain_smart_dialog.dart
│   │   │   ├── quick_water_dialog.dart
│   │   │   └── confirmation_dialog.dart
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   ├── app_colors.dart
│   │   │   └── app_typography.dart
│   │   ├── utils/
│   │   │   ├── constants.dart
│   │   │   ├── date_utils.dart
│   │   │   ├── validators.dart
│   │   │   ├── qr_code_generator.dart
│   │   │   ├── image_picker_helper.dart
│   │   │   └── notification_scheduler.dart
│   │   └── l10n/
│   │       ├── app_en.arb
│   │       └── app_es.arb
│   ├── pubspec.yaml
│   ├── android/
│   ├── ios/
│   └── test/
├── database/
├── documentation/
└── README.md
```

---

## 📋 Development Checklist

### Week 1
- [ ] Day 1-2: Module 1 (Setup)
  - [ ] Flutter project init
  - [ ] Firebase setup
  - [ ] Auth screens
  - [ ] Bottom navigation

- [ ] Day 3: Module 2 (Gardens)
  - [ ] Garden CRUD
  - [ ] Garden list

- [ ] Day 4: Module 3 (Containers)
  - [ ] Container CRUD
  - [ ] QR code generation

- [ ] Day 5: Module 4 (Plants)
  - [ ] Plant form
  - [ ] Plant detail
  - [ ] Growth tracking

### Week 2
- [ ] Day 1: Module 5 & 6 (Water)
  - [ ] Rain logging
  - [ ] Water logging
  - [ ] Watering methods

- [ ] Day 2: Module 7 (Journal)
  - [ ] Journal entries
  - [ ] Photo attachment
  - [ ] Entry list

- [ ] Day 3: Module 8 (Harvest)
  - [ ] Harvest form
  - [ ] Harvest history
  - [ ] Yield tracking

- [ ] Day 4: Module 9 (Notifications)
  - [ ] FCM setup
  - [ ] Task reminders
  - [ ] Weather alerts

- [ ] Day 5: Testing & Polish
  - [ ] Bug fixes
  - [ ] UI polish
  - [ ] Performance optimization

---

## 🎨 UI/Design System

### Colors (Caribbean Tropical Theme)
```dart
primary: Color(0xFF2E7D32)      // Garden Green
secondary: Color(0xFF0288D1)    // Ocean Blue
accent: Color(0xFFFF6F00)       // Sunset Orange
success: Color(0xFF43A047)      // Plant Green
warning: Color(0xFFFB8C00)      // Alert Orange
error: Color(0xFFE53935)        // Red
neutral_light: Color(0xFFF5F5F5) // Off White
neutral_dark: Color(0xFF212121)  // Dark Gray
```

### Typography
- **Display**: Roboto Bold 32sp
- **Headline**: Roboto Bold 24sp
- **Title**: Roboto Bold 18sp
- **Body**: Roboto Regular 16sp
- **Caption**: Roboto Regular 14sp

### Spacing
- xs: 4dp
- sm: 8dp
- md: 16dp
- lg: 24dp
- xl: 32dp

---

## 🔄 State Management Strategy

Using **Provider** pattern:
- `AuthProvider` - User authentication state
- `GardenProvider` - Gardens list and detail
- `PlantProvider` - Plants management
- `WaterProvider` - Water logs and reminders
- `NotificationProvider` - Notification state

---

## 🚀 Success Criteria

MVP is considered successful when:
1. ✅ User can sign up/login securely
2. ✅ Can create and manage gardens
3. ✅ Can add containers to gardens
4. ✅ Can plant crops and track progress
5. ✅ Can log watering & rainfall
6. ✅ Receives daily reminders
7. ✅ Can record harvests
8. ✅ Can keep journal entries
9. ✅ App has <3 second load time
10. ✅ All features work offline (sync when online)

---

## 📱 Supported Platforms

- Android 8.0+ (API 26)
- iOS 12.0+

---

## 🔗 Dependencies Summary

```yaml
# Firebase
firebase_core: ^2.24.0
firebase_auth: ^4.15.0
cloud_firestore: ^4.14.0
firebase_storage: ^11.5.0
firebase_messaging: ^14.6.0

# State Management
provider: ^6.1.0

# UI & Navigation
flutter_localizations:
  sdk: flutter
intl: ^0.19.0

# Camera & Image
image_picker: ^1.0.4
camera: ^0.10.5

# QR Code
qr_flutter: ^4.0.0

# Date/Time
table_calendar: ^3.0.9

# Storage
shared_preferences: ^2.2.2

# Location
geolocator: ^9.0.2

# Networking
http: ^1.1.0

# Utilities
uuid: ^4.0.0
```

---

## 📞 Sprint Support

- Daily standup: 10 AM
- Code review: EOD
- Demo: Friday 3 PM
- Retro: Friday 4 PM

---

**Last Updated**: 2024
**Sprint Lead**: Caribbean Garden Team
**Status**: 🟡 In Planning
