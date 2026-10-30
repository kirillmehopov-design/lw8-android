# Laboratory Work 8 — Smart Catalog & Infinite Feed

Flutter / Dart project for Narxoz University, Week 8.

## Features
- 36 sample electronics products, List Feed with `ListView.separated`
- Two-column `GridView.builder`, `childAspectRatio: 0.72`
- List / Grid switching with Material 3 NavigationBar
- Pull-to-refresh waits 1500 ms and inserts a new item at index 0
- Right-to-left swipe delete with `Dismissible` and stable `ValueKey(product.id)`
- Floating SnackBar with UNDO restoring the original position
- Empty state with Reset Catalog button
- Organized Flutter source: `lib/models/`, `lib/widgets/`, `lib/screens/`

## Running
```bash
flutter create .
flutter pub get
flutter run
flutter test
```

Requires Flutter SDK with Dart 3.3+. Android/iOS/web runners are generated with `flutter create .`.

**Note:** The repository version uses local Flutter category icons for grid thumbnails. The original prepared ZIP also contains optional PNG thumbnail assets; the app's user interactions are unchanged. Flutter SDK was unavailable in the preparation environment, so runtime tests still need to be performed locally.
