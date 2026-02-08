# Sivakanth's Portfolio

A modern, responsive portfolio website built with React, TypeScript, and Vite. This portfolio showcases my projects, experience, skills, and professional journey as a Computer Science graduate specializing in AI systems, mobile development, and backend engineering.

## 🚀 Tech Stack

- **Frontend Framework**: React 19.2.3 with TypeScript
- **Build Tool**: Vite 6.2.0
- **Routing**: React Router DOM 7.11.0
- **Styling**: Tailwind CSS (via index.css)
- **Animations**: Framer Motion 12.23.26
- **Icons**: Lucide React 0.562.0
- **Deployment**: Firebase Hosting
- **Version Control**: Git & GitHub

## ✨ Features

- **Responsive Design**: Fully responsive across desktop, tablet, and mobile devices
- **Dark Mode Support**: Smooth theme transitions with system preference detection
- **Interactive Animations**: Smooth page transitions and element animations using Framer Motion
- **Dynamic Routing**: Client-side routing with React Router for seamless navigation
- **Project Showcase**: Detailed project cards with filtering and categorization
- **Blog Section**: Writing and blog post display (future implementation)
- **Professional Sections**:
  - Home page with introduction and featured projects
  - All Projects page with filtering capabilities
  - Individual project detail pages
  - Writing/Blog section
  - Skills, Experience, and Education display

## 📁 Project Structure

```
Portfolio/
├── assets/              # Images and static resources
│   └── images/         # Project screenshots and images
├── components/         # Reusable React components
│   ├── AnimationWrapper.tsx
│   ├── Footer.tsx
│   ├── Navbar.tsx
│   ├── ProjectCard.tsx
│   └── ScrollToTop.tsx
├── pages/              # Route pages
│   ├── AllProjects.tsx
│   ├── Blog.tsx
│   ├── BlogFuture.tsx
│   ├── Home.tsx
│   ├── ProjectDetail.tsx
│   └── Writing.tsx
├── App.tsx             # Main application component with routing
├── constants.tsx       # Portfolio data (projects, skills, experience)
├── types.ts           # TypeScript type definitions
├── index.tsx          # Application entry point
├── index.html         # HTML template
├── vite.config.ts     # Vite configuration
├── tsconfig.json      # TypeScript configuration
└── firebase.json      # Firebase deployment configuration
```

## 🛠️ Setup & Installation

### Prerequisites

- **Node.js** (v16 or higher)
- **npm** or **yarn**

### Local Development

1. **Clone the repository**:
   ```bash
   git clone https://github.com/sivakanth1/Portfolio.git
   cd Portfolio
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Start the development server**:
   ```bash
   npm run dev
   ```

4. **Open your browser** and navigate to:
   ```
   http://localhost:5173
   ```

## 🏗️ Build & Deployment

### Build for Production

```bash
npm run build
```

This creates an optimized production build in the `dist/` directory.

### Preview Production Build

```bash
npm run preview
```

### Deploy to Firebase

This portfolio is deployed using Firebase Hosting. To deploy:

1. **Install Firebase CLI** (if not already installed):
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase**:
   ```bash
   firebase login
   ```

3. **Deploy**:
   ```bash
   firebase deploy
   ```

## 📊 Portfolio Data

All portfolio content (projects, skills, experience, education, certifications, publications) is managed in `constants.tsx`. Update this file to:
- Add new projects
- Update experience or education
- Modify skills and tech stack
- Add certifications or publications

## 🎨 Customization

- **Theme Colors**: Modify Tailwind classes in components
- **Animations**: Adjust Framer Motion settings in `components/AnimationWrapper.tsx`
- **Layout**: Edit component structure in `pages/` directory
- **Routing**: Update routes in `App.tsx`

## 📝 Key Components

| Component | Purpose |
|-----------|---------|
| `Navbar` | Navigation header with responsive menu and theme toggle |
| `Footer` | Footer with social links and contact information |
| `ProjectCard` | Reusable card component for displaying projects |
| `AnimationWrapper` | Wrapper for Framer Motion animations |
| `ScrollToTop` | Scrolls to top on route changes |

## 🔗 Links

- **Portfolio**: [Live Site](https://sivakanthreddy.com)
- **GitHub**: [sivakanth1](https://github.com/sivakanth1)
- **LinkedIn**: [sivakanth1](https://www.linkedin.com/in/sivakanth1)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with passion by Sivakanth**
