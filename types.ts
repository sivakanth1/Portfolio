
export interface SkillCategory {
  category: string;
  items: string[];
}

export interface Experience {
  company: string;
  role: string;
  duration: string;
  location: string;
  description: string[];
}

export interface Project {
  id: string;
  title: string;
  category: 'mobile' | 'web' | 'ml-ai' | 'system';
  period: string;
  description: string[]; // General description
  problem?: string;
  approach?: string;
  results?: string[];
  techStack: string[]; // Was tags
  link?: string;
  image?: string;
  featured: boolean;
  outcome?: string; // For the card highlight (e.g., "40% throughput increase")
}

export interface Education {
  institution: string;
  degree: string;
  duration: string;
  location: string;
}

export interface Publication {
  title: string;
  journal: string;
  details: string;
}

export interface Certification {
  name: string;
  issuer?: string;
}

export interface BlogPost {
  id: string;
  title: string;
  excerpt: string;
  date: string;
  category: 'Technical' | 'Travel' | 'Reflections';
  readTime: string;
  image?: string;
}
