
import React from 'react';
import { useParams, Link, Navigate } from 'react-router-dom';
import { PROJECTS } from '../constants';
import { ArrowLeft, Github, ExternalLink, Calendar, Tag } from 'lucide-react';
import FadeIn from '../components/AnimationWrapper';

const ProjectDetail: React.FC = () => {
  const { id } = useParams<{ id: string }>();
  const project = PROJECTS.find(p => p.id === id);

  if (!project) {
    return <Navigate to="/projects" replace />;
  }

  return (
    <div className="min-h-screen pt-24 pb-16 bg-white dark:bg-slate-950">
      <article className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Header */}
        <FadeIn>
          <Link to="/projects" className="inline-flex items-center text-slate-500 hover:text-slate-900 dark:hover:text-white mb-8 transition-colors">
            <ArrowLeft size={16} className="mr-2" /> Back to Projects
          </Link>
          
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-6 mb-8">
            <h1 className="text-3xl md:text-5xl font-bold text-slate-900 dark:text-white">{project.title}</h1>
            <div className="flex gap-3">
              {project.link && (
                <a href={project.link} target="_blank" rel="noreferrer" className="px-4 py-2 bg-slate-900 dark:bg-white text-white dark:text-slate-900 rounded-lg font-medium flex items-center hover:opacity-90 transition-opacity">
                  <Github size={18} className="mr-2" /> Code
                </a>
              )}
            </div>
          </div>

          <div className="flex flex-wrap items-center gap-4 text-sm text-slate-500 dark:text-slate-400 mb-10 pb-10 border-b border-slate-100 dark:border-slate-900">
            <span className="flex items-center"><Calendar size={16} className="mr-2" /> {project.period}</span>
            <span className="px-2 py-1 bg-slate-100 dark:bg-slate-900 rounded uppercase text-xs font-semibold tracking-wider">{project.category}</span>
          </div>
        </FadeIn>

        {/* Hero Image */}
        {project.image && (
          <FadeIn delay={0.1}>
            <div className="rounded-2xl overflow-hidden shadow-sm mb-12 border border-slate-100 dark:border-slate-800">
              <img src={project.image} alt={project.title} className="w-full h-auto object-cover max-h-[500px]" />
            </div>
          </FadeIn>
        )}

        {/* Main Content */}
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-12">
           <div className="lg:col-span-2 space-y-12">
              
              {/* Problem / Approach / Results Pattern */}
              <FadeIn delay={0.2}>
                <section>
                  <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-4">The Challenge</h2>
                  <p className="text-lg text-slate-600 dark:text-slate-300 leading-relaxed">
                    {project.problem || project.description[0]}
                  </p>
                </section>
              </FadeIn>

              <FadeIn delay={0.3}>
                <section>
                  <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-4">The Approach</h2>
                   <p className="text-lg text-slate-600 dark:text-slate-300 leading-relaxed">
                    {project.approach || (project.description.length > 1 ? project.description[1] : "Details coming soon...")}
                   </p>
                </section>
              </FadeIn>

              <FadeIn delay={0.4}>
                <section>
                  <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-4">Key Results</h2>
                  <ul className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    {project.results ? project.results.map((result, i) => (
                      <li key={i} className="bg-slate-50 dark:bg-slate-900 p-4 rounded-xl border border-slate-100 dark:border-slate-800 text-slate-700 dark:text-slate-200 font-medium">
                        {result}
                      </li>
                    )) : (
                      <li className="text-slate-500 italic">Outcomes pending...</li>
                    )}
                  </ul>
                </section>
              </FadeIn>
           </div>

           {/* Sidebar: Tech Stack */}
           <div className="lg:col-span-1">
             <FadeIn delay={0.5}>
               <div className="bg-slate-50 dark:bg-slate-900/50 p-6 rounded-2xl border border-slate-100 dark:border-slate-800 sticky top-24">
                 <h3 className="text-sm font-bold uppercase tracking-wider text-slate-900 dark:text-white mb-6">Built With</h3>
                 <div className="flex flex-wrap gap-2">
                   {project.techStack.map(tech => (
                     <span key={tech} className="px-3 py-1.5 bg-white dark:bg-slate-900 text-slate-600 dark:text-slate-300 text-sm rounded-md border border-slate-200 dark:border-slate-800 shadow-sm">
                       {tech}
                     </span>
                   ))}
                 </div>
                 
                 {/* Logic to show advanced tools if present */}
                 <div className="mt-8 pt-6 border-t border-slate-200 dark:border-slate-800">
                    <p className="text-xs text-slate-500 leading-relaxed">
                      This project demonstrates proficiency in {project.techStack.slice(0, 3).join(', ')} and system architecture.
                    </p>
                 </div>
               </div>
             </FadeIn>
           </div>
        </div>

      </article>
    </div>
  );
};

export default ProjectDetail;
