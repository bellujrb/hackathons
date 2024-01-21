import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import buttomimg from '../../assets/images/button1.png';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import { header } from '../../style/header/style';
import { global } from '../../style/global/style';
import { info } from '../../style/info/style';
import { Input } from '../../components/global/input';
import ButtonCy from '../../components/home/buttonCy';
import imgcy from '../../assets/images/cy1.png';
import MiniHelp from '../../components/global/minihelp';


export default function FlatTravel(){

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
                <Text style={info.titlemain}>Plano de Viagem</Text>
            <View style={info.margintop}/>

            {/* Title Main End */}
            <View style={{
                justifyContent: 'center',
                alignItems: 'center'
            }}>  
                <MiniHelp horario='09h00 - 10h00' texthelp='Me ajuda Cy'/>
                <MiniHelp horario='10h00 - 11h00' texthelp='Me ajuda Cy p/ almoco'/>
                <MiniHelp horario='12h00 - 14h00' texthelp='Me ajuda Cy p/ passeio'/>
                <MiniHelp horario='19h00 - 23h00' texthelp='Me ajuda Cy p/ praia'/>

                <ButtonCy name='Precisa de ajuda?' namebutton='Fale com a Cy' img={imgcy} nav={() => {
                        
                }}/>
                </View>
            </View>
        </SafeAreaView>
    )
}