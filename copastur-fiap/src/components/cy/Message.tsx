import React from 'react';
import { View, Text, TextInput} from 'react-native';
import { message } from '../../style/cy/style';

interface Props{
    
}

export default function Message(props: Props){

    return (
            <View>
                <Text style={message.title}>Cy - Hoje, 11h20</Text>

                <View style={message.container}>
                    <Text style={message.title}>Olá! Estou aqui para te ajudar no planejamento e divertimento da viagem.</Text>
                </View>

                <View style={message.rectangle}>
                    <Text style={message.subtitle}>Estou agendado ela para o dia 5 de agosto e retorno dia 10 okay?</Text>
                </View>
            </View>
    )
}