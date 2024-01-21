import { StyleSheet } from "react-native"

export const header = StyleSheet.create({
    top:{
        width: '100%',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexDirection: 'row',
        padding: 30,
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

export const homebutton = StyleSheet.create({
    align:{
        justifyContent: 'center',
        alignItems: 'center',
    },
    hbutton1:{
        padding: 10,
        width: 349,
        height: 137,
        
        backgroundColor: 'rgba(146, 163, 253, 0.8)',

        justifyContent: 'space-between',
        alignItems: 'center',

        flexDirection: 'row',
        borderRadius: 22
    },
    title:{
        fontWeight: '700',
        fontSize: 15.5,

        color: '#425884',
    },
    minibutton:{
        marginTop: 15,

        width: 142.04,
        height: 25,
            
        backgroundColor: '#8094E1',
        borderRadius: 50,
            
        justifyContent: 'center',
        alignItems: 'center'
    }, 
    img:{
        width: 210,
        height: 124,

        transform: [
            { translateX: -30 },
            { translateY: 6 }
        ],
    }
})