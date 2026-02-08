
import {
  Code2,
  Terminal,
  BrainCircuit,
  Cloud,
  Cpu
} from 'lucide-react';
import { SkillCategory, Experience, Project, Education, Publication, Certification, BlogPost } from './types';
import ParamindImg from './assets/images/Paramind.jpg';
import SynerSchedImg from './assets/images/synersched.jpeg';
import RoadDamageImg from './assets/images/detecting_road_damage.jpeg';
import WastewaterImg from './assets/images/WastewaterImg.png';
import DimReductionImg from './assets/images/DimReductionImg.jpg';
import BusReservationImg from './assets/images/BusResImg.jpg';
// import BMIImg from './assets/images/BMIImg.jpg';
// import ClimaImg from './assets/images/ClimaImg.jpg';
// import FlashChatImg from './assets/images/FlashChatImg.jpg';
import JobSchedulingImg from './assets/images/JobSchedulingImg.jpg';
// import FIFOImg from './assets/images/FIFOImg.jpg';
// import DistributedOSImg from './assets/images/DistributedOSImg.jpg';
import DynamicSchedulerImg from './assets/images/DynamicSchedulerImg.jpg';
import AccessibilityTranslatorImg from './assets/images/AccessibilityTranslatorImg.jpg';

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
    image: ParamindImg,
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
    image: SynerSchedImg,
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
    image: RoadDamageImg,
    featured: true
  },

  // ========== OTHER PROJECTS ==========
  {
    id: "dim-reduction",
    title: "Dimensionality Reduction for RecSys",
    category: "ml-ai",
    period: "2025",
    techStack: ["Python", "scikit-learn", "TensorFlow", "Keras", "NumPy", "Matplotlib", "Jupyter", "Google Colab"],
    description: [
      "Comparative analysis of dimensionality reduction techniques including PCA, t-SNE, and Autoencoders for collaborative filtering recommendation systems.",
      "Evaluated linear and non-linear methods to reduce high-dimensional user-item interaction matrices while preserving meaningful recommendation patterns."
    ],
    problem: "High-dimensional user-item interaction matrices make recommendation systems computationally expensive and difficult to analyze or visualize effectively.",
    approach: "Implemented and compared PCA, t-SNE, and deep autoencoders using scikit-learn and TensorFlow, evaluating reconstruction error and clustering behavior through quantitative metrics and visual analysis.",
    results: [
      "PCA achieved reconstruction error of 0.000745",
      "Autoencoder achieved reconstruction error of 0.000754",
      "t-SNE revealed clear clustering patterns in user behavior"
    ],
    outcome: "Efficient Dimensionality Reduction with Comparable Accuracy",
    link: "https://github.com/sivakanth1/dimensionality_reduction_for_recommendation_systems",
    image: DimReductionImg,
    featured: false
  },
  {
    id: "wastewater",
    title: "Wastewater Predictive Maintenance",
    category: "ml-ai",
    period: "2025",
    techStack: ["Python", "PyTorch", "PyTorch Geometric", "Stable-Baselines3", "Gymnasium", "CUDA", "NumPy", "Pandas", "scikit-learn", "Matplotlib", "Jupyter"],
    description: [
      "AI-driven system for predictive maintenance and flow optimization in wastewater networks using Graph Neural Networks and Reinforcement Learning.",
      "Combines unsupervised anomaly detection with PPO-based control to identify infrastructure risks and reduce network overload."
    ],
    problem: "Municipal wastewater networks rely on reactive maintenance and lack intelligent mechanisms for early anomaly detection and real-time flow optimization.",
    approach: "Designed a dual-AI pipeline using a graph autoencoder for node-level anomaly detection and a PPO-based reinforcement learning agent to dynamically regulate flow within a simulated network environment.",
    results: [
      "Reduced capacity violations by approximately 40%",
      "Detected critical anomaly nodes using GNN-based reconstruction error",
      "Achieved sub-100ms inference time for anomaly evaluation"
    ],
    outcome: "40% Reduction in Network Overload Events",
    link: "https://github.com/sivakanth1/wastewater-predictive-maintenance",
    image: WastewaterImg,
    featured: false
  },
  {
    id: "flashchat",
    title: "FlashChat",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "Dart", "Firebase Authentication", "Cloud Firestore", "Firebase Core", "AnimatedTextKit"],
    description: [
      "Real-time cross-platform mobile chat application built with Flutter and Firebase, supporting authentication, email verification, and live message synchronization.",
      "Implements modern UI animations and responsive chat interfaces with secure backend integration."
    ],
    problem: "Building real-time messaging applications requires reliable synchronization, secure authentication, and responsive UI handling across mobile platforms.",
    approach: "Developed a Flutter-based chat application using Firebase Authentication for user management and Cloud Firestore streams for real-time message delivery, combined with custom UI components and animations for a smooth user experience.",
    results: [
      "Enabled real-time message synchronization across all connected clients",
      "Implemented secure email-based authentication with verification checks",
      "Delivered a responsive cross-platform chat experience on Android and iOS"
    ],
    outcome: "Real-Time Cross-Platform Messaging Application",
    link: "https://github.com/sivakanth1/FlashChat-Mobile-Application-Using-Flutter-",
    image: "https://picsum.photos/800/600?random=103", // TODO: Add FlashChatImg
    featured: false
  },
  {
    id: "clima",
    title: "Clima Weather App",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "Dart", "OpenWeatherMap API", "HTTP", "Geolocator", "Flutter Spinkit"],
    description: [
      "Location-aware mobile weather application built with Flutter that provides real-time weather information for the user’s current location or any searched city.",
      "Features dynamic UI updates, dark theme support, and contextual weather messaging based on live API data."
    ],
    problem: "Users need a simple and intuitive way to access real-time weather information based on location or city search with a clean mobile-friendly interface.",
    approach: "Implemented a Flutter-based mobile application integrating the OpenWeatherMap API, GPS-based location services, and dynamic UI rendering to display real-time weather conditions and contextual feedback.",
    results: [
      "Enabled real-time weather retrieval using GPS and city-based search",
      "Delivered dynamic UI updates based on weather conditions",
      "Provided a responsive and visually intuitive mobile weather experience"
    ],
    outcome: "Real-Time Location-Based Weather Application",
    link: "https://github.com/sivakanth1/Clima-A-Weather-Application-Using-Flutter",
    image: "https://picsum.photos/800/600?random=104", // TODO: Add ClimaImg
    featured: false
  },
  {
    id: "bmi",
    title: "BMI Calculator",
    category: "mobile",
    period: "2023",
    techStack: ["Flutter", "Dart", "Google Mobile Ads", "Font Awesome", "Cupertino Icons"],
    description: [
      "Mobile BMI calculator application built with Flutter that allows users to compute Body Mass Index with instant health interpretation.",
      "Features a modern dark-themed UI with interactive sliders, reusable components, and ad monetization support."
    ],
    problem: "Users need a simple and intuitive way to calculate BMI and understand basic health indicators through a mobile-friendly interface.",
    approach: "Developed a Flutter-based mobile application using modular UI components and centralized calculation logic to compute BMI and present health interpretations based on standard guidelines.",
    results: [
      "Delivered accurate BMI calculations with real-time UI feedback",
      "Implemented reusable Flutter components for consistent UI behavior",
      "Integrated Google Mobile Ads for basic app monetization"
    ],
    outcome: "Interactive BMI Calculation Mobile App",
    link: "https://github.com/sivakanth1/BMI-Calculator-Using-Flutter",
    image: "https://picsum.photos/800/600?random=105", // TODO: Add BMIImg
    featured: false
  },
  {
    id: "bus-reservation",
    title: "Bus Reservation System",
    category: "web",
    period: "2022",
    techStack: ["HTML", "CSS", "Firebase Hosting", "Firebase Backend"],
    description: [
      "Web-based bus reservation application with frontend and backend support, deployed using Firebase.",
      "Provides a simple interface for users to access and interact with a bus booking system through a hosted web platform."
    ],
    problem: "Manual or unstructured bus reservation systems make it difficult for users to view and manage bookings through a centralized online interface.",
    approach: "Built a lightweight web application using HTML and CSS for the frontend and Firebase services for backend integration and hosting.",
    results: [
      "Successfully deployed a live bus reservation web application",
      "Enabled frontend and backend integration using Firebase",
      "Delivered an accessible web-based booking interface"
    ],
    outcome: "Live Bus Reservation Web Application",
    link: "https://github.com/sivakanth1/myBusReservation-Web-Application",
    image: BusReservationImg,
    featured: false
  },
  {
    id: "job-scheduling",
    title: "Job Scheduling Visualizer",
    category: "web",
    period: "2023",
    techStack: ["Flutter", "Dart", "Firebase Hosting"],
    description: [
      "Web-based application that simulates job scheduling algorithms and computes waiting time and turnaround time for each process.",
      "Displays average waiting time and average turnaround time to help visualize scheduling efficiency."
    ],
    problem: "Understanding job scheduling algorithms and their impact on process execution metrics can be difficult without interactive visualization.",
    approach: "Built a Flutter web application that implements job scheduling logic and dynamically calculates per-process and average waiting and turnaround times.",
    results: [
      "Accurately computed waiting time and turnaround time for each process",
      "Displayed average scheduling metrics for algorithm comparison",
      "Deployed a live interactive web application using Firebase Hosting"
    ],
    outcome: "Interactive Job Scheduling Algorithm Simulator",
    link: "https://github.com/sivakanth1/Job-Scheduling-Algorithms-Web-Application",
    image: JobSchedulingImg,
    featured: false
  },
  {
    id: "fifo-visualizer",
    title: "FIFO Page Replacement Visualizer",
    category: "web",
    period: "2022",
    techStack: ["HTML", "CSS", "JavaScript", "jQuery", "Firebase Hosting"],
    description: [
      "Interactive web-based visualization tool for demonstrating the FIFO page replacement algorithm used in operating systems memory management.",
      "Provides real-time visualization of page frames along with live statistics for page faults and page hits."
    ],
    problem: "Understanding page replacement algorithms can be challenging without visual feedback showing how pages are loaded, replaced, and counted as faults or hits.",
    approach: "Built a browser-based simulation using JavaScript to implement FIFO logic, combined with dynamic UI updates and animations to visualize page frame state and algorithm behavior in real time.",
    results: [
      "Visualized FIFO page replacement behavior with real-time page fault and hit tracking",
      "Enabled interactive experimentation with cache size and page reference sequences",
      "Deployed a responsive educational tool accessible via the web"
    ],
    outcome: "Interactive FIFO Page Replacement Algorithm Visualizer",
    link: "https://github.com/sivakanth1/Page_Replacement_FIFO-Web-Application",
    image: "https://picsum.photos/800/600?random=110", // TODO: Add FIFOImg
    featured: false
  },
  // {
  //   id: "book-cricket",
  //   title: "Book Cricket Game",
  //   category: "web",
  //   period: "2023",
  //   techStack: ["Flutter Web", "Dart", "Game Dev"],
  //   description: [
  //     "Digital recreation of the classic book cricket game built with Flutter. Features random page number generation, score tracking, and intuitive gameplay mechanics."
  //   ],
  //   link: "https://github.com/sivakanth1/Book-Cricket",
  //   image: "https://picsum.photos/800/600?random=109",
  //   featured: false
  // },
  {
    id: "dist-os",
    title: "Distributed OS Manager",
    category: "web",
    period: "2024",
    techStack: ["Flutter", "Dart", "Firebase", "Firebase Authentication", "Firebase Backend"],
    description: [
      "Web-based application for real-time monitoring and management of distributed operating systems using a centralized interface.",
      "Provides cross-platform access to node monitoring, resource management, and network configuration through a responsive Flutter UI."
    ],
    problem: "Managing and monitoring distributed operating system nodes becomes complex without a centralized interface for real-time visibility and control.",
    approach: "Built a Flutter-based web application following the MVC pattern, integrating Firebase services for authentication and backend communication to manage distributed system components from a single dashboard.",
    results: [
      "Enabled real-time monitoring of distributed system nodes",
      "Implemented centralized resource and process management capabilities",
      "Delivered a responsive cross-platform interface for system administration"
    ],
    outcome: "Centralized Distributed OS Monitoring Platform",
    link: "https://github.com/sivakanth1/distributed-OS-manager",
    image: "https://picsum.photos/800/600?random=111", // TODO: Add DistributedOSImg
    featured: false
  },
  {
    id: "dynamic-scheduler",
    title: "Dynamic Work Scheduler",
    category: "system",
    period: "2024",
    techStack: ["Kotlin", "Android Jetpack", "ViewModel", "LiveData", "Room", "Firebase", "MPAndroidChart", "Gradle"],
    description: [
      "Android task management application designed to help users plan, visualize, and analyze their work schedules across multiple days.",
      "Implements smart scheduling, conflict prevention, and productivity analytics using a clean MVVM architecture."
    ],
    problem: "Managing tasks across multiple days becomes inefficient without clear visualization, conflict prevention, and insight into time allocation.",
    approach: "Developed an Android application using Kotlin and MVVM architecture, leveraging Room for persistent storage, ViewModel for state management, and interactive charts to visualize weekly productivity.",
    results: [
      "Enabled multi-day task scheduling with automatic conflict prevention",
      "Persisted task data reliably using Room-based local storage",
      "Provided weekly productivity insights through interactive visual reports"
    ],
    outcome: "Multi-Day Task Scheduling and Productivity Analytics App",
    link: "https://github.com/sivakanth1/Dynamic-Work-Scheduler1",
    image: DynamicSchedulerImg,
    featured: false
  },
  {
    id: "accessibility-translator",
    title: "Multimodal Accessibility Translator",
    category: "system",
    period: "2025",
    techStack: ["Python", "CrewAI", "OpenAI GPT-4o", "DALL-E 3", "Flask", "NLTK", "TextStat", "LangChain"],
    description: [
      "Multi-agent accessibility system that transforms content across visual, hearing, and cognitive modalities including image-to-audio, text-to-sign-language, and complex-text-to-visual diagrams.",
      "Implements structured pipelines with automated evaluation to generate WCAG-aligned, high-quality accessible outputs."
    ],
    problem: "Digital content is often inaccessible to users with visual, hearing, or cognitive disabilities due to a lack of automated, multi-modal accessibility tools.",
    approach: "Designed a multi-agent system using CrewAI and GPT-4o to orchestrate specialized pipelines for image description, ASL translation, and visual summarization, supported by automated evaluation metrics and a Flask-based web interface.",
    results: [
      "Implemented three fully functional accessibility pipelines with structured JSON outputs",
      "Generated multi-level image descriptions with synchronized audio narration",
      "Achieved consistent readability and lexical diversity across evaluated test cases"
    ],
    outcome: "End-to-End Multimodal Accessibility Translation System",
    link: "https://github.com/sivakanth1/Multimodal-Accessibility-Translator",
    image: AccessibilityTranslatorImg,
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
    location: "Hyderabad, India",
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
