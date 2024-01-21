import React, { useState, useRef } from 'react';
import icon from '../assets/icon.png';
import '../assets/style.css';

interface PdfUploadProps {
  onUpload: (file: File | null) => void;
}

const PdfUpload: React.FC<PdfUploadProps> = ({ onUpload }) => {
  const [selectedFileName, setSelectedFileName] = useState<string | null>(null);
  const inputFileRef = useRef<HTMLInputElement | null>(null);

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0] || null;
    onUpload(file);

    setSelectedFileName(file ? file.name : null);
  };

  const handleClearSelection = () => {
    setSelectedFileName(null);

    if (inputFileRef.current) {
      inputFileRef.current.value = '';
    }
  };

  return (
    <label className='labelpdf'>
      <input
        type="file"
        accept=".pdf"
        style={{ display: 'none' }}
        onChange={handleFileChange}
        ref={inputFileRef}
      />
      <div>
        <img src={icon} alt="Icon" style={{ width: '68px', height: '68px' }} />
      </div>
      <p className='labelp'>
        {selectedFileName ? (
          <>
            Selected: {selectedFileName}
            <button className="clearButton" onClick={handleClearSelection}>
              Clear
            </button>
          </>
        ) : (
          'Attach your PDF here'
        )}
      </p>
    </label>
  );
};

export default PdfUpload;
