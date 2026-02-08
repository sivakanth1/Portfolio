import React from 'react';
import { Link } from 'react-router-dom';
import { ArrowRight, ChevronDown, Book, Award, Briefcase, GraduationCap, Code2 } from 'lucide-react';
import { PROJECTS, SKILLS, SKILL_ICONS, EXPERIENCE, EDUCATION, CERTIFICATIONS, PUBLICATIONS, HOW_I_BUILD } from '../constants';
import FadeIn from '../components/AnimationWrapper';
import ProjectCard from '../components/ProjectCard';
import { ChevronUp } from 'lucide-react';
import { useState } from 'react';
import SivaImg from '../assets/images/siva.jpg';

const Home: React.FC = () => {
  const featuredProjects = PROJECTS.filter(p => p.featured).slice(0, 3);
  const [showAdvancedSkills, setShowAdvancedSkills] = useState(false);

  const scrollToSection = (id: string) => {
    const element = document.getElementById(id);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <div className="overflow-x-hidden">

      {/* Hero Section */}
      <section className="relative min-h-screen flex items-center justify-center pt-28 pb-20 overflow-hidden bg-slate-50/50 dark:bg-slate-950/50">

        {/* Background Blobs - Re-positioned for the new layout */}
        <div className="absolute top-0 left-[-10%] w-[600px] h-[600px] bg-primary-200/30 dark:bg-primary-900/20 rounded-full mix-blend-multiply filter blur-3xl opacity-60 animate-blob"></div>
        <div className="absolute top-[10%] right-[-10%] w-[500px] h-[500px] bg-purple-200/30 dark:bg-purple-900/20 rounded-full mix-blend-multiply filter blur-3xl opacity-60 animate-blob animation-delay-2000"></div>
        <div className="absolute -bottom-32 left-[20%] w-[600px] h-[600px] bg-pink-200/30 dark:bg-pink-900/20 rounded-full mix-blend-multiply filter blur-3xl opacity-60 animate-blob animation-delay-4000"></div>

        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 w-full">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-20 items-center">

            {/* Left Column: Image (Profile) */}
            <div className="order-1 lg:order-1 flex justify-center lg:justify-start relative">
              <FadeIn delay={0.1} className="relative w-full max-w-lg aspect-square flex items-center justify-center lg:justify-end">
                {/* Decorative Blob Behind */}
                <div className="absolute w-[110%] h-[110%] bg-gradient-to-tr from-primary-500/20 to-purple-500/20 rounded-[60%_40%_30%_70%/60%_30%_70%_40%] animate-[blob_7s_infinite] blur-2xl"></div>

                {/* Image Mask/Container */}
                <div className="relative w-72 h-72 sm:w-96 sm:h-96 lg:w-[420px] lg:h-[420px] rounded-[2rem] rotate-3 hover:rotate-0 transition-all duration-500 ease-out shadow-2xl overflow-hidden border-4 border-white dark:border-slate-800 bg-white dark:bg-slate-900 group">
                  <img
                    src={SivaImg}
                    alt="Siva Kanth Reddy"
                    className="w-full h-full object-cover scale-105 group-hover:scale-110 transition-transform duration-700"
                  />
                  {/* Overlay gradient for depth */}
                  <div className="absolute inset-0 bg-gradient-to-t from-slate-900/20 to-transparent pointer-events-none"></div>
                </div>

                {/* Decorative elements */}
                <div className="absolute -bottom-6 -right-6 w-24 h-24 bg-yellow-400/20 rounded-full blur-xl animate-pulse"></div>
                <div className="absolute -top-6 -left-6 w-32 h-32 bg-primary-400/20 rounded-full blur-xl animate-pulse"></div>
              </FadeIn>
            </div>

            {/* Right Column: Text Content */}
            <div className="order-2 lg:order-2 text-center lg:text-left">
              <FadeIn delay={0.2} direction="right">
                <span className="inline-block py-1.5 px-4 rounded-full bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-primary-600 dark:text-primary-400 text-sm font-semibold mb-6 shadow-sm">
                  Software Engineer
                </span>

                <h2 className="text-2xl md:text-3xl font-bold text-primary-600 dark:text-primary-400 mb-4">
                  Hello, I'm Siva Kanth Reddy
                </h2>

                {/* Headline */}
                <h1 className="text-4xl md:text-6xl font-bold text-slate-900 dark:text-white mb-6 leading-tight tracking-tight">
                  Crafting Intelligent <br className="hidden md:block" />
                  <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary-600 to-indigo-600 dark:from-primary-400 dark:to-indigo-400">
                    Digital Experiences
                  </span>
                </h1>

                {/* Sub-headline */}
                <p className="text-xl md:text-2xl text-slate-700 dark:text-slate-200 mb-6 font-medium">
                  Full-stack & mobile software engineer building scalable systems across web, cloud, and AI.
                </p>

                {/* Supporting Paragraph */}
                <p className="text-base md:text-lg text-slate-500 dark:text-slate-400 mb-10 max-w-2xl mx-auto leading-relaxed">
                  I focus on building performant, reliable products that bridge complex algorithms and intuitive user experiences.
                </p>

                <div className="flex flex-col sm:flex-row items-center justify-center lg:justify-start gap-4">
                  <button
                    onClick={() => scrollToSection('featured-projects')}
                    className="px-8 py-4 rounded-xl bg-slate-900 dark:bg-white text-white dark:text-slate-900 font-bold hover:bg-slate-800 dark:hover:bg-slate-200 transition-all shadow-lg hover:shadow-primary-500/25 w-full sm:w-auto flex items-center justify-center group"
                  >
                    View Projects <ArrowRight className="ml-2 group-hover:translate-x-1 transition-transform" size={20} />
                  </button>
                  <Link
                    to="/blog"
                    className="px-8 py-4 rounded-xl bg-white dark:bg-slate-900 text-slate-900 dark:text-white font-bold border border-slate-200 dark:border-slate-700 hover:border-slate-300 dark:hover:border-slate-600 hover:bg-slate-50 dark:hover:bg-slate-800 transition-all w-full sm:w-auto shadow-sm"
                  >
                    Read Writing
                  </Link>
                </div>
              </FadeIn>
            </div>

          </div>
        </div>

        <div className="absolute bottom-8 left-1/2 transform -translate-x-1/2 animate-bounce text-slate-400 dark:text-slate-500 hidden lg:block">
          <ChevronDown size={28} />
        </div>
      </section>

      {/* 2. How I Build */}
      <section className="py-24 bg-white dark:bg-slate-950 border-t border-slate-100 dark:border-slate-900">
        <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-10 text-center">How I Build</h2>
            <div className="space-y-6 text-lg text-slate-600 dark:text-slate-300 leading-relaxed">
              {HOW_I_BUILD.map((text, i) => (
                <p key={i}>{text}</p>
              ))}
            </div>
          </FadeIn>
        </div>
      </section>

      {/* 3. Featured Projects */}
      <section id="featured-projects" className="py-24 bg-slate-50 dark:bg-slate-900">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="flex flex-col sm:flex-row justify-between items-end mb-12 gap-4">
              <div>
                <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-2">Featured Projects</h2>
                <p className="text-slate-600 dark:text-slate-400">Selected work highlighting technical challenges and outcomes.</p>
              </div>
              <Link to="/projects" className="text-primary-600 dark:text-primary-400 font-medium hover:underline inline-flex items-center">
                View All Projects <ArrowRight size={16} className="ml-1" />
              </Link>
            </div>
          </FadeIn>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
            {featuredProjects.map((project, index) => (
              <FadeIn key={index} delay={index * 0.1}>
                <ProjectCard project={project} />
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      {/* 4. Professional Experience */}
      <section className="py-24 bg-white dark:bg-slate-950">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="flex items-center mb-12">
              <Briefcase className="text-slate-400 mr-4" size={28} />
              <h2 className="text-3xl font-bold text-slate-900 dark:text-white">Professional Experience</h2>
            </div>
          </FadeIn>

          <div className="space-y-12">
            {EXPERIENCE.map((exp, index) => (
              <FadeIn key={index} delay={index * 0.1}>
                <div className="group relative border-l-2 border-slate-200 dark:border-slate-800 pl-8 pb-2">
                  <div className="absolute -left-[9px] top-0 h-4 w-4 rounded-full bg-white dark:bg-slate-900 border-2 border-slate-300 dark:border-slate-700 group-hover:border-primary-500 transition-colors"></div>

                  <div className="flex flex-col sm:flex-row sm:items-baseline sm:justify-between mb-2">
                    <h3 className="text-xl font-bold text-slate-900 dark:text-white">{exp.role}</h3>
                    <span className="text-sm font-medium text-slate-500 dark:text-slate-400">{exp.duration}</span>
                  </div>

                  <div className="text-lg font-medium text-primary-600 dark:text-primary-400 mb-1">{exp.company}</div>
                  <div className="text-sm text-slate-500 dark:text-slate-500 mb-4">{exp.location}</div>

                  <ul className="space-y-2">
                    {exp.description.map((desc, i) => (
                      <li key={i} className="text-slate-600 dark:text-slate-400 text-base leading-relaxed">
                        • {desc}
                      </li>
                    ))}
                  </ul>
                </div>
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      {/* 5. Technical Proficiency (Skills) */}
      <section className="py-24 bg-slate-50 dark:bg-slate-900">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <FadeIn>
            <div className="text-center mb-16">
              <h2 className="text-3xl font-bold text-slate-900 dark:text-white mb-4">Technical Proficiency</h2>
              <div className="h-1 w-20 bg-slate-200 dark:bg-slate-700 mx-auto rounded-full"></div>
            </div>
          </FadeIn>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
            {SKILLS.filter(g => g.category !== "Advanced / Research").map((skillGroup, index) => {
              const Icon = SKILL_ICONS[skillGroup.category] || Code2;
              return (
                <FadeIn key={skillGroup.category} delay={index * 0.1}>
                  <div className="bg-white dark:bg-slate-950 rounded-xl p-6 border border-slate-200 dark:border-slate-800 h-full">
                    <div className="flex items-center mb-6">
                      <div className="p-2 bg-slate-100 dark:bg-slate-900 rounded-lg text-slate-700 dark:text-slate-300 mr-3">
                        <Icon size={24} />
                      </div>
                      <h3 className="text-lg font-bold text-slate-900 dark:text-white">{skillGroup.category}</h3>
                    </div>
                    <div className="flex flex-wrap gap-2">
                      {skillGroup.items.map(skill => (
                        <span key={skill} className="text-sm px-3 py-1 bg-slate-50 dark:bg-slate-900 text-slate-700 dark:text-slate-300 rounded-md border border-slate-100 dark:border-slate-800">
                          {skill}
                        </span>
                      ))}
                    </div>
                  </div>
                </FadeIn>
              );
            })}
          </div>

          {/* Advanced / Research Toggle */}
          <div className="text-center">
            <button
              onClick={() => setShowAdvancedSkills(!showAdvancedSkills)}
              className="inline-flex items-center text-slate-500 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white font-medium transition-colors"
            >
              {showAdvancedSkills ? 'Hide Advanced Tooling' : 'View Advanced Tooling'}
              {showAdvancedSkills ? <ChevronUp size={16} className="ml-1" /> : <ChevronDown size={16} className="ml-1" />}
            </button>

            {showAdvancedSkills && (
              <FadeIn className="mt-8 max-w-2xl mx-auto bg-white dark:bg-slate-950 p-6 rounded-xl border border-slate-200 dark:border-slate-800">
                <h3 className="text-lg font-bold text-slate-900 dark:text-white mb-4">Advanced / Research</h3>
                <div className="flex flex-wrap justify-center gap-2">
                  {SKILLS.find(s => s.category === "Advanced / Research")?.items.map(skill => (
                    <span key={skill} className="text-sm px-3 py-1 bg-purple-50 dark:bg-purple-900/20 text-purple-700 dark:text-purple-300 rounded-md border border-purple-100 dark:border-purple-900/30">
                      {skill}
                    </span>
                  ))}
                </div>
                <p className="text-xs text-slate-500 mt-4">
                  These specialized tools are used primarily in my deep learning and systems optimization work.
                </p>
              </FadeIn>
            )}
          </div>
        </div>
      </section>

      {/* 6. Education & Publications */}
      <section className="py-24 bg-white dark:bg-slate-950 border-t border-slate-100 dark:border-slate-900">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12">

            <FadeIn>
              <div className="flex items-center mb-8">
                <GraduationCap className="text-primary-600 dark:text-primary-400 mr-3" size={28} />
                <h2 className="text-2xl font-bold text-slate-900 dark:text-white">Education</h2>
              </div>
              <div className="space-y-8">
                {EDUCATION.map((edu, idx) => (
                  <div key={idx} className="relative pl-6 border-l-2 border-slate-200 dark:border-slate-800">
                    <div className="absolute -left-[5px] top-1.5 w-2 h-2 rounded-full bg-slate-300 dark:bg-slate-700"></div>
                    <h3 className="font-bold text-lg text-slate-900 dark:text-white">{edu.institution}</h3>
                    <p className="text-primary-600 dark:text-primary-400 font-medium mb-1">{edu.degree}</p>
                    <div className="flex justify-between text-sm text-slate-500 dark:text-slate-400 mt-1">
                      <span>{edu.duration}</span>
                      <span>{edu.location}</span>
                    </div>
                  </div>
                ))}
              </div>
            </FadeIn>

            <FadeIn delay={0.2}>
              <div className="flex items-center mb-8">
                <Award className="text-primary-600 dark:text-primary-400 mr-3" size={28} />
                <h2 className="text-2xl font-bold text-slate-900 dark:text-white">Publications & Certifications</h2>
              </div>
              <div className="space-y-8">
                <div>
                  <h3 className="text-xs font-bold uppercase tracking-wider text-slate-400 mb-4">Publications</h3>
                  {PUBLICATIONS.map((pub, idx) => (
                    <div key={idx} className="mb-4 bg-slate-50 dark:bg-slate-900 p-4 rounded-xl border border-slate-100 dark:border-slate-800">
                      <a href="https://www.ijiemr.org/downloads/paper/Volume-12/abnet-adaptive-balanced-network-for-multiscale-object-detection-in-remote-sensing-imagery" target="_blank" className="font-bold text-slate-900 dark:text-white hover:text-primary-600 dark:hover:text-primary-400 transition-colors block mb-2 leading-tight">
                        {pub.title}
                      </a>
                      <p className="text-sm text-slate-500">{pub.journal} • {pub.details}</p>
                    </div>
                  ))}
                </div>

                <div>
                  <h3 className="text-xs font-bold uppercase tracking-wider text-slate-400 mb-4">Certifications</h3>
                  <ul className="space-y-3">
                    {CERTIFICATIONS.map((cert, idx) => (
                      <li key={idx} className="text-slate-700 dark:text-slate-300 flex items-start text-sm">
                        <span className="mr-3 text-primary-500 mt-1">●</span>
                        <span>
                          <span className="font-medium">{cert.name}</span>
                          {cert.issuer && <span className="text-slate-500 block text-xs mt-0.5">{cert.issuer}</span>}
                        </span>
                      </li>
                    ))}
                  </ul>
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