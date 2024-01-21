import React from 'react';
import { View, TouchableOpacity, Image, Text} from 'react-native';
import icon from '../../assets/images/icon.png';
import { minihelp } from '../../style/global/style';

interface Props {
    horario: string;
    texthelp?: string;
}

export default function MiniHelp(props: Props){

    return (
        <View style={minihelp.container}>
            <View style={minihelp.organize}>
                <Image source={icon} style={minihelp.img}/>
                <Text style={minihelp.text}>{props.horario}</Text>
            </View>

            <TouchableOpacity>
                <Text style={minihelp.textbutton}>Me ajuda</Text>
            </TouchableOpacity>
        </View>
    )
}