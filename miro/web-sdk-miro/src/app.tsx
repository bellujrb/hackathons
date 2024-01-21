import * as React from 'react';
import { createRoot } from 'react-dom/client';
import './assets/style.css';
import PdfUpload from './components/PdfUpload';
import CustomInput from './components/CustomInput';
import Button from './components/Button';
import { createFrameWithStick } from './functions/createFrameWithStick';
import { diagramCreate } from './functions/diagramCreate';
import { cardCreate } from './functions/cardCreate';
import SelectButton from './components/SelectButton';
import uploadPdfToServer from './functions/uploadPdfServerStick';
import FileContext from './contexts/FileContext';
import ListContext from './contexts/ListContext';

interface ContentProps {
  selected: number;
  onUpload: (file: File | null, pageNumber?: string) => void;
  listData?: string[];
}

const Content: React.FC<ContentProps> = ({ selected, onUpload, listData }) => {
  const [pageNumber, setPageNumber] = React.useState<string>('');

  const handleUploadClick = async (file: File | null) => {
    onUpload(file, pageNumber);
  };

  const handleGenerateClick = () => {
    if (listData && listData.length > 0) {
      createFrameWithStick(listData);
    } else {
      console.warn('A lista de dados está vazia. Não foi possível criar o frame.');
    }
  };

  switch (selected) {
    case 1:
      return (
        <div>
          <div style={{ width: '100%', backgroundColor: '#EBEBEF' }}>
            <p className='textselect'>
              Our text functionality, based on the selected PDF and chosen pages, generates a summary for you in sticky notes.
            </p>
          </div>
          <PdfUpload onUpload={handleUploadClick} />
          <div style={{ marginTop: '10px' }}></div>
          <CustomInput title="Pages" placeholder="Example: 1, 2, 4, 6" onChange={(value) => setPageNumber(value)} value={pageNumber} />
          <div style={{ marginTop: '10px' }}></div>
          <Button onClick={handleGenerateClick} />
        </div>
      );
    case 2:
      return (
        <div>
          <div style={{ width: '100%', backgroundColor: '#EBEBEF' }}>
            <p className='textselect'>
              Our text functionality, based on the selected PDF and chosen pages, generates a summary for you in diagram.
            </p>
          </div>
          <PdfUpload onUpload={handleUploadClick} />
          <div style={{ marginTop: '10px' }}></div>
          <CustomInput title={"Pages"} placeholder='Example: 1, 2, 4, 6' value={pageNumber} onChange={(value) => setPageNumber(value)}/>
          <div style={{ marginTop: '10px' }}></div>
          <Button onClick={() => diagramCreate()} />
        </div>
      );
    case 3:
      return (
        <div>
          <div style={{ width: '100%', backgroundColor: '#EBEBEF' }}>
            <p className='textselect'>
              Our search engine is used to find important pages in lengthy PDFs, such as in a 500-line PDF,
              by pinpointing the specific page based on the provided text/phrase and rendering the page accordingly.
            </p>
          </div>
          <PdfUpload onUpload={handleUploadClick} />
          <div style={{ marginTop: '10px' }}></div>
          <CustomInput title={"Word ou phrase"} placeholder='Example: Miro SDK Web' value={pageNumber}  onChange={(value) => setPageNumber(value)}/>
          <div style={{ marginTop: '10px' }}></div>
          <Button onClick={cardCreate} />
        </div>
      );
    default:
      return null;
  }
};

interface AppProps {
  uploadedFile: File | null;
  selected: number;
}

const App: React.FC<AppProps> = ({ selected }) => {
  const [selectedOption, setSelectedOption] = React.useState<number>(selected);
  const [file, setFile] = React.useState<File | null>(null);
  const [listData, setListData] = React.useState<string[]>([]);

  const handleUploadClick = async (file: File | null, pageNumber?: string) => {
    if (file) {
      console.log(file);
      setFile(file);
  
      try {
        await uploadPdfToServer(file, setListData, pageNumber || '');
      } catch (error) {
        console.error('Error uploading PDF:', error);
      } finally {
        setFile(null);
      }
    } else {
      console.log('No file selected.');
    }
  };

  const handleSelectClick = (number: number) => {
    setSelectedOption(number);
  };

  return (
    <FileContext.Provider value={file}>
      <ListContext.Provider value={{ value: listData, setListData }}>
        <div>
          <div style={{ display: 'flex', gap: '2px', background: '#EBEBEF', borderRadius: '4px' }}>
            <SelectButton
              label="Stick"
              selected={selectedOption === 1}
              onClick={() => handleSelectClick(1)}
            />
            <SelectButton
              label="Diagram"
              selected={selectedOption === 2}
              onClick={() => handleSelectClick(2)}
            />
            <SelectButton
              label="Research"
              selected={selectedOption === 3}
              onClick={() => handleSelectClick(3)}
            />
          </div>

          <div style={{ display: 'flex', padding: '16px', alignItems: 'flex-start', gap: '8px', flex: '1 0 0' }}>
            <Content selected={selectedOption} onUpload={handleUploadClick} listData={listData} />
          </div>
        </div>
      </ListContext.Provider>
    </FileContext.Provider>
  );
};

const container = document.getElementById('root');

if (container) {
  const root = createRoot(container);
  root.render(<App uploadedFile={null} selected={1} />);
} else {
  console.error("Container element with id 'root' not found");
}