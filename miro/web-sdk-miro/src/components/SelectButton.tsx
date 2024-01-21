import * as React from 'react';

interface SelectButtonProps {
  label: string;
  selected: boolean;
  onClick: () => void;
}

const SelectButton: React.FC<SelectButtonProps> = ({ label, selected, onClick }) => (
  <div
    onClick={onClick}
    className='selectbutton'
    style={{
      backgroundColor: selected ? '#0079BF' : '#EBEBEF',
      color: selected ? 'white' : 'black',
    }}
  >
    {label}
  </div>
);

export default SelectButton;
