import React from 'react';

interface CustomInputProps {
  title: string;
  placeholder: string;
  value?: string; 
  onChange: (value: string) => void;
}

const CustomInput: React.FC<CustomInputProps> = ({ title, placeholder, value = '', onChange }) => {
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    onChange(event.target.value);
  };

  return (
    <div>
      <label className='label'>{title}</label>
      <input
        className='customInput'
        type="text"
        placeholder={placeholder}
        value={value} 
        onChange={handleChange}
      />
    </div>
  );
};

export default CustomInput;
