import React from "react";
import { View, Text, TextInput } from "react-native";
import { inputS } from "../../style/info/style";

interface Props {
    name: string;
    placeholder: string;
    type: string;
    keyboard?: any;
    quantity?: number;
}

export function InputSpecial (props: Props){
    
    return (
        <View style={inputS.container}>
            <View style={inputS.spaceinputs}>
                <Text style={inputS.textinput}>{props.name}</Text>
                
                <TextInput
                placeholder={props.placeholder}
                style={inputS.input}
                keyboardType={props.keyboard}
                maxLength={props.quantity}/>
            </View>

            <View style={inputS.cubetype}>
                <Text style={inputS.cubetext}>{props.type}</Text>
            </View>
        </View>
    )
}