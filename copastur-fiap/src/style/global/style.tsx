import { StyleSheet } from 'react-native';

export const global = StyleSheet.create({
    organize:{
        justifyContent: 'center',
        alignItems: 'center'
    },
    row:{
        flexDirection: 'row'
    }
})

export const input = StyleSheet.create({
    spaceinputs:{
        marginTop: 10,
        marginLeft: 15,
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
        width: 312,
        height: 50,
        backgroundColor: '#FFFFFF',
        borderRadius: 15,
        borderColor: '#DFE2E5',
        borderWidth: 1,

        fontWeight: '400',
        fontSize: 14,

        padding: 10,
    },
})

export const buttonCy = StyleSheet.create({
    container:{
        marginTop: 40,

        width: 349,
        height: 90,
        borderRadius: 22,

        backgroundColor: 'rgba(146, 163, 253, 0.8)',
        flexDirection: 'row',
        justifyContent: 'space-around',
        alignItems: 'center'
    },
    width:{
        width: '40%'
    },
    img:{
        width: '100%',
        height: '100%',
    },
    textbutton:{
        fontWeight: '700',
        fontSize: 12 ,

        color: '#1D1617',
    },
})

export const minihelp = StyleSheet.create({
    container:{
        marginTop: 10,
        width: 315,
        height: 36, 

        backgroundColor: 'rgba(146, 163, 253, 0.8)',
        borderRadius: 16,
        justifyContent: 'space-around',
        alignItems: 'center',

        flexDirection: 'row'
    },
    organize:{
        justifyContent: 'space-around',
        alignItems: 'center',
        flexDirection: 'row'
    },
    img:{
        width: 22,
        height: 22
    },
    text:{
        marginLeft: 10,

        fontWeight: '400',
        fontSize: 12,

        color: '#7B6F72'
    },
    textbutton:{
        fontWeight: '700',
        fontSize: 10,

        color: '#425884'
    }
})