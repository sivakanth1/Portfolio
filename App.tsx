
import React from 'react';
import { HashRouter as Router, Routes, Route } from 'react-router-dom';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import Home from './pages/Home';
import AllProjects from './pages/AllProjects';
import ProjectDetail from './pages/ProjectDetail.tsx';
import Writing from './pages/Writing';
import ScrollToTop from './components/ScrollToTop';
import BlogFuture from './pages/BlogFuture.tsx';

// Simple ScrollToTop component to reset scroll on route change
const ScrollHandler = () => {
  React.useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return null;
};

const App: React.FC = () => {
  return (
    <Router>
      <ScrollToTop />
      <div className="flex flex-col min-h-screen bg-white dark:bg-slate-950 transition-colors duration-300 font-sans">
        <Navbar />
        <main className="flex-grow">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/projects" element={<AllProjects />} />
            <Route path="/projects/:id" element={<ProjectDetail />} />
            <Route path="/writing" element={<Writing />} />
            {/* Redirect /blog to /writing for backward compatibility if needed, or just route */}
            {/* <Route path="/blog" element={<Writing />} /> */}
            <Route path="/blogfuture" element={<BlogFuture />} />
          </Routes>
        </main>
        <Footer />
      </div>
    </Router>
  );
};

export default App;
