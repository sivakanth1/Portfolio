import React from 'react';
import { Project } from '../types';
import { Github, ExternalLink, Calendar } from 'lucide-react';
import { motion } from 'framer-motion';

interface Props {
  project: Project;
}

const ProjectCard: React.FC<Props> = ({ project }) => {
  return (
    <motion.div 
      whileHover={{ y: -8 }}
      className="bg-white dark:bg-slate-900 rounded-2xl overflow-hidden shadow-lg border border-slate-100 dark:border-slate-800 flex flex-col h-full group"
    >
      <div className="relative overflow-hidden h-48 w-full">
        <img 
          src={project.image} 
          alt={project.title} 
          className="w-full h-full object-cover transform group-hover:scale-110 transition-transform duration-500"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-slate-900/80 to-transparent opacity-60 group-hover:opacity-40 transition-opacity" />
      </div>

      <div className="p-6 flex-1 flex flex-col">
        <div className="flex items-center justify-between mb-2">
           <span className="text-xs font-semibold uppercase tracking-wider text-primary-600 dark:text-primary-400 flex items-center gap-1">
             <Calendar size={12} />
             {project.period}
           </span>
        </div>
        
        <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-3 group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors">
          {project.title}
        </h3>

        <div className="mb-4 flex-1">
           <ul className="list-disc list-inside space-y-1">
              {project.description.slice(0, 2).map((desc, idx) => (
                <li key={idx} className="text-sm text-slate-600 dark:text-slate-400 line-clamp-2">
                  {desc}
                </li>
              ))}
           </ul>
        </div>

        <div className="flex flex-wrap gap-2 mt-auto">
          {project.tags.map(tag => (
            <span key={tag} className="px-3 py-1 bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-300 text-xs rounded-full">
              {tag}
            </span>
          ))}
        </div>
        
        <div className="mt-6 flex space-x-4 border-t border-slate-100 dark:border-slate-800 pt-4">
           {/* Fallback link if none provided in data */}
           <a href="#" className="flex items-center text-sm font-medium text-slate-600 dark:text-slate-400 hover:text-primary-600 dark:hover:text-primary-400 transition-colors">
             <Github size={18} className="mr-2" /> Code
           </a>
           <a href="#" className="flex items-center text-sm font-medium text-slate-600 dark:text-slate-400 hover:text-primary-600 dark:hover:text-primary-400 transition-colors">
             <ExternalLink size={18} className="mr-2" /> Live Demo
           </a>
        </div>
      </div>
    </motion.div>
  );
};

export default ProjectCard;