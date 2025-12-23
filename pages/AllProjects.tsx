import React from 'react';
import { Link } from 'react-router-dom';
import { ArrowLeft } from 'lucide-react';
import { PROJECTS } from '../constants';
import ProjectCard from '../components/ProjectCard';
import FadeIn from '../components/AnimationWrapper';

const AllProjects: React.FC = () => {
  return (
    <div className="min-h-screen pt-24 pb-16 bg-slate-50 dark:bg-slate-950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <FadeIn>
          <div className="mb-10">
            <Link to="/" className="inline-flex items-center text-primary-600 dark:text-primary-400 hover:underline mb-4">
              <ArrowLeft size={16} className="mr-2" /> Back to Home
            </Link>
            <h1 className="text-4xl font-bold text-slate-900 dark:text-white mb-4">All Projects</h1>
            <p className="text-lg text-slate-600 dark:text-slate-400 max-w-2xl">
              A complete archive of my technical projects, ranging from AI model orchestration to mobile application development.
            </p>
          </div>
        </FadeIn>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {PROJECTS.map((project, index) => (
            <FadeIn key={index} delay={index * 0.1}>
              <ProjectCard project={project} />
            </FadeIn>
          ))}
        </div>
        
        <FadeIn delay={0.4}>
          <div className="mt-16 text-center">
            <p className="text-slate-500 dark:text-slate-400">
              Want to see even more? Check out my <a href="https://github.com/sivakanth1?tab=repositories" target="_blank" rel="noreferrer" className="text-primary-600 dark:text-primary-400 font-medium hover:underline">GitHub Profile</a>.
            </p>
          </div>
        </FadeIn>
      </div>
    </div>
  );
};

export default AllProjects;