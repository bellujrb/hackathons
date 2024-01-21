// contexts/FileContext.tsx
import * as React from 'react';

const FileContext = React.createContext<File | null>(null);

export default FileContext;
