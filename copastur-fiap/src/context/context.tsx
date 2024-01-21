import React, { createContext,useState } from 'react'
import { AppContextInterface } from './interfaces/AppContext'
import { Props } from './interfaces/Props'


export const AppContext = createContext<AppContextInterface | null>(null)

export const AppProvider = ({ children }: Props) => {

    const [name, setName] = useState('')
    const [surname, setSurname] = useState('')
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('');
    const [id, setId] = useState('');

    return (
        <AppContext.Provider value={{ 
                name,
                setName,
                surname,
                setSurname,
                email, 
                setEmail, 
                password, 
                setPassword,
                id,
                setId,
            }}>
                
            {children}
        </AppContext.Provider>
    )
}