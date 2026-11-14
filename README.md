# checkpoint

A TODO list application demonstrating the Clean Architecture approach powered by the Riverpod pattern.

## Getting Started

This project relies on code generation (e.g., Freezed, JSON Serializable, Easy Localization). You must generate the required assets and files before running the application.

### Code Generation

If you have `make` available on your system, you can generate everything with a single command:

```bash
make gen
```

If you do not use `make`, run these direct commands in your terminal:

**1:**

```bash
dart run easy_localization:generate -S "assets/translations" -O "lib/generated"
dart run easy_localization:generate -S "assets/translations" -O "lib/generated" -f keys -o locale_keys.g.dart
```

**2:**

```bash
dart run build_runner build
```

---

### Project Cleanup

To reset dependencies and clean up the project:

- **Using make:** `make clean`
- **Directly:**
  ```bash
  flutter clean
  flutter pub get
  ```

---

## Resources for Beginners

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://flutter.dev)
- [Write your first Flutter app](https://flutter.dev)
- [Flutter learning resources](https://flutter.dev)

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
