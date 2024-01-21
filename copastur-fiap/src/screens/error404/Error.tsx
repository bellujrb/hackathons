import React from 'react';
import { View, Text, TouchableOpacity, SafeAreaView, Image } from 'react-native';
import Ionicons from '@expo/vector-icons/Ionicons';
import { header } from '../../style/info/style';
import { global } from '../../style/global/style';
import { info } from '../../style/info/style';
import { useNavigation } from '@react-navigation/native';
import { RootStackParams } from '../../navigation';
import { StackNavigationProp } from '@react-navigation/stack';
import ButtonCy from '../../components/home/buttonCy';
import errorimg from '../../assets/images/error.png';


export default function Error(){

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

                <Text style={info.titlemain}>Error 404</Text>
                <View style={info.margintop}/>

            {/* Title Main End */}

            <View style={{
                justifyContent: 'center',
                alignItems: 'center'
            }}>
                <ButtonCy name='Page em desenv.' namebutton='Inicio' img={errorimg}
                nav={()=> {
                    nav.navigate('home')
                }}/>
            </View>

            </View>
        </SafeAreaView>
    )
}