import React, { useContext, useEffect } from 'react';
import { View, Text } from 'react-native';
import { register } from '../../../style/auth/style';
import { Input } from '../../../components/global/input';
import { global } from '../../../style/global/style';
import Button from '../../../components/global/button';
import { confirmregister } from '../../../constants/string';
import firebase from '../../../services/firebase';
import { StackNavigationProp } from '@react-navigation/stack';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../../navigation';
import { AppContext } from '../../../context/context';

export default function Register(){

    const context = useContext(AppContext)

    const nav = useNavigation<StackNavigationProp<RootStackParams>>()

    useEffect(() => {

    }, [context])

    async function CreateAccount() {
        try {
            await firebase
                .auth()
                .createUserWithEmailAndPassword(context?.email || '', context?.password || '')
        } catch (err: any) {
            const errors: Record<string, () => void> = {
                'auth/weak-password': () =>
                console.log('Sua senha deve ter pelo menos 6 caracteres'),
                'auth/invalid-email': () => console.log('Email do usuario incorreto')
            }
            !errors[err.code] &&
            console.log(
                `Algo deu errado, consulte o desenvolvedor do projeto ERROR: ${err}`
            )
            errors[err.code]()
        }
        }

    return (
        <View>
            { /* Title */}
            <View>
                <Text style={register.containertext}>Register</Text>
            </View>
            { /* End Title */}

            { /* Input Name  */}
            <View style={global.organize}>

                <Input
                    name='Nome'
                    placeholder='Digite seu primeiro nome'
                    value={context?.name}
                    data={context?.setName}/>

                <Input
                    name='Sobrenome'
                    placeholder='Digite seu sobrenome'
                    value={context?.surname}
                    data={context?.setSurname}/>

                <Input
                    name='E-mail'
                    placeholder='Digite seu e-mail'
                    value={context?.email}
                    data={context?.setEmail}/>

                <Input
                    name='Senha'
                    placeholder='Digite sua senha'
                    value={context?.password}
                    secure={true}
                    data={context?.setPassword}/>

                { /* End Input Name  */}

                { /* Button Register */ }
                    <Button nameButton={confirmregister} destiny={() => {
                        nav.navigate('home')
                    }}/>
                { /* End Button Register */ }

            </View>
        </View>
    )
}