import React, { useEffect } from "react";
import girl from '../../assets/images/girl.png';
import { View, Image, Text, TouchableOpacity } from "react-native";
import { welcome } from "../../style/welcome/style";
import { wtitle1, wtitle2, wtitle3, wtitle4, 
    wtitle5, wtitle6, loginbutton, registerbutton } from "../../constants/string";

import { RootStackParams } from '../../navigation';
import { useNavigation } from '@react-navigation/native';
import { StackNavigationProp } from "@react-navigation/stack";
import Button from "../../components/global/button";

export default function Welcome(){

    const nav = useNavigation<StackNavigationProp<RootStackParams>>();

    return (
        <View style={welcome.container}>

            {/* Img Top */}
            <Image source={girl} style={welcome.img}/>
            {/* End Img Top */}

            {/* Text Main */}
            <View style={welcome.main}>
                <View>
                    <Text style={welcome.normaltitle}>{wtitle1}</Text>
                    <Text style={welcome.ultratitle}>{wtitle2}</Text>
                    <Text style={welcome.normaltitle}>{wtitle3}</Text>
                    <Text style={welcome.normaltitle}>{wtitle4}</Text>
                    <Text style={welcome.normaltitle}>{wtitle5}</Text>
                    <Text style={welcome.normaltitle}>{wtitle6}</Text>
                </View>
            </View>
            {/* End Text Main */}

            {/* Button */}
                <View style={welcome.containerbutton}>
                    <Button nameButton={loginbutton} destiny={() => {
                        nav.navigate('login')
                    }}/>
                    <Button nameButton={registerbutton} destiny={() => {
                        nav.navigate('register')
                    }}/>
                </View>
            {/* End Button */}

            {/* */}


            {/* */}
        </View>
    )
}