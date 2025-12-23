
import React from 'react';
import { Project } from '../types';
import { ArrowUpRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { motion } from 'framer-motion';

interface Props {
  project: Project;
}

const ProjectCard: React.FC<Props> = ({ project }) => {
  return (
    <motion.div 
      whileHover={{ y: -5 }}
      className="group bg-white dark:bg-slate-900 rounded-xl overflow-hidden border border-slate-200 dark:border-slate-800 shadow-sm hover:shadow-md transition-all h-full flex flex-col"
    >
      <Link to={`/projects/${project.id}`} className="block relative h-48 overflow-hidden">
        <img 
          src={project.image} 
          alt={project.title} 
          className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
        />
        {project.outcome && (
          <div className="absolute top-4 right-4 bg-white/90 dark:bg-slate-900/90 backdrop-blur text-primary-600 dark:text-primary-400 text-xs font-bold px-3 py-1.5 rounded-full border border-slate-200 dark:border-slate-700 shadow-sm">
            {project.outcome}
          </div>
        )}
      </Link>

      <div className="p-6 flex-1 flex flex-col">
        <div className="mb-2">
          <span className="text-xs font-medium text-slate-500 dark:text-slate-400 uppercase tracking-wider">
            {project.category === 'ml-ai' ? 'AI & Machine Learning' : project.category}
          </span>
        </div>
        
        <Link to={`/projects/${project.id}`} className="group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors">
          <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-2 flex items-center gap-2">
            {project.title}
            <ArrowUpRight size={18} className="opacity-0 group-hover:opacity-100 transition-opacity" />
          </h3>
        </Link>

        <p className="text-slate-600 dark:text-slate-300 text-sm mb-4 line-clamp-3 flex-1">
          {project.description[0]}
        </p>

        <div className="flex flex-wrap gap-2 mt-auto">
          {project.techStack.slice(0, 3).map(tag => (
            <span key={tag} className="px-2.5 py-1 bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400 text-xs rounded-md">
              {tag}
            </span>
          ))}
          {project.techStack.length > 3 && (
            <span className="px-2.5 py-1 bg-slate-50 dark:bg-slate-800 text-slate-400 dark:text-slate-500 text-xs rounded-md">
              +{project.techStack.length - 3}
            </span>
          )}
        </div>
      </div>
    </motion.div>
  );
};

export default ProjectCard;
