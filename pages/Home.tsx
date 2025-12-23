import React from 'react';
import { Link } from 'react-router-dom';
import { ArrowRight, ChevronDown, Book, Award, Briefcase, GraduationCap, Code2 } from 'lucide-react';
import { PROJECTS, SKILLS, SKILL_ICONS, EXPERIENCE, EDUCATION, CERTIFICATIONS, PUBLICATIONS, ABOUT_ME } from '../constants';
import FadeIn from '../components/AnimationWrapper';
import ProjectCard from '../components/ProjectCard';

const Home: React.FC = () => {
  const featuredProjects = PROJECTS.filter(p => p.featured).slice(0, 3);

  const scrollToSection = (id: string) => {
    const element = document.getElementById(id);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <div className="overflow-x-hidden">
      
      {/* Hero Section */}
      <section className="relative min-h-screen flex items-center justify-center pt-20 overflow-hidden">
        {/* Abstract Background Blobs */}
        <div className="absolute top-20 left-10 w-72 h-72 bg-purple-300 dark:bg-purple-900 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
        <div className="absolute top-20 right-10 w-72 h-72 bg-yellow-300 dark:bg-yellow-900 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
        <div className="absolute -bottom-8 left-20 w-72 h-72 bg-pink-300 dark:bg-pink-900 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center flex flex-col items-center">
          <FadeIn>
             <div className="mb-8 relative">
                <div className="w-40 h-40 md:w-56 md:h-56 rounded-full overflow-hidden border-4 border-white dark:border-slate-800 shadow-2xl mx-auto">
                  {/* Using the uploaded file name directly with URL encoding for spaces */}
                  <img 
                    src="photo_2025-02-18%2020.09.43.jpeg" 
                    alt="Siva Kanth Reddy" 
                    className="w-full h-full object-cover"
                  />
                </div>
                <div className="absolute bottom-2 right-4 md:right-8 w-6 h-6 bg-green-500 border-2 border-white dark:border-slate-900 rounded-full"></div>
             </div>

            <h2 className="text-xl md:text-2xl font-medium text-primary-600 dark:text-primary-400 mb-4 tracking-wide">
              Hello, I'm Siva Kanth Reddy
            </h2>
            <h1 className="text-5xl md:text-7xl font-bold text-slate-900 dark:text-white mb-6 leading-tight">
              Crafting Intelligent <br />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary-600 to-indigo-600 dark:from-primary-400 dark:to-indigo-400">
                Digital Experiences
              </span>
            </h1>
            <p className="max-w-2xl mx-auto text-lg text-slate-600 dark:text-slate-300 mb-10 leading-relaxed">
              Software Engineer specializing in Full Stack Development, AI/ML, and Cloud Architecture. 
              Bridging the gap between complex algorithms and intuitive user interfaces.
            </p>
            
            <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
              <button 
                onClick={() => scrollToSection('about-me')}
                className="px-8 py-4 rounded-full bg-slate-900 dark:bg-white text-white dark:text-slate-900 font-semibold hover:bg-slate-800 dark:hover:bg-slate-200 transition-all flex items-center shadow-lg hover:shadow-xl cursor-pointer"
              >
                About Me <ArrowRight className="ml-2" size={20} />
              </button>
              <Link 
                to="/blog" 
                className="px-8 py-4 rounded-full bg-white dark:bg-slate-800 text-slate-900 dark:text-white font-semibold border border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 transition-all shadow-sm hover:shadow-md"
              >
                Read Blog
              </Link>
            </div>
          </FadeIn>
        </div>

        <div className="absolute bottom-10 left-1/2 transform -translate-x-1/2 animate-bounce text-slate-400 dark:text-slate-500">
          <ChevronDown size={32} />
        </div>
      </section>

      {/* About Me Section (New) */}
      <section id="about-me" className="py-24 bg-white dark:bg-slate-950">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
           <FadeIn>
            <div className="text-center mb-12">
               <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-6">About Me</h2>
               <div className="h-1 w-20 bg-primary-500 mx-auto rounded-full mb-8"></div>
               <div className="text-left text-lg text-slate-600 dark:text-slate-300 space-y-6 leading-relaxed">
                 {ABOUT_ME.map((paragraph, idx) => (
                   <p key={idx}>{paragraph}</p>
                 ))}
               </div>
            </div>
           </FadeIn>
        </div>
      </section>

      {/* How I Build (Skills) Section (Moved here) */}
      <section className="py-24 bg-slate-50 dark:bg-slate-900">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="text-center mb-16">
              <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-4">How I Build</h2>
              <div className="h-1 w-20 bg-primary-500 mx-auto rounded-full"></div>
            </div>
          </FadeIn>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {SKILLS.map((skillGroup, index) => {
              const Icon = SKILL_ICONS[skillGroup.category] || Code2;
              return (
                <FadeIn key={skillGroup.category} delay={index * 0.1}>
                  <div className="bg-white dark:bg-slate-950 rounded-2xl p-8 border border-slate-100 dark:border-slate-800 hover:border-primary-200 dark:hover:border-primary-800 transition-colors h-full shadow-sm hover:shadow-md">
                    <div className="flex flex-col items-center text-center mb-6">
                      <div className="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-xl text-primary-600 dark:text-primary-400 mb-4">
                        <Icon size={32} />
                      </div>
                      <h3 className="text-xl font-bold text-slate-900 dark:text-white">{skillGroup.category}</h3>
                    </div>
                    <div className="flex flex-wrap justify-center gap-2">
                      {skillGroup.items.map(skill => (
                        <span key={skill} className="text-sm px-3 py-1.5 bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 rounded-lg border border-slate-200 dark:border-slate-700">
                          {skill}
                        </span>
                      ))}
                    </div>
                  </div>
                </FadeIn>
              );
            })}
          </div>
        </div>
      </section>

      {/* Featured Projects Section */}
      <section id="featured-projects" className="py-24 bg-white dark:bg-slate-950">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="flex justify-between items-end mb-12">
              <div>
                <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-2">Featured Projects</h2>
                <p className="text-slate-600 dark:text-slate-400">A glimpse into my development journey</p>
              </div>
              <Link to="/projects" className="hidden md:flex items-center text-primary-600 dark:text-primary-400 font-medium hover:underline">
                View All Projects <ArrowRight size={16} className="ml-1" />
              </Link>
            </div>
          </FadeIn>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mb-12">
            {featuredProjects.map((project, index) => (
              <FadeIn key={index} delay={index * 0.1}>
                <ProjectCard project={project} />
              </FadeIn>
            ))}
          </div>

          <div className="text-center md:hidden">
            <Link to="/projects" className="inline-flex items-center justify-center px-6 py-3 border border-slate-300 dark:border-slate-700 rounded-full text-slate-700 dark:text-slate-300 font-medium hover:bg-slate-50 dark:hover:bg-slate-900 transition-colors">
              View All Projects <ArrowRight size={16} className="ml-2" />
            </Link>
          </div>
        </div>
      </section>

      {/* Experience Section */}
      <section className="py-24 bg-slate-50 dark:bg-slate-900">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="flex items-center mb-12">
              <Briefcase className="text-primary-600 dark:text-primary-400 mr-4" size={32} />
              <h2 className="text-3xl font-bold text-slate-900 dark:text-white">Professional Experience</h2>
            </div>
          </FadeIn>

          <div className="relative border-l-2 border-slate-200 dark:border-slate-800 ml-3 md:ml-6 space-y-12">
            {EXPERIENCE.map((exp, index) => (
              <FadeIn key={index} delay={index * 0.1} direction="right">
                <div className="relative pl-8 md:pl-12">
                  <div className="absolute -left-[9px] top-0 h-4 w-4 rounded-full bg-primary-500 ring-4 ring-white dark:ring-slate-900"></div>
                  
                  <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between mb-2">
                    <h3 className="text-xl font-bold text-slate-900 dark:text-white">{exp.role}</h3>
                    <span className="text-sm font-medium text-primary-600 dark:text-primary-400 bg-primary-50 dark:bg-primary-900/20 px-3 py-1 rounded-full w-fit mt-2 sm:mt-0">
                      {exp.duration}
                    </span>
                  </div>
                  
                  <div className="text-lg font-medium text-slate-700 dark:text-slate-300 mb-1">{exp.company}</div>
                  <div className="text-sm text-slate-500 dark:text-slate-400 mb-4 flex items-center">
                    {exp.location}
                  </div>
                  
                  <ul className="space-y-2">
                    {exp.description.map((desc, i) => (
                      <li key={i} className="text-slate-600 dark:text-slate-400 flex items-start">
                        <span className="mr-2 mt-1.5 h-1.5 w-1.5 flex-shrink-0 rounded-full bg-slate-400 dark:bg-slate-600"></span>
                        <span className="leading-relaxed">{desc}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      {/* Education & Certs */}
      <section className="py-24 bg-white dark:bg-slate-950">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
            
            {/* Education */}
            <FadeIn>
              <div className="flex items-center mb-8">
                <GraduationCap className="text-primary-600 dark:text-primary-400 mr-3" size={28} />
                <h2 className="text-2xl font-bold text-slate-900 dark:text-white">Education</h2>
              </div>
              <div className="space-y-8">
                {EDUCATION.map((edu, idx) => (
                  <div key={idx} className="bg-slate-50 dark:bg-slate-900 p-6 rounded-xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <h3 className="font-bold text-lg text-slate-900 dark:text-white">{edu.institution}</h3>
                    <p className="text-primary-600 dark:text-primary-400 font-medium mb-1">{edu.degree}</p>
                    <div className="flex justify-between text-sm text-slate-500 dark:text-slate-400 mt-2">
                      <span>{edu.duration}</span>
                      <span>{edu.location}</span>
                    </div>
                  </div>
                ))}
              </div>
            </FadeIn>

            {/* Certs & Publications */}
            <FadeIn delay={0.2}>
              <div className="space-y-12">
                
                {/* Certifications */}
                <div>
                  <div className="flex items-center mb-8">
                    <Award className="text-primary-600 dark:text-primary-400 mr-3" size={28} />
                    <h2 className="text-2xl font-bold text-slate-900 dark:text-white">Certifications</h2>
                  </div>
                  <div className="bg-slate-50 dark:bg-slate-900 p-6 rounded-xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <ul className="space-y-4">
                      {CERTIFICATIONS.map((cert, idx) => (
                        <li key={idx} className="flex items-start">
                           <span className="mr-2 mt-1.5 h-1.5 w-1.5 flex-shrink-0 rounded-full bg-primary-500"></span>
                           <div>
                             <span className="font-medium text-slate-900 dark:text-white block">{cert.name}</span>
                             {cert.issuer && <span className="text-sm text-slate-500">{cert.issuer}</span>}
                           </div>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>

                {/* Publications */}
                <div>
                  <div className="flex items-center mb-6">
                    <Book className="text-primary-600 dark:text-primary-400 mr-3" size={28} />
                    <h2 className="text-2xl font-bold text-slate-900 dark:text-white">Publications</h2>
                  </div>
                   {PUBLICATIONS.map((pub, idx) => (
                    <div key={idx} className="bg-slate-50 dark:bg-slate-900 p-6 rounded-xl shadow-sm border border-slate-100 dark:border-slate-800">
                      <h4 className="font-semibold text-slate-900 dark:text-white mb-2">{pub.title}</h4>
                      <p className="text-sm text-slate-600 dark:text-slate-400 italic mb-1">{pub.journal}</p>
                      <span className="text-xs px-2 py-1 bg-slate-100 dark:bg-slate-800 rounded text-slate-500">{pub.details}</span>
                    </div>
                  ))}
                </div>

              </div>
            </FadeIn>
          </div>
        </div>
      </section>
    </div>
  );
};

export default Home;