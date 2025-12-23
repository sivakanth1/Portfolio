
import { 
  Code2, 
  Terminal, 
  BrainCircuit, 
  Cloud, 
  Cpu
} from 'lucide-react';
import { SkillCategory, Experience, Project, Education, Publication, Certification, BlogPost } from './types';

export const SOCIAL_LINKS = {
  github: "https://github.com/sivakanth1",
  linkedin: "https://www.linkedin.com/in/sivakanth1", 
  email: "mailto:k.l.sivakanthreddy01@gmail.com",
  resume: "https://drive.google.com/file/d/1YkUBP7NihZQ8FGrIpS2nmlhIVBIfm5A3/view?usp=drive_link" // Placeholder
};

export const SKILL_ICONS: Record<string, any> = {
  "Primary Stack": Code2,
  "Systems & Foundations": Terminal,
  "Cloud Core": Cloud,
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
    category: "Cloud Core",
    items: [
      "AWS (Core Services)", 
      "Docker", 
      "CI/CD Pipelines"
    ]
  },
  {
    category: "Advanced / Research",
    items: [
      "PyTorch", "TensorFlow", 
      "CUDA", "vLLM", "Quantization", 
      "MLIR", "TVM", "XLA", 
      "TensorRT", "Argo", "SageMaker"
    ]
  }
];

