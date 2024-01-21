import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { header } from '../../../style/info/style';
import { global } from '../../../style/global/style';
import { info } from '../../../style/info/style';
import buttomimg from '../../../assets/images/button1.png';
import { StackNavigationProp } from '@react-navigation/stack';
import { RootStackParams } from '../../../navigation';
import { Input } from '../../../components/global/input';
import Button from '../../../components/global/button';

export default function InfoTwo(){

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

                <Text style={info.titlemain}>Detalhes da suas viagens</Text>
                <Text style={info.subtitlemain}>Qual e o estilo da sua viagm?</Text>
                <View style={info.margintop}/>

            {/* Title Main End */}

                { /* Input */}

                <View style={info.marginright}>
                    <Input
                        name='Qual e o estilo da sua viagem?'
                        placeholder='Escolha lazer ou corporativo.'
                    />

                    <Input
                        name='Quanto pretende gastar?'
                        placeholder='Digite aproximadamente quanto pretende.'
                    />
                </View>
                { /* Input */}

                { /* Botao Next */}
                <View style={info.organizenext}>
                    <Button nameButton="Salvar" destiny={() => {
                        nav.navigate('home');
                        alert("Dados salvo com sucesso!")
                    }}/>
                </View>
                { /* Botao Next End */}


            </View>
        </SafeAreaView>
    )
}