import React from 'react';
import { StyleSheet } from 'react-native';

export const header = StyleSheet.create({
    top:{
        marginTop: 30,

        width: '80%',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexDirection: 'row',
    },
    name:{
        fontWeight: '400',
        fontSize: 12,

        color: '#A4A4A5'
    },
    subtitle:{
        fontWeight: '700',
        fontSize: 20,

        color: '#425884'
    },
    spaceicon:{
        marginTop: 10,
        marginLeft: 10
    }
})

export const info = StyleSheet.create({
    titlemain:{
        marginLeft: 20,

        fontWeight: '700',
        fontSize: 20,

        letterSpacing: 0.02,

        color: '#425884'
    },
    subtitlemain:{
        marginLeft: 20,
        marginTop: 2,

        fontWeight: '400',
        fontSize: 12,

        letterSpacing: 0.02,

        color: '#7B6F72'
    },
    margintop:{
        marginTop: 10
    },
    marginright:{
        marginRight: 30
    },
    organizenext:{
        marginTop: 60,

        justifyContent: 'center',
        alignItems: 'center'
    },
    imgnext:{
        width: 80,
        height: 80,
    },
    textnext:{
        marginTop: 5,
                        
        fontWeight: '600',
        fontSize: 12,

        letterSpacing: 0.3,

        color: '#3D3D3D'
    },
})

export const inputS = StyleSheet.create({
    container:{
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center'
    },
    spaceinputs:{
        marginTop: 10,
        
        marginLeft: 10,
        marginRight: 10,
    },
    textinput:{

        fontWeight: '300',
        fontSize: 12,

        letterSpacing: 0.03,
        color: '#3D3D3D',

        marginBottom: 5,
        marginLeft: 2
    },
    input:{
        width: 253,
        height: 50,
        backgroundColor: '#FFFFFF',
        borderRadius: 15,
        borderColor: '#DFE2E5',
        borderWidth: 1,

        fontFamily: 'Poppins',
        fontWeight: '400',
        fontSize: 14,

        padding: 10,
    },
    cubetype:{
        marginTop: 20,
        width: 48,
        height: 48,

        borderRadius: 14,

        backgroundColor: '#92A3FD',

        justifyContent: 'center',
        alignItems: 'center'
    },
    cubetext:{
        fontWeight: '500',
        fontSize: 12,

        color: '#FFFFFF'
    },
})