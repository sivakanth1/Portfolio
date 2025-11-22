# 🌟 Portfolio - Siva Kanth Reddy

A modern, responsive portfolio website built with Flutter Web, showcasing my professional journey, projects, skills, and achievements.

**Live Demo:** [sivakanthreddy.com](https://sivakanthreddy.com)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

---

## ✨ Features

- 🎨 **Modern UI/UX** - Clean, professional design with smooth animations
- 📱 **Fully Responsive** - Optimized for mobile, tablet, and desktop devices
- ⚡ **Single Page Application** - Smooth scroll-based navigation
- 🎯 **SEO Optimized** - Meta tags, structured data, and sitemap for better search visibility
- 🌐 **Firebase Hosting** - Fast, secure, and reliable deployment
- 🎭 **Animated Sections** - Engaging entrance and hover animations
- 🔄 **Auto-Scrolling Showcase** - Featured projects carousel with circular navigation
- 🎨 **Custom Widgets** - Reusable components for consistent design
- 📊 **Interactive Elements** - Floating navigation, social buttons, and scroll-to-top

---

## 🛠️ Tech Stack

### Core
- **Flutter 3.8.1+** - Cross-platform UI framework
- **Dart 3.8.1+** - Programming language

### Dependencies
- `url_launcher` - Open external links (GitHub, LinkedIn, Resume)
- `cupertino_icons` - iOS-style icons

### Hosting & Deployment
- **Firebase Hosting** - Production deployment
- **GitHub** - Version control and source code management

---

## 📂 Project Structure

```
portfolio/
├── lib/
│   ├── main.dart                    # Main application entry point
│   ├── Certificates/                # Certifications section
│   ├── Education/                   # Education section
│   ├── Experience/                  # Work experience section
│   ├── Footer/                      # Contact section
│   ├── Profile_About_Me/            # About me section
│   ├── Projects/                    # Projects showcase
│   ├── Publications/                # Publications section
│   ├── Skills/                      # Skills section
│   └── shared/                      # Shared utilities and widgets
│       ├── app_bar.dart            # Custom app bar
│       ├── app_data.dart           # All content data
│       ├── widgets.dart            # Reusable UI components
│       └── utils.dart              # Helper functions
├── assets/                          # Images and static resources
├── web/                             # Web-specific files
│   ├── index.html                  # SEO-optimized HTML
│   ├── manifest.json               # PWA manifest
│   ├── robots.txt                  # SEO crawler configuration
│   └── sitemap.xml                 # SEO sitemap
├── firebase.json                    # Firebase configuration
└── pubspec.yaml                     # Dependencies
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.8.1 or higher)
- A code editor ([VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio))

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/sivakanth1/Portfolio.git
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run -d chrome
   ```

---

## 🌐 Deployment

### Build for Web

```bash
flutter build web --release
```

### Deploy to Firebase

1. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**
   ```bash
   firebase login
   ```

3. **Initialize Firebase (if not already done)**
   ```bash
   firebase init
   ```

4. **Deploy**
   ```bash
   firebase deploy
   ```

Your site will be live at: `https://portfolio.web.app`

---

## 📱 Sections

1. **Hero Section** - Introduction with profile photo and CTA buttons
2. **About Me** - Personal background and professional journey
3. **Projects Showcase** - Featured projects carousel with descriptions
4. **Skills** - Technical expertise categorized by domain
5. **Experience** - Professional work history
6. **Education** - Academic background
7. **Publications** - Research contributions
8. **Certifications** - Awards and achievements
9. **Contact** - Get in touch section with social links

---

## 🎯 Key Highlights

- **Responsive Design** - Breakpoints at 600px (mobile), 900px (tablet), 1024px (desktop)
- **Animation System** - Custom fade, slide, and scale animations on scroll
- **Floating Navigation** - 7-item bottom navigation bar with active section tracking
- **Auto-Scroll Carousel** - Featured projects with 5-second intervals
- **Social Integration** - GitHub, LinkedIn, and Email links throughout
- **SEO Excellence** - Structured data, canonical URLs, and comprehensive meta tags

---

## 📝 Customization

### Update Content

All content is centralized in `lib/shared/app_data.dart`. Update the following sections:

```dart
class AppData {
  static const showcaseProjects = [...];  // Featured projects
  static const skills = {...};            // Skills by category
  static final education = [...];         // Education history
  static const experience = [...];        // Work experience
  static const publications = [...];      // Research papers
  static const certifications = [...];    // Certifications
  static const aboutMe = [...];           // About me paragraphs
}
```

### Update Personal Information

- **Profile Image**: Replace `assets/siva.jpg`
- **Social Links**: Update URLs in `app_bar.dart` and `main.dart`
- **Resume Link**: Update in `main.dart` (Download Resume button)
- **SEO Data**: Update `web/index.html` meta tags and structured data

### Theme Customization

Modify colors and styles in individual component files or create a centralized theme file.

---

## 🐛 Known Issues

- Profile image (siva.jpg) is 3.3MB - consider optimizing
- Commented code in `experience.dart` should be cleaned up
- Consider splitting `widgets.dart` (1,842 lines) into smaller files

---

## 📈 Future Enhancements

- [ ] Add unit and widget tests
- [ ] Implement state management (Provider/Riverpod)
- [ ] Add dark mode support
- [ ] Implement contact form with backend
- [ ] Add blog section
- [ ] Improve accessibility (ARIA labels, keyboard navigation)
- [ ] Add analytics (Google Analytics/Firebase Analytics)
- [ ] Progressive Web App (PWA) features

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👤 Contact

**Siva Kanth Reddy** (Lakshmi Siva Kanth Reddy Kondamadugula)

- 🌐 Website: [sivakanthreddy.com](https://sivakanthreddy.com)
- 💼 LinkedIn: [linkedin.com/in/sivakanth1](https://www.linkedin.com/in/sivakanth1)
- 🐙 GitHub: [github.com/sivakanth1](https://github.com/sivakanth1)
- 📧 Email: k.l.sivakanthreddy01@gmail.com

---

## 🙏 Acknowledgments

- Built with [Flutter](https://flutter.dev/)
- Hosted on [Firebase](https://firebase.google.com/)
- Icons from [Material Icons](https://fonts.google.com/icons)

---

<div align="center">
  
**⭐ If you like this project, please give it a star! ⭐**

Made with ❤️ by Siva Kanth Reddy

</div>
