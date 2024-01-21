import React, { useContext, useEffect } from 'react';
import { View, Text  } from 'react-native';
import { register } from '../../../style/auth/style';
import { Input } from '../../../components/global/input';
import { global } from '../../../style/global/style';
import Button from '../../../components/global/button';
import { loginbutton } from '../../../constants/string';
import { RootStackParams } from '../../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import { useNavigation } from '@react-navigation/native';
import firebase from '../../../services/firebase';
import { AppContext } from '../../../context/context';


export default function Login(){

    const context = useContext(AppContext)

    useEffect(() => {

    }, [context])

    async function LoginAccount() {
        await firebase.auth().signInWithEmailAndPassword(context?.email, context?.password)
        .then( (value:any) => {
            context?.setId(value.user.uid);
            nav.navigate('home')
            console.log(value.user.uid)
        })
        .catch( (err:string) => {
            console.log(err)
        })
    }

    const nav = useNavigation<StackNavigationProp<RootStackParams>>();

    return (
        <View>
            { /* Title */}
            <View>
                <Text style={register.containertext}>Login</Text>
            </View>
            { /* End Title */}

            { /* Input Name  */}
            <View style={global.organize}>

                <Input
                    name='E-mail'
                    placeholder='Digite seu -email'
                    value={context?.email}
                    data={context?.setEmail}
                />

                <Input
                    name='Senha'
                    placeholder='Digite sua senha'
                    value={context?.password}
                    secure={true}
                    data={context?.setPassword}
                />

                { /* End Input Name  */}

                { /* Button Register */ }
                    <Button nameButton={loginbutton} destiny={() => {
                        nav.navigate('home')
                    }}/>
                { /* End Button Register */ }

            </View>
        </View>
    )
}