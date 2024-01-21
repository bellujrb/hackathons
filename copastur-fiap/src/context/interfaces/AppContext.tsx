import React from "react";

export interface AppContextInterface {
    name: string
    surname: string;
    email: any;
    password: any;
    id: any;

    setName: React.Dispatch<React.SetStateAction<string>>
    setSurname: React.Dispatch<React.SetStateAction<string>>
    setEmail: React.Dispatch<React.SetStateAction<string>>
    setPassword: React.Dispatch<React.SetStateAction<string>>
    setId: React.Dispatch<React.SetStateAction<string>>
}