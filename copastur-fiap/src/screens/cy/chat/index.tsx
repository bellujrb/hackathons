import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import { header, info } from '../../../style/info/style';
import { global } from '../../../style/global/style';
import Call from '../../../components/cy/Call';
import Message from '../../../components/cy/Message';


export default function CyChat(){

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

            <View style={{
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <Call origem='Nova York, US' destino='Guarulhos, SP'/>
            </View>
            
            <View style={{
                padding: 20
            }}>
                <Message />
            </View>

            </View>
        </SafeAreaView>
    )
}