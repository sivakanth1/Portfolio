import 'package:flutter/material.dart';

/// =============== CENTRAL DATA ===============
class AppData {
  // showcase carousel - ADDED MOBILE DESCRIPTIONS
  static const showcaseProjects = <Map<String, dynamic>>[
    {
      'title': 'Dynamic Parallel Agentic Orchestration',
      // Desktop/Full description
      'description':
          'Designing and implementing a multi-agent controller using AWS EC2 and Lambda to dynamically choose between data-parallel and instruction-parallel execution across multiple LLMs, improving throughput and reducing latency by up to 40%.',
      // Mobile description - concise version
      'mobileDescription':
          'Built a multi-agent controller on AWS EC2 and Lambda for dynamic LLM execution, achieving 40% improved throughput and reduced latency across parallel processing modes.',
      // Desktop/Full details
      'details':
          'Developed a Streamlit-based interface integrated with Python\'s asyncio for concurrent LLM API execution and result aggregation, enhancing performance, reliability, and scalability for AI-driven orchestration applications.',
      // Mobile details - removed for cleaner mobile view (optional, keep if you want)
      'mobileDetails': '',
      'tech': ['Python', 'AWS EC2', 'Lambda', 'Streamlit', 'asyncio', 'LLMs'],
      'period': 'September 2025 – Present',
      'github': 'https://github.com/sivakanth1',
      'image': 'assets/LLM.jpg',
    },
    {
      'title': 'SynerSched – Academic Scheduling & Collaboration App',
      // Desktop/Full description
      'description':
          'Developed a Flutter app with Firebase backend that auto-generates conflict-free weekly schedules, improving users\' time-management efficiency by 30%.',
      // Mobile description
      'mobileDescription':
          'Flutter app with Firebase backend for auto-generating conflict-free schedules, improving time management by 30% with bilingual support and real-time collaboration.',
      // Desktop/Full details
      'details':
          'Implemented AES-256 encryption and secure Firebase integration, achieving zero data leakage in audits. Integrated bilingual support, dark/light themes, push notifications, and real-time collaboration features to enhance student engagement.',
      // Mobile details
      'mobileDetails': '',
      'tech': ['Flutter', 'Firebase', 'AES-256', 'Push Notifications'],
      'period': 'May 2025 – August 2025',
      'github': 'https://github.com/sivakanth1',
      'image': 'assets/synersched.jpg',
    },
    {
      'title': 'Detecting Road Damage from Aerial Imagery',
      // Desktop/Full description
      'description':
          'Implemented YOLOv7, Faster R-CNN, and Vision Transformers using Python (PyTorch) for real-time defect detection.',
      // Mobile description
      'mobileDescription':
          'Real-time road damage detection using YOLOv7, Faster R-CNN, and Vision Transformers with PyTorch, achieving 1.5x faster performance through CUDA optimization and Docker deployment.',
      // Desktop/Full details
      'details':
          'Optimized training via mixed precision and CUDA, improving model speed by 1.5x. Containerized the complete inference pipeline using Docker, enabling scalable deployment and reproducibility.',
      // Mobile details
      'mobileDetails': '',
      'tech': ['Python', 'PyTorch', 'YOLOv7', 'Docker', 'CUDA'],
      'period': 'January 2025 – April 2025',
      'github': 'https://github.com/sivakanth1',
      'image': 'assets/ase.jpg',
    },
  ];

  // grid projects + filter - KEEP AS IS (these are already short)
  static const projects = <Map<String, dynamic>>[
    {
      'title': 'Dynamic Parallel Agentic Orchestration',
      'category': 'software',
      'description':
          'Multi-agent controller using AWS for dynamic LLM execution optimization.',
      'tech': ['Python', 'AWS', 'Lambda', 'Streamlit'],
      'highlights': [
        'Improved throughput by 40%',
        'Concurrent LLM API execution',
        'Enhanced scalability',
      ],
      'year': '2025',
    },
    {
      'title': 'SynerSched – Academic Scheduling App',
      'category': 'application',
      'description':
          'Flutter app with Firebase for conflict-free schedule generation.',
      'tech': ['Flutter', 'Firebase', 'AES-256'],
      'highlights': [
        '30% time-management improvement',
        'Zero data leakage',
        'Real-time collaboration',
      ],
      'year': '2025',
    },
    {
      'title': 'Road Damage Detection System',
      'category': 'software',
      'description':
          'AI-powered defect detection using YOLOv7 and Vision Transformers.',
      'tech': ['Python', 'PyTorch', 'Docker', 'CUDA'],
      'highlights': [
        '1.5x model speed improvement',
        'Real-time detection',
        'Scalable Docker deployment',
      ],
      'year': '2025',
    },
    {
      'title': 'Bus Reservation System',
      'category': 'software',
      'description': 'State-level hackathon winning optimization system.',
      'tech': ['Java', 'MySQL', 'REST APIs'],
      'highlights': [
        'Won state-level hackathon',
        'Optimized efficiency',
        'Scalable architecture',
      ],
      'year': '2022',
    },
    {
      'title': 'Disaster Monitoring Web App',
      'category': 'application',
      'description':
          'Real-time disaster tracking developed during NASA Space Apps Hackathon.',
      'tech': ['React', 'Node.js', 'PostgreSQL'],
      'highlights': [
        '24-hour hackathon project',
        'Real-time monitoring',
        'NASA Space Apps Hackathon',
      ],
      'year': '2023',
    },
  ];

