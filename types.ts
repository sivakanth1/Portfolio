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
  title: string;
  period: string;
  description: string[];
  tags: string[];
  link?: string;
  image?: string;
  featured: boolean;
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