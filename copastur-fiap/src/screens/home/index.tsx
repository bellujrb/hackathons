import React from 'react';
import { SafeAreaView, View, Text, TouchableOpacity, Image } from 'react-native'
import Ionicons from '@expo/vector-icons/Ionicons';
import { header, homebutton } from '../../style/header/style';
import { global } from '../../style/global/style';
import ButtonHome from '../../components/home/button';
import my from '../../assets/images/my.png';
import { RootStackParams } from '../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import { useNavigation } from '@react-navigation/native';
import ButtonCy from '../../components/home/buttonCy';
import cy1 from '../../assets/images/cy1.png';
import cy2 from '../../assets/images/cy2.png';
import cy3 from '../../assets/images/cy3.png';


export default function Home(){

    const nav = useNavigation<StackNavigationProp<RootStackParams>>();

    return (
        <SafeAreaView style={{
            justifyContent: 'space-around',
            height: '80%',
        }}>
        {/* Header Start */}
        <View style={header.top}>
        <View>
            <Text style={header.name}>Hey</Text>
            <Text style={header.subtitle}>Belluzzo</Text>
        </View>
            
            <View style={global.row}>
                <TouchableOpacity onPress={() => {
                    nav.navigate('error404')
                }}>
                    <Ionicons name="notifications-outline" size={24} color="#0C1523" style={header.spaceicon}/>
                </TouchableOpacity>

                <TouchableOpacity onPress={() => {
                    nav.navigate('error404')
                }}>
                    <Ionicons name="apps-outline" size={24} color="#0C1523" style={header.spaceicon}/>
                </TouchableOpacity>
            </View>
        </View>

        {/* Buttoes */}
        <View style={homebutton.align}>

        {/* Button Definir */}
        <View style={homebutton.hbutton1}>
            <View style={{
                width: '55%'
            }}>
                <Text style={homebutton.title}>Deixe sua viagem mais confortavel, edite suas preferencias.</Text>
                <ButtonHome name='Definir' destiny={() => {
                    nav.navigate('info1')
                }}/>
            </View>

            <Image source={my} style={homebutton.img}/>
        </View>
        {/* Button Definir End */}

        {/* Button Ver Todas */}            
            <ButtonCy name='Minhas proximas viagens.'
                namebutton='Ver' img={cy1} nav={() => {
                    nav.navigate('nexttravel')
                }}
            />
        {/* Button Ver Todas End*/}
        
        {/* Button Checkar */}
            <ButtonCy name='Historico de viagens.'
                namebutton='Ver todas' img={cy2} nav={() => {
                    nav.navigate('error404')
                }}
            />
        {/* End Button Checkar */}

        {/* Button Help */}
        <ButtonCy name='Precisa de ajuda?'
            namebutton='Fale com Cy' img={cy3} nav={() => {
                nav.navigate('cymain')
            }}
        />
        {/* End Button Help */}

            </View>
        {/* Buttoes */}
        </SafeAreaView>
    )
}