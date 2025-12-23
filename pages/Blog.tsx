import React from 'react';
import { Plane, Map, Camera, Coffee } from 'lucide-react';
import FadeIn from '../components/AnimationWrapper';

const Blog: React.FC = () => {
  return (
    <div className="min-h-screen pt-24 pb-16 bg-white dark:bg-slate-950">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        
        <FadeIn>
          <div className="inline-flex items-center justify-center p-4 bg-primary-100 dark:bg-primary-900/30 rounded-full text-primary-600 dark:text-primary-400 mb-8">
            <Plane size={32} />
          </div>
          <h1 className="text-4xl md:text-5xl font-bold text-slate-900 dark:text-white mb-6">
            Travel Stories & Blog
          </h1>
          <p className="text-xl text-slate-600 dark:text-slate-300 max-w-2xl mx-auto mb-12">
            This space is currently under construction. Soon, I'll be sharing my travel adventures, 
            personal insights, and the stories behind the code.
          </p>
        </FadeIn>

        <FadeIn delay={0.2}>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 text-left">
            {[
              { icon: Map, title: "Destinations", desc: "Guides and tips from places I've visited." },
              { icon: Camera, title: "Photography", desc: "Capturing moments from around the globe." },
              { icon: Coffee, title: "Lifestyle", desc: "Balancing coding with life and exploration." }
            ].map((item, i) => (
              <div key={i} className="bg-slate-50 dark:bg-slate-900 p-8 rounded-2xl border border-slate-100 dark:border-slate-800">
                <item.icon className="text-primary-500 mb-4" size={24} />
                <h3 className="text-lg font-bold text-slate-900 dark:text-white mb-2">{item.title}</h3>
                <p className="text-slate-600 dark:text-slate-400 text-sm">{item.desc}</p>
              </div>
            ))}
          </div>
        </FadeIn>

        <FadeIn delay={0.4}>
          <div className="mt-16 p-8 bg-slate-50 dark:bg-slate-900 rounded-2xl border border-dashed border-slate-300 dark:border-slate-700">
            <h3 className="font-semibold text-slate-900 dark:text-white mb-2">Coming Soon</h3>
            <p className="text-slate-500 dark:text-slate-400">Stay tuned for updates!</p>
          </div>
        </FadeIn>

      </div>
    </div>
  );
};

export default Blog;