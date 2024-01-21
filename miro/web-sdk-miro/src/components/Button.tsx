import React from 'react';
import '../assets/style.css';

interface ButtonProps {
  onClick: (file: File | null) => void;
}

const Button: React.FC<ButtonProps> = ({ onClick}) => (
  <button onClick={() => onClick(null)} className='buttonStyle'>
    Generate
  </button>
);

export default Button;