export const HOW_I_BUILD = [
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
    id: "paramind",
    title: "ParaMind - Parallel Agent Orchestration",
    category: "system",
    period: "2025",
    techStack: ["Python", "AWS EC2", "Lambda", "Streamlit", "Asyncio"],
    description: [
      "Dynamic parallel agentic orchestration system using AWS EC2 and Lambda for intelligent LLM routing. Implements data-parallel and instruction-parallel execution modes with 40% throughput improvement.",
      "Dynamic mode selection (data/instruction parallel) with concurrent LLM API execution."
    ],
    problem: "Existing sequential LLM processing pipelines were too slow for high-volume requests.",
    approach: "Architected a distributed system using AWS Lambda for stateless execution and EC2 for persistent orchestration.",
    results: ["40% throughput improvement", "Reduced latency by 25%", "Scalable to 1000+ concurrent agents"],
    outcome: "40% Throughput Increase",
    link: "https://github.com/sivakanth1/ParaMind-Parallel_Agent_Orchestration",
    image: "images/Paramind.jpg",
    featured: true
  },
  {
    id: "synersched",
    title: "SynerSched",
    category: "mobile",
    period: "2025",
    techStack: ["Flutter", "Firebase", "Firestore", "AES-256", "Dart"],
    description: [
      "Academic scheduling and collaboration app built with Flutter and Firebase. Features conflict-free schedule generation, AES-256 encryption, bilingual support, and real-time collaboration.",
      "Auto-conflict detection in schedules with 30% improvement in time management."
    ],
    problem: "Students struggled with manual schedule coordination and data privacy.",
    approach: "Built a cross-platform mobile app with real-time Firestore sync and client-side encryption.",
    results: ["30% better time management", "Zero data leaks", "Supports 500+ daily active users"],
    outcome: "30% Time Efficiency",
    link: "https://github.com/sivakanth1/SynerSched",
    image: "images/synersched.jpeg",
    featured: true
  },
  {
    id: "road-damage",
    title: "Road Damage Detection",
    category: "ml-ai",
    period: "2025",
    techStack: ["Python", "PyTorch", "YOLOv7", "Docker", "CUDA"],
    description: [
      "YOLOv7-based road damage detection system trained on RDD2022 multi-national dataset. Achieves 63.85% mAP for detecting cracks and potholes with Gradio UI for interactive inference.",
      "Real-time object detection for road damage with 1.5x faster training using CUDA optimization."
    ],
    problem: "Manual road inspection is costly and slow.",
    approach: "Fine-tuned YOLOv7 on the RDD2022 dataset and optimized inference with TensorRT.",
    results: ["1.5x Training Speedup", "63.85% mAP Accuracy", "Real-time inference on edge devices"],
    outcome: "1.5x Faster Training",
    link: "https://github.com/sivakanth1/Detecting_Road_Damage",
    image: "images/detecting_road_damage.jpeg",
    featured: true
  },

  // ========== OTHER PROJECTS ==========
  {
    id: "dim-reduction",
    title: "Dimensionality Reduction for RecSys",
    category: "ml-ai",
    period: "2024",
    techStack: ["Python", "Scikit-learn", "TensorFlow", "Pandas"],
    description: [
      "Comprehensive comparison of dimensionality reduction techniques (PCA, t-SNE, Autoencoders) for recommendation systems with extensive visualization and performance analysis on MovieLens dataset."
    ],
    link: "https://github.com/sivakanth1/dimensionality_reduction_for_recommendation_systems",
    image: "https://picsum.photos/800/600?random=101",
    featured: false
  },
  {
    id: "wastewater",
    title: "Wastewater Predictive Maintenance",
    category: "ml-ai",
    period: "2024",
    techStack: ["Python", "PyTorch", "GNN", "Reinforcement Learning"],
    description: [
      "AI-powered predictive maintenance system for wastewater networks using Graph Neural Networks and Reinforcement Learning to detect anomalies and optimize flow distribution."
    ],
    link: "https://github.com/sivakanth1/wastewater-predictive-maintenance",
    image: "https://picsum.photos/800/600?random=102",
    featured: false
  },
  {
    id: "flashchat",
    title: "FlashChat",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "Firebase Auth", "Firestore", "Dart"],
    description: [
      "Real-time mobile chat application with Firebase authentication and Firestore. Features animated UI, typewriter effects, secure messaging, and email verification."
    ],
    link: "https://github.com/sivakanth1/FlashChat-Mobile-Application-Using-Flutter-",
    image: "https://picsum.photos/800/600?random=103",
    featured: false
  },
  {
    id: "clima",
    title: "Clima Weather App",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "OpenWeatherMap API", "Geolocator", "Dart"],
    description: [
      "Weather application built with Flutter using OpenWeatherMap API. Provides real-time weather data with location services, dynamic UI based on conditions, and temperature unit conversion."
    ],
    link: "https://github.com/sivakanth1/Clima-A-Weather-Application-Using-Flutter",
    image: "https://picsum.photos/800/600?random=104",
    featured: false
  },
  {
    id: "bmi",
    title: "BMI Calculator",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "Dart", "Material Design"],
    description: [
      "Body Mass Index calculator app with gender selection, height slider, weight/age inputs, and health interpretation. Features dark theme UI and Google Mobile Ads integration."
    ],
    link: "https://github.com/sivakanth1/BMI-Calculator-Using-Flutter",
    image: "https://picsum.photos/800/600?random=105",
    featured: false
  },
  {
    id: "bus-reservation",
    title: "Bus Reservation System",
    category: "web",
    period: "2022",
    techStack: ["Java", "MySQL", "REST API", "HTML/CSS"],
    description: [
      "State-level hackathon winning web application for bus reservation management. Developed with Java, MySQL, and REST APIs, featuring optimized booking workflows and scalable architecture."
    ],
    link: "https://github.com/sivakanth1/myBusReservation-Web-Application",
    image: "https://picsum.photos/800/600?random=106",
    featured: false
  },
  {
    id: "job-scheduling",
    title: "Job Scheduling Visualizer",
    category: "web",
    period: "2023",
    techStack: ["Flutter Web", "Dart", "Canvas API", "Firebase"],
    description: [
      "Interactive web application built with Flutter for visualizing CPU scheduling algorithms including FCFS, SJF, Priority, and Round Robin with Gantt charts and performance metrics."
    ],
    link: "https://github.com/sivakanth1/Job-Scheduling-Algorithms-Web-Application",
    image: "https://picsum.photos/800/600?random=107",
    featured: false
  },
  {
    id: "fifo-visualizer",
    title: "FIFO Page Replacement Visualizer",
    category: "web",
    period: "2022",
    techStack: ["HTML", "CSS", "JavaScript", "Firebase"],
    description: [
      "Educational web application demonstrating FIFO page replacement algorithm with step-by-step visualization, page fault detection, and interactive input for operating systems concepts."
    ],
    link: "https://github.com/sivakanth1/Page_Replacement_FIFO-Web-Application",
    image: "https://picsum.photos/800/600?random=108",
    featured: false
  },
  {
    id: "book-cricket",
    title: "Book Cricket Game",
    category: "web",
    period: "2023",
    techStack: ["Flutter Web", "Dart", "Game Dev"],
    description: [
      "Digital recreation of the classic book cricket game built with Flutter. Features random page number generation, score tracking, and intuitive gameplay mechanics."
    ],
    link: "https://github.com/sivakanth1/Book-Cricket",
    image: "https://picsum.photos/800/600?random=109",
    featured: false
  },
  {
    id: "dist-os",
    title: "Distributed OS Manager",
    category: "web",
    period: "2022",
    techStack: ["HTML", "CSS", "JavaScript", "Chart.js"],
    description: [
      "Web-based distributed operating system management tool providing resource allocation, process scheduling, and distributed system visualization capabilities."
    ],
    link: "https://github.com/sivakanth1/distributed-OS-manager",
    image: "https://picsum.photos/800/600?random=110",
    featured: false
  },
  {
    id: "dynamic-scheduler",
    title: "Dynamic Work Scheduler",
    category: "system",
    period: "2024",
    techStack: ["Python", "Flask", "SQLite", "JavaScript"],
    description: [
      "Intelligent work scheduling system that dynamically allocates tasks based on priority, deadlines, and resource availability. Features automated conflict resolution and optimization algorithms."
    ],
    link: "https://github.com/sivakanth1/Dynamic-Work-Scheduler1",
    image: "https://picsum.photos/800/600?random=111",
    featured: false
  },
  {
    id: "accessibility-translator",
    title: "Multimodal Accessibility Translator",
    category: "system",
    period: "2024",
    techStack: ["Python", "OpenAI GPT-4", "Flask", "NLTK"],
    description: [
      "Multi-agent system for accessibility translation supporting three modalities: Image-to-Audio, Text-to-Sign Language (ASL), and Complex Text-to-Visual Diagrams using AI models."
    ],
    link: "https://github.com/sivakanth1/Multimodal-Accessibility-Translator",
    image: "https://picsum.photos/800/600?random=112",
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

export const BLOG_POSTS: BlogPost[] = [
  {
    id: '1',
    title: "Scaling LLM Agents with AWS Lambda",
    excerpt: "How I improved system throughput by 40% using serverless architecture.",
    date: "Feb 15, 2025",
    category: "Technical",
    readTime: "5 min read",
    image: "https://picsum.photos/800/600?random=201"
  },
  {
    id: '2',
    title: "Traveling through the Lens of a Developer",
    excerpt: "Exploring new cultures helps me write better code. Here is why.",
    date: "Jan 10, 2025",
    category: "Travel",
    readTime: "3 min read",
    image: "https://picsum.photos/800/600?random=202"
  },
  {
    id: '3',
    title: "Why I Switched from Java to Kotlin for Android",
    excerpt: "A look at productivity gains and modern app architecture.",
    date: "Dec 05, 2024",
    category: "Technical",
    readTime: "6 min read",
    image: "https://picsum.photos/800/600?random=203"
  }
];
