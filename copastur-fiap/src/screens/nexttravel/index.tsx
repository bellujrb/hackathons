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


export default function NextTravel(){

    const nav = useNavigation<StackNavigationProp<RootStackParams>>();
    
    return (
        <SafeAreaView style={{
            justifyContent: 'space-between',
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
                <Text style={info.titlemain}>Minha Proxima Viagem</Text>
                <Text style={info.subtitlemain}>Informacoes da viagem</Text>
            <View style={info.margintop}/>

            {/* Title Main End */}

                { /* Input */ }
                <View style={info.marginright}>

                    <Input name='Origem' placeholder='Digite sua origem'/>
                    <Input name='Destino' placeholder='Digite seu destino'/>

                    <View style={info.margintop}/>
                    <Text style={info.titlemain}>Datas:</Text>

                    <Input name='Partida' placeholder='Digite seua partida'/>
                    <Input name='Retorno' placeholder='Digite seu retorno'/>
                </View>

                
                { /* Input End */ }

                { /* Botao Next */}
                <View style={{
                    justifyContent: 'center',
                    alignItems: 'center'
                }}>
                    <ButtonCy name='Precisa de ajuda?' namebutton='Falar com a Cy' img={imgcy} nav={() => {
                        nav.navigate('cymain')
                    }}/>
                    <ButtonCy name='Seu plano de viagem' namebutton='Acesse' img={imgcy} nav={() => {
                        nav.navigate('flattravel')
                    }}/>
                </View>
                { /* Botao Next End */}


            </View>
        </SafeAreaView>
    )
}