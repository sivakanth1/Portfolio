
import React, { useState } from 'react';
import { BLOG_POSTS } from '../constants';
import FadeIn from '../components/AnimationWrapper';
import { BlogPost } from '../types';

const Writing: React.FC = () => {
  const [filter, setFilter] = useState<'All' | 'Technical' | 'Travel' | 'Reflections'>('All');

  const filteredPosts = filter === 'All' 
    ? BLOG_POSTS 
    : BLOG_POSTS.filter(post => post.category === filter);

  return (
    <div className="min-h-screen pt-28 pb-16 bg-white dark:bg-slate-950">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
        
        <FadeIn>
          <h1 className="text-4xl font-bold text-slate-900 dark:text-white mb-8">Writing</h1>
          
          {/* Filters */}
          <div className="flex gap-6 border-b border-slate-100 dark:border-slate-900 mb-12 overflow-x-auto pb-2">
            {['All', 'Technical', 'Travel', 'Reflections'].map((item) => (
              <button
                key={item}
                onClick={() => setFilter(item as any)}
                className={`text-sm font-medium pb-2 transition-colors whitespace-nowrap ${
                  filter === item 
                    ? 'text-slate-900 dark:text-white border-b-2 border-slate-900 dark:border-white' 
                    : 'text-slate-500 dark:text-slate-500 hover:text-slate-700 dark:hover:text-slate-300'
                }`}
              >
                {item}
              </button>
            ))}
          </div>
        </FadeIn>

        <div className="space-y-12">
          {filteredPosts.map((post: BlogPost) => (
            <FadeIn key={post.id}>
              <article className="group cursor-pointer">
                <div className="flex flex-col sm:flex-row gap-6 items-start">
                   {post.image && (
                     <div className="w-full sm:w-48 h-32 rounded-lg overflow-hidden shrink-0">
                        <img src={post.image} alt={post.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                     </div>
                   )}
                   <div>
                     <div className="flex items-center gap-3 text-xs text-slate-500 dark:text-slate-400 mb-2">
                        <span className="uppercase tracking-wider font-semibold">{post.category}</span>
                        <span>•</span>
                        <span>{post.date}</span>
                     </div>
                     <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-2 group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors">
                       {post.title}
                     </h2>
                     <p className="text-slate-600 dark:text-slate-400 leading-relaxed mb-3">
                       {post.excerpt}
                     </p>
                     <span className="text-sm font-medium text-slate-900 dark:text-white underline decoration-slate-300 underline-offset-4 group-hover:decoration-primary-500 transition-all">
                       Read full article
                     </span>
                   </div>
                </div>
              </article>
            </FadeIn>
          ))}
          
          {filteredPosts.length === 0 && (
             <div className="py-12 text-center text-slate-500">
               No posts found in this category yet.
             </div>
          )}
        </div>

      </div>
    </div>
  );
};

export default Writing;
