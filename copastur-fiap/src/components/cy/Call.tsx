import React from 'react';
import { View, Text } from 'react-native';
import { call } from '../../style/cy/style';

interface Props{
    origem: string;
    destino: string;
}

export default function Call(props: Props){

    return (
        <View style={call.container}>
            <View style={call.organize1}>
                <View>
                    <Text style={call.text}>CHAMADA #01</Text>
                </View>

                <View style={call.organize2}>
                    <View>
                        <Text style={call.subtitle}>Origem</Text>
                        <Text style={call.subtitle}>Destino</Text>
                    </View>

                    <View>
                        <Text style={call.subtitle}>{props.origem}</Text>
                        <Text style={call.subtitle}>{props.destino}</Text>
                    </View>
                </View>
            </View>
        </View>
    )
}