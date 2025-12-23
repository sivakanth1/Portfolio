
import React from 'react';
import { Navigate } from 'react-router-dom';

const Blog: React.FC = () => {
  return <Navigate to="/writing" replace />;
};

export default Blog;
