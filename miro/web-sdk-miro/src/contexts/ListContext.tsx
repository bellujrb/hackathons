// contexts/ListContext.tsx
import * as React from 'react';

interface ListContextProps {
  value: string[];
  setListData: React.Dispatch<React.SetStateAction<string[]>>;
}

const ListContext = React.createContext<ListContextProps>({
  value: [],
  setListData: () => {},
});

export default ListContext;
