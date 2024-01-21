import axios from 'axios';

interface ApiResponse {
  message: string[];
}

const uploadPdfToServer = async (file: File, setListData: React.Dispatch<React.SetStateAction<string[]>>, pageNumber: string) => {
  try {
    const formData = new FormData();
    formData.append('pdf', file);

    const response = await axios.post<ApiResponse>('http://localhost:8000/resume-pdf', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
        'page': '3',
      },
    });

    console.log(pageNumber);
    console.log(response.data.message);
    setListData(response.data.message);
  } catch (error) {
    console.error('Error uploading PDF:', error);
  }
};

export default uploadPdfToServer;
