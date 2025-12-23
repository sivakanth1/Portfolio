import React from 'react';
import { Github, Linkedin, Mail, Heart } from 'lucide-react';
import { SOCIAL_LINKS } from '../constants';

const Footer: React.FC = () => {
  return (
    <footer className="bg-white dark:bg-slate-900 py-12 border-t border-slate-200 dark:border-slate-800">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col md:flex-row justify-between items-center">
          <div className="mb-6 md:mb-0 text-center md:text-left">
            <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-2">Siva Kanth Reddy</h3>
            <p className="text-slate-600 dark:text-slate-400 text-sm max-w-xs">
              Building robust systems and exploring the world, one line of code at a time.
            </p>
          </div>

          <div className="flex space-x-6">
            <a href={SOCIAL_LINKS.github} target="_blank" rel="noopener noreferrer" className="text-slate-400 hover:text-primary-500 transition-colors">
              <span className="sr-only">GitHub</span>
              <Github size={24} />
            </a>
            <a href={SOCIAL_LINKS.linkedin} target="_blank" rel="noopener noreferrer" className="text-slate-400 hover:text-primary-500 transition-colors">
              <span className="sr-only">LinkedIn</span>
              <Linkedin size={24} />
            </a>
            <a href={SOCIAL_LINKS.email} className="text-slate-400 hover:text-primary-500 transition-colors">
              <span className="sr-only">Email</span>
              <Mail size={24} />
            </a>
          </div>
        </div>
        
        <div className="mt-8 pt-8 border-t border-slate-100 dark:border-slate-800 flex flex-col md:flex-row justify-between items-center text-sm text-slate-500 dark:text-slate-500">
          <p>&copy; {new Date().getFullYear()} Siva Kanth Reddy. All rights reserved.</p>
          <p className="mt-2 md:mt-0 flex items-center">
            Made with <Heart size={14} className="mx-1 text-red-500 fill-red-500" /> using React & Tailwind
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;