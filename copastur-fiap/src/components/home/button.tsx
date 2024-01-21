import React from 'react-native';
import { TouchableOpacity, Text } from 'react-native';
import { homebutton } from '../../style/header/style';

interface Props {
    name: string;
    destiny: any;
}

export default function ButtonHome(props: Props){

    return (
        <TouchableOpacity style={homebutton.minibutton} onPress={props.destiny}>
            <Text style={{
                fontFamily: 'General Sans',
                fontSize: 10,
                color: 'white'
            }}>{props.name}</Text>
        </TouchableOpacity>
    )
}