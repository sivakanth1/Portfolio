
import React, { useState, useMemo } from 'react';
import { PROJECTS } from '../constants';
import ProjectCard from '../components/ProjectCard';
import FadeIn from '../components/AnimationWrapper';
import { Search } from 'lucide-react';
import { Link } from 'react-router-dom';
import { ArrowLeft } from 'lucide-react';

const AllProjects: React.FC = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [filter, setFilter] = useState<'all' | 'mobile' | 'web' | 'ml-ai' | 'system'>('all');

  const filteredProjects = useMemo(() => {
    return PROJECTS.filter(project => {
      const matchesSearch = project.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        project.techStack.some(t => t.toLowerCase().includes(searchQuery.toLowerCase()));
      const matchesFilter = filter === 'all' || project.category === filter;
      return matchesSearch && matchesFilter;
    });
  }, [searchQuery, filter]);

  const categories = [
    { id: 'all', label: 'All Projects' },
    { id: 'mobile', label: 'Mobile' },
    { id: 'web', label: 'Web' },
    { id: 'ml-ai', label: 'AI / ML' },
    { id: 'system', label: 'Systems' },
  ];

  return (
    <div className="min-h-screen pt-28 pb-16 bg-slate-50 dark:bg-slate-950">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <FadeIn>
          <div className="mb-10">
            <Link to="/" className="inline-flex items-center text-primary-600 dark:text-primary-400 hover:underline mb-4">
              <ArrowLeft size={16} className="mr-2" /> Back to Home
            </Link>
          </div>
        </FadeIn>
        <FadeIn>
          <div className="mb-12">
            <h1 className="text-4xl font-bold text-slate-900 dark:text-white mb-6">Projects</h1>
            <p className="text-lg text-slate-600 dark:text-slate-400 max-w-2xl">
              A complete archive of my technical projects, ranging from AI model orchestration to mobile application development.
            </p>

            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
              {/* Filter Tabs */}
              <div className="flex flex-wrap gap-2">
                {categories.map(cat => (
                  <button
                    key={cat.id}
                    onClick={() => setFilter(cat.id as any)}
                    className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${filter === cat.id
                      ? 'bg-slate-900 dark:bg-white text-white dark:text-slate-900 shadow-md'
                      : 'bg-white dark:bg-slate-900 text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800 border border-slate-200 dark:border-slate-800'
                      }`}
                  >
                    {cat.label}
                  </button>
                ))}
              </div>

              {/* Search Bar */}
              <div className="relative w-full md:w-64">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-slate-400" size={18} />
                <input
                  type="text"
                  placeholder="Search technologies..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="w-full pl-10 pr-4 py-2 rounded-lg border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900 text-slate-900 dark:text-white focus:ring-2 focus:ring-primary-500 outline-none transition-shadow"
                />
              </div>
            </div>
          </div>
        </FadeIn>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 min-h-[400px]">
          {filteredProjects.length > 0 ? (
            filteredProjects.map((project) => (
              <FadeIn key={project.id}>
                <ProjectCard project={project} />
              </FadeIn>
            ))
          ) : (
            <div className="col-span-full text-center py-20 text-slate-500">
              No projects found matching your criteria.
            </div>
          )}
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
