import { 
  Code2, 
  Layout, 
  Server, 
  Database, 
  Cloud, 
  Cpu, 
  BrainCircuit, 
  Terminal,
  BookOpen,
  Award,
  Layers
} from 'lucide-react';
import { SkillCategory, Experience, Project, Education, Publication, Certification } from './types';

export const SOCIAL_LINKS = {
  github: "https://github.com/sivakanth1",
  linkedin: "https://www.linkedin.com/in/sivakanth1", 
  email: "mailto:contact@example.com" // Add your email here
};

export const SKILL_ICONS: Record<string, any> = {
  "Primary Stack": Code2,
  "Systems & Foundations": Terminal,
  "Advanced / Research": BrainCircuit,
};

export const SKILLS: SkillCategory[] = [
  {
    category: "Primary Stack",
    items: [
      "Python", "Java", "Kotlin", 
      "Flutter", "React", 
      "Node.js", "REST APIs", 
      "AWS", "Docker", "Firebase"
    ]
  },
  {
    category: "Systems & Foundations",
    items: [
      "Data Structures & Algorithms", 
      "OOP", "Design Patterns", 
      "System Design"
    ]
  },
  {
    category: "Advanced / Research",
    items: [
      "PyTorch", "TensorFlow", 
      "CUDA", "vLLM", "Quantization", 
      "Distributed / HPC"
    ]
  }
];

export const ABOUT_ME = [
  "I’m a Computer Science graduate from Texas A&M University–Corpus Christi who enjoys building systems that turn research ideas into real, measurable impact. My work spans mobile applications, backend services, and performance-oriented AI systems, with a strong foundation in data structures and system design.",
  "I focus on solving problems through optimization and clean engineering. I’ve accelerated a road damage detection model by 1.5x using CUDA, built a Flutter application that improved time management by 30%, and orchestrated LLM pipelines to increase throughput by 40%. I care deeply about results, scalability, and reliability.",
  "Outside of development, I enjoy playing badminton, following Formula 1, and participating in hackathons. I’ve also worked as a Teaching Assistant, where I helped students build strong fundamentals in algorithms and problem-solving."
];

export const EXPERIENCE: Experience[] = [
  {
    company: "Texas A&M University-Corpus Christi",
    role: "Teaching Assistant – Dept. Computer Science",
    duration: "Aug 2025 - Dec 2025",
    location: "Corpus Christi, Texas",
    description: [
      "Guided 50+ students in Python, C++, DSA, and OOP to strengthen their programming fundamentals with autonomy to tailor sessions to individual learning styles.",
      "Created automated Python grading scripts to prevent inconsistent manual evaluation and ensure accurate scoring.",
      "Helped students debug coding issues during labs when they faced recurring errors, improving their problem-solving skills.",
      "Developed extra study guides driven by student curiosity patterns, improving overall student performance."
    ]
  },
  {
    company: "Liveasy",
    role: "Android Development Intern",
    duration: "Nov 2022 - Mar 2023",
    location: "India",
    description: [
      "Built a Flutter logistics app to fix slow multi-platform development, reusing 70% of code and cutting build time by 35%.",
      "Applied Material You designs to address UI inconsistency, improving visual consistency and boosting engagement by 20%.",
      "Used modular architecture with Docker containers to solve maintainability issues, making feature updates faster and reducing duplicate code.",
      "Added real-time tracking and notifications via Argo-integrated CI/CD pipelines to fix delivery-visibility delays, improving the user experience."
    ]
  },
  {
    company: "Yugam.Inc",
    role: "Front End Development Intern",
    duration: "Mar 2022 - Aug 2022",
    location: "India",
    description: [
      "Built responsive React.js and TypeScript interfaces to fix layout issues, integrating Node.js APIs and PostgreSQL for smooth data flow.",
      "Created reusable components with React Hooks and Redux, managed via GitHub to reduce repeated code and cut build time by 25%.",
      "Optimized API calls and reduced unnecessary re-renders to address slow page performance and speed up load times.",
      "Added cross-browser and mobile compatibility checks to resolve display problems and ensure consistent user experience."
    ]
  }
];

export const PROJECTS: Project[] = [
  // ========== FEATURED PROJECTS (3) ==========
  {
    title: "ParaMind - Parallel Agent Orchestration",
    period: "2025",
    tags: ["Python", "AWS EC2", "Lambda", "Streamlit", "Asyncio"],
    description: [
      "Dynamic parallel agentic orchestration system using AWS EC2 and Lambda for intelligent LLM routing. Implements data-parallel and instruction-parallel execution modes with 40% throughput improvement.",
      "Dynamic mode selection (data/instruction parallel) with concurrent LLM API execution."
    ],
    link: "https://github.com/sivakanth1/ParaMind-Parallel_Agent_Orchestration",
    image: "photo_2025-02-18%2020.09.49.jpeg", // ParaMind Image
    featured: true
  },
  {
    title: "SynerSched",
    period: "2025",
    tags: ["Flutter", "Firebase", "Firestore", "AES-256", "Dart"],
    description: [
      "Academic scheduling and collaboration app built with Flutter and Firebase. Features conflict-free schedule generation, AES-256 encryption, bilingual support, and real-time collaboration.",
      "Auto-conflict detection in schedules with 30% improvement in time management."
    ],
    link: "https://github.com/sivakanth1/SynerSched",
    image: "photo_2025-02-18%2020.09.52.jpeg", // SynerSched Image
    featured: true
  },
  {
    title: "Road Damage Detection System",
    period: "2025",
    tags: ["Python", "PyTorch", "YOLOv7", "Docker", "CUDA"],
    description: [
      "YOLOv7-based road damage detection system trained on RDD2022 multi-national dataset. Achieves 63.85% mAP for detecting cracks and potholes with Gradio UI for interactive inference.",
      "Real-time object detection for road damage with 1.5x faster training using CUDA optimization."
    ],
    link: "https://github.com/sivakanth1/Detecting_Road_Damage",
    image: "photo_2025-02-18%2020.09.56.jpeg", // Road Damage Image
    featured: true
  },

  // ========== OTHER PROJECTS ==========
  {
    title: "Dimensionality Reduction for Recommendation Systems",
    period: "2024",
    tags: ["Python", "Scikit-learn", "TensorFlow", "Pandas"],
    description: [
      "Comprehensive comparison of dimensionality reduction techniques (PCA, t-SNE, Autoencoders) for recommendation systems with extensive visualization and performance analysis on MovieLens dataset.",
      "Interactive visualizations of embeddings and performance benchmarking."
    ],
    link: "https://github.com/sivakanth1/dimensionality_reduction_for_recommendation_systems",
    image: "https://picsum.photos/800/600?random=101",
    featured: false
  },
  {
    title: "Wastewater Predictive Maintenance",
    period: "2024",
    tags: ["Python", "PyTorch", "GNN", "Reinforcement Learning"],
    description: [
      "AI-powered predictive maintenance system for wastewater networks using Graph Neural Networks and Reinforcement Learning to detect anomalies and optimize flow distribution.",
      "Graph Autoencoder for anomaly detection and RL-based flow optimization."
    ],
    link: "https://github.com/sivakanth1/wastewater-predictive-maintenance",
    image: "https://picsum.photos/800/600?random=102",
    featured: false
  },
  {
    title: "FlashChat",
    period: "2023",
    tags: ["Flutter", "Firebase Auth", "Firestore", "Dart"],
    description: [
      "Real-time mobile chat application with Firebase authentication and Firestore. Features animated UI, typewriter effects, secure messaging, and email verification.",
      "Real-time messaging with Firestore and secure session management."
    ],
    link: "https://github.com/sivakanth1/FlashChat-Mobile-Application-Using-Flutter-",
    image: "https://picsum.photos/800/600?random=103",
    featured: false
  },
  {
    title: "Clima Weather App",
    period: "2023",
    tags: ["Flutter", "OpenWeatherMap API", "Geolocator", "Dart"],
    description: [
      "Weather application built with Flutter using OpenWeatherMap API. Provides real-time weather data with location services, dynamic UI based on conditions, and temperature unit conversion.",
      "Real-time weather data from OpenWeatherMap with automatic location detection."
    ],
    link: "https://github.com/sivakanth1/Clima-A-Weather-Application-Using-Flutter",
    image: "https://picsum.photos/800/600?random=104",
    featured: false
  },
  {
    title: "BMI Calculator",
    period: "2023",
    tags: ["Flutter", "Dart", "Material Design"],
    description: [
      "Body Mass Index calculator app with gender selection, height slider, weight/age inputs, and health interpretation. Features dark theme UI and Google Mobile Ads integration.",
      "Accurate BMI calculation with health category interpretation."
    ],
    link: "https://github.com/sivakanth1/BMI-Calculator-Using-Flutter",
    image: "https://picsum.photos/800/600?random=105",
    featured: false
  },
  {
    title: "Bus Reservation System",
    period: "2022",
    tags: ["Java", "MySQL", "REST API", "HTML/CSS"],
    description: [
      "State-level hackathon winning web application for bus reservation management. Developed with Java, MySQL, and REST APIs, featuring optimized booking workflows and scalable architecture.",
      "Real-time seat availability and online bus ticket booking."
    ],
    link: "https://github.com/sivakanth1/myBusReservation-Web-Application",
    image: "https://picsum.photos/800/600?random=106",
    featured: false
  },
  {
    title: "Job Scheduling Algorithms Visualizer",
    period: "2023",
    tags: ["Flutter Web", "Dart", "Canvas API", "Firebase"],
    description: [
      "Interactive web application built with Flutter for visualizing CPU scheduling algorithms including FCFS, SJF, Priority, and Round Robin with Gantt charts and performance metrics.",
      "Interactive Gantt chart visualization and step-by-step algorithm execution."
    ],
    link: "https://github.com/sivakanth1/Job-Scheduling-Algorithms-Web-Application",
    image: "https://picsum.photos/800/600?random=107",
    featured: false
  },
  {
    title: "Page Replacement FIFO Visualizer",
    period: "2022",
    tags: ["HTML", "CSS", "JavaScript", "Firebase"],
    description: [
      "Educational web application demonstrating FIFO page replacement algorithm with step-by-step visualization, page fault detection, and interactive input for operating systems concepts.",
      "Real-time animation of page replacements and page fault calculation."
    ],
    link: "https://github.com/sivakanth1/Page_Replacement_FIFO-Web-Application",
    image: "https://picsum.photos/800/600?random=108",
    featured: false
  },
  {
    title: "Book Cricket Game",
    period: "2023",
    tags: ["Flutter Web", "Dart", "Game Dev"],
    description: [
      "Digital recreation of the classic book cricket game built with Flutter. Features random page number generation, score tracking, and intuitive gameplay mechanics.",
      "Classic book cricket gameplay with random page selection algorithm."
    ],
    link: "https://github.com/sivakanth1/Book-Cricket",
    image: "https://picsum.photos/800/600?random=109",
    featured: false
  },
  {
    title: "Distributed OS Manager",
    period: "2022",
    tags: ["HTML", "CSS", "JavaScript", "Chart.js"],
    description: [
      "Web-based distributed operating system management tool providing resource allocation, process scheduling, and distributed system visualization capabilities.",
      "Resource allocation visualization and load balancing simulation."
    ],
    link: "https://github.com/sivakanth1/distributed-OS-manager",
    image: "https://picsum.photos/800/600?random=110",
    featured: false
  },
  {
    title: "Dynamic Work Scheduler",
    period: "2024",
    tags: ["Python", "Flask", "SQLite", "JavaScript"],
    description: [
      "Intelligent work scheduling system that dynamically allocates tasks based on priority, deadlines, and resource availability. Features automated conflict resolution and optimization algorithms.",
      "Dynamic task prioritization and automated conflict detection."
    ],
    link: "https://github.com/sivakanth1/Dynamic-Work-Scheduler1",
    image: "https://picsum.photos/800/600?random=111",
    featured: false
  },
  {
    title: "Multimodal Accessibility Translator",
    period: "2024",
    tags: ["Python", "OpenAI GPT-4", "Flask", "NLTK"],
    description: [
      "Multi-agent system for accessibility translation supporting three modalities: Image-to-Audio, Text-to-Sign Language (ASL), and Complex Text-to-Visual Diagrams using AI models.",
      "Image description to audio narration and Text to ASL conversion."
    ],
    link: "https://github.com/sivakanth1/Multimodal-Accessibility-Translator",
    image: "https://picsum.photos/800/600?random=112",
    featured: false
  },
  {
    title: "Portfolio Website",
    period: "2025",
    tags: ["Flutter Web", "Dart", "Firebase"],
    description: [
      "Modern, responsive portfolio website built with Flutter Web featuring smooth animations, SEO optimization, Firebase hosting, and comprehensive project showcase.",
      "Smooth scroll-based navigation and SEO optimization."
    ],
    link: "https://github.com/sivakanth1/Portfolio",
    image: "https://picsum.photos/800/600?random=113",
    featured: false
  },
  {
    title: "CS Video Courses Collection",
    period: "2023",
    tags: ["Markdown", "GitHub Pages"],
    description: [
      "Curated collection of computer science video lectures and courses covering algorithms, machine learning, systems programming, databases, and more.",
      "Curated video lecture links organized by CS topics."
    ],
    link: "https://github.com/sivakanth1/cs-video-courses",
    image: "https://picsum.photos/800/600?random=114",
    featured: false
  }
];

export const EDUCATION: Education[] = [
  {
    institution: "Texas A&M University – Corpus Christi",
    location: "Corpus Christi, Texas",
    degree: "Master of Science, Computer Science",
    duration: "Jan 2024 - Dec 2025"
  },
  {
    institution: "Jawaharlal Nehru Technological University Hyderabad",
    location: "India",
    degree: "Bachelor of Technology, Computer Science & Engineering",
    duration: "Aug 2019 - Aug 2023"
  }
];

export const CERTIFICATIONS: Certification[] = [
  { name: "Google Cloud Facilitator program (All Levels)", issuer: "Google" },
  { name: "Data Structures", issuer: "UC San Diego & HSE University" }
];

export const PUBLICATIONS: Publication[] = [
  {
    title: "ABNet: Adaptive Balanced Network for Multiscale Object Detection in Remote Sensing Imagery",
    journal: "International Journal for Innovative Engineering and Management Research (IJEMR)",
    details: "Volume-12, Issue-06"
  }
];