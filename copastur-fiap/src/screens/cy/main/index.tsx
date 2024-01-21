import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import { header, info } from '../../../style/info/style';
import { global } from '../../../style/global/style';
import ButtonCy from '../../../components/home/buttonCy';
import imgcy2 from '../../../assets/images/cy5.png';


export default function CyMain(){

    const nav = useNavigation<StackNavigationProp<RootStackParams>>();
    
    return (
        <SafeAreaView style={{
            height: '65%',
        }}>

            {/* Header */}
            <View style={{
                justifyContent: 'center',
                alignItems: 'center',
                height: '20%'
            }}>
                <View style={header.top}>
                    <TouchableOpacity onPress={() => {
                        nav.navigate('home')
                    }}>
                            <Ionicons name="arrow-back-circle-outline" size={28} color="black" style={header.spaceicon}/>
                    </TouchableOpacity>

                    <View style={global.row}>
                        <TouchableOpacity>
                                <Ionicons name="notifications-outline" size={28} color="black" style={header.spaceicon}/>
                        </TouchableOpacity>
                        <TouchableOpacity>
                                <Ionicons name="apps-outline" size={28} color="black" style={header.spaceicon}/>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
            {/* Header End */}

            {/* Title Main */}

            <View>
                <Text style={info.titlemain}>Cy Assistent</Text>
                <Text style={info.subtitlemain}>Conversa com a nossa queridinha e 
                resolvaseus problemas de planejamento.</Text>
            <View style={info.margintop}/>

            { /* Button Cy */}
            <View style={{
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <ButtonCy name='Bate-Papo por Chat' namebutton='Iniciar' img={imgcy2} nav={() => {
                    nav.navigate('cychat')
                }}/>
                <ButtonCy name='Bate-Papo por Voz' namebutton='Iniciar' img={imgcy2} nav={() => {
                    nav.navigate('error404')
                }}/>
            </View>
            { /* Button Cy */}   
            </View>
        </SafeAreaView>
    )
}