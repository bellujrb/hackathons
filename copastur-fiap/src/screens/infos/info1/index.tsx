import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { header } from '../../../style/info/style';
import { global } from '../../../style/global/style';
import { Input } from '../../../components/global/input';
import { InputSpecial } from '../../../components/info/inputspecial';
import { info } from '../../../style/info/style';
import buttomimg from '../../../assets/images/button1.png';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';


export default function Info(){

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

                <Text style={info.titlemain}>Diga sobre você</Text>
                <Text style={info.subtitlemain}>Defina suas preferencias e necessidades</Text>
                <View style={info.margintop}/>

            {/* Title Main End */}

                { /* Input */ }
                <View style={info.marginright}>

                    <InputSpecial name='Qual sua altura?' 
                        placeholder='Selecione sua altura'
                        type='Editar'
                        keyboard="numeric"
                        quantity={3}
                    />
                { /* Input End */ }

                { /* Input Special */}

                    <InputSpecial name='Qual a sua idade?' 
                        placeholder='Selecione sua idade'
                        type='CM'
                        keyboard="numeric"
                        quantity={2}
                    />

                    <InputSpecial name='Qual seu peso?' 
                        placeholder='Selecione seu peso'
                        type='KG'
                        keyboard="numeric"
                        quantity={3}
                    />

                    <Input name='Possui alguma necessidade especial?' 
                        placeholder='Selecione sua necessidade'
                    />
                </View>
                { /* Input Special End */}

                { /* Botao Next */}
                <View style={info.organizenext}>
                    <TouchableOpacity onPress={() => {
                        nav.navigate('info2')
                    }}>
                        <Image source={buttomimg} style={info.imgnext}/>
                    </TouchableOpacity>
                    <Text style={info.textnext}>Avancar</Text>
                </View>
                { /* Botao Next End */}


            </View>
        </SafeAreaView>
    )
}