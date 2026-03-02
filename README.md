# ✨ Modern Flutter Portfolio

A premium, high-performance portfolio website built with Flutter, featuring advanced animations, glassmorphism, and a sleek dark-themed design.

## 🚀 Overview

This project is a state-of-the-art developer portfolio designed to showcase skills, projects, and professional experience with a focus on **Visual Excellence** and **Smooth Interactivity**. It leverages the power of Flutter's rendering engine to deliver a web experience that feels alive and responsive.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (Web-optimized)
- **State Management:** [GetX](https://pub.dev/packages/get)
- **Animations:** 
  - `flutter_animate` for scroll-driven and entrance animations.
  - `flutter_staggered_animations` for list transitions.
- **Typography:** [Google Fonts](https://pub.dev/packages/google_fonts) (Inter, Outfit)
- **Icons:** `cupertino_icons`, `flutter_svg`
- **Utility:** `url_launcher` for external links and WhatsApp integration.

## ✨ Key Features

- **Glassmorphism Design:** Subtle blurs and translucent layers for a premium feel.
- **Dynamic Background:** Interactive `GridBackground` that adds depth to the scrolling experience.
- **Advanced Hero Section:** High-impact entrance with engaging typography and visuals.
- **Interactive Tech Stack:** Visual representation of skills with hover effects.
- **Project Showcase:** Premium hover cards displaying project details and links.
- **Scroll-Synchronized Navigation:** Smooth scrolling with active section tracking in the `NavBar`.
- **WhatsApp Integration:** Direct messaging capability integrated into the contact form.
- **Responsive Architecture:** Fully optimized for different screen sizes, including a mobile-friendly drawer.

## 📂 Project Structure

```text
lib/
├── modules/
│   └── home/
│       ├── controllers/    # Business logic & Scroll management
│       └── views/          # main UI components
│           └── widgets/    # Individual sections (Hero, About, Tech, etc.)
├── theme/                  # Design system (Colors, Typography, Theme)
└── utils/                  # Helper functions and constants
```

## 🎨 Design Philosophy

- **Premium Aesthetics:** Dark mode by default with vibrant accents (Purple, Cyan, Blue).
- **Micro-Animations:** Subtle feedback on every interaction to enhance engagement.
- **Clean Hierarchy:** Semantic layout with clear distinction between sections for better readability.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Chrome or any modern web browser

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   ```

2. **Navigate to project directory:**
   ```bash
   cd portfolio
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the project:**
   ```bash
   flutter run -d chrome
   ```