  // KEEP EVERYTHING ELSE EXACTLY AS IS
  static const skills = <String, List<String>>{
    'Programming Languages': [
      'Python',
      'Flutter',
      'Java',
      'Kotlin',
      'PHP',
      'C++',
    ],
    'Databases': ['MySQL', 'PostgreSQL', 'Firebase', 'MongoDB'],
    'AI/ML Frameworks': [
      'PyTorch',
      'TensorFlow',
      'Scikit-learn',
      'CUDA',
      'TensorRT',
      'vLLM',
    ],
    'Software Development': [
      'RESTful APIs',
      'Node.js',
      'React.js',
      'Next.js',
      'TypeScript',
      'Microservices',
    ],
    'Cloud & DevOps': [
      'Docker',
      'Kubernetes',
      'Jenkins',
      'AWS',
      'Azure DevOps',
      'CI/CD',
    ],
    'Data & Analytics': ['Spark', 'ETL', 'AWS Glue', 'Power BI', 'Tableau'],
  };

  static final education = <Map<String, dynamic>>[
    {
      'degree': 'Master of Science in Computer Science',
      'school': 'Texas A&M University – Corpus Christi',
      'location': 'Texas, USA',
      'period': 'January 2024 – December 2025',
      'icon': Icons.school,
    },
    {
      'degree': 'Bachelor of Technology in Computer Science & Engineering',
      'school': 'Jawaharlal Nehru Technological University Hyderabad',
      'location': 'India',
      'period': 'August 2019 – August 2023',
      'icon': Icons.school,
    },
  ];

  static const experience = <Map<String, dynamic>>[
    {
      'role': 'Teaching Assistant – Dept. Computer Science',
      'company': 'Texas A&M University–Corpus Christi',
      'location': 'Texas',
      'period': 'August 2025 – Present',
      'achievements': [
        'Guided 50+ undergraduate students in Python and C++, emphasizing Data Structures, Algorithms (DSA), and OOP.',
        'Designed and graded algorithmic assignments using automated Python testing scripts, ensuring 100% accuracy.',
      ],
    },
    {
      'role': 'Android Development Intern (Flutter)',
      'company': 'Liveasy',
      'location': 'India',
      'period': 'November 2022 – March 2023',
      'achievements': [
        'Built cross-platform logistics app in Flutter, reusing 70% of code across Android and Web platforms.',
        'Applied Material You UI principles, boosting user engagement by 20% in beta testing.',
      ],
    },
    {
      'role': 'Front End Development Intern',
      'company': 'Yugam.Inc',
      'location': 'India',
      'period': 'March 2022 – August 2022',
      'achievements': [
        'Designed responsive React.js interfaces integrated with Node.js APIs and PostgreSQL.',
        'Built reusable UI components using React Hooks and Redux, reducing build time by 25%.',
      ],
    },
  ];

  static const publications = <Map<String, String>>[
    {
      'title':
          'ABNet: Adaptive Balanced Network for Multiscale Object Detection in Remote Sensing Imagery',
      'journal':
          'International Journal for Innovative Engineering and Management Research (IJEMR)',
      'details': 'Volume-12, Issue-06',
      'year': '2023',
      'url':
          'https://www.ijiemr.org/downloads/paper/Volume-12/abnet-adaptive-balanced-network-for-multiscale-object-detection-in-remote-sensing-imagery',
    },
  ];

  static const certifications = <String>[
    'Completed all levels in Google Cloud Facilitator program - 2020',
    'Certified in "Data Structures" authorized by University of California San Diego and HSE University',
    'Won a state-level hackathon for developing an optimized Bus Reservation System',
    'Developed a web application during 24-hour NASA Space Apps Hackathon',
  ];

  // About Me Content
  static const aboutMe = <String>[
    'I\'m a Computer Science graduate student at Texas A&M University–Corpus Christi, driven by a passion for building solutions that bridge research and real-world impact. My journey began at age 12 with a love for solving math problems where curiosity evolved into creating optimized, scalable technology.',
    'What excites me most is finding better ways to solve problems. Whether it\'s accelerating a road damage detection model by 1.5x with CUDA, building a Flutter app that improves time management by 30%, or orchestrating LLMs to boost throughput by 40%, I focus on measurable results. My experience spans mobile development, AI/ML systems, and cloud infrastructure, giving me a versatile perspective on full-stack engineering.',
    'I\'m currently exploring LLM applications and don\'t limit myself to one domain. I adapt to where I can make the most impact, whether in healthcare, education, or infrastructure optimization.',
    'Beyond coding, you\'ll find me playing badminton, following Formula 1 racing, or competing in hackathons. As a Teaching Assistant, I also help students master algorithms and data structures.',
    'I\'m seeking opportunities in Software Engineering, ML Engineering, or Full-Stack Development where I can contribute to innovative projects and grow alongside evolving technology.',
  ];
}
