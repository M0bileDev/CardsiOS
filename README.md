# CardsiOS 🃏

A real-world iOS app for creating and sharing personal cards. Add images from your photo library or the web, combine them with text and stickers, and save your creations directly on your device.

Built with **SwiftUI** as a portfolio project to demonstrate real-world iOS development patterns.

---

## Features

- 🖼️ **Photo Picker** — Select images from your device gallery using the native `PhotosUI` framework
- ✏️ **Text & Stickers** — Personalise your cards with custom text and sticker overlays
- 💾 **Local Persistence** — Cards are saved on-device using `FileManager` and `URL.documentsDirectory`, so your data is always available offline
- 📤 **Sharing** — Share your finished cards with others

---

## Tech Stack

| Layer | Technology |
|---|---|
| UI | SwiftUI |
| Reactive State | Combine |
| Photo Access | PhotosUI / PHPickerViewController |
| Local Storage | FileManager + URL.documentsDirectory |
| Language | Swift |

---

## Architecture

The app follows the **MVVM** pattern with SwiftUI's native data flow tools:

- `ObservableObject` ViewModels publishing state via `@Published`
- `Combine` pipelines for reactive data handling
- A dedicated persistence layer using `FileManager.default` for saving card data locally — a native iOS equivalent of Android's `SharedPreferences` / `DataStore`

---

- iOS 16.0+
- Xcode 15+
- Swift 5.9+

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/M0bileDev/CardsiOS.git
   ```
2. Open `Cards.xcodeproj` in Xcode
3. Select a simulator or a real device
4. Build and run with `Cmd + R`

No external dependencies or package manager setup required.

---

## Project Structure

```
Cards/
├── Models/          # Data models for cards and their content
├── ViewModels/      # Business logic with ObservableObject + Combine
├── Views/           # SwiftUI screens and reusable components
├── Services/        # Persistence (FileManager)
└── Resources/       # Assets, stickers, and app configuration
```

---

## Purpose

This project was developed as a hands-on learning exercise to practice SwiftUI fundamentals including state management, navigation, custom views, photo picking with PhotosUI, and local data persistence using FileManager.
