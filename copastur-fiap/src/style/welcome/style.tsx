import { StyleSheet } from "react-native";

export const welcome = StyleSheet.create({
    container:{
        flex: 1,
        backgroundColor: '#F5F6FA',
        justifyContent: 'space-evenly'
    },
    img:{
        width: 250,
        height: 300
    },
    main:{
        width: '100%',
        justifyContent: 'center',
        alignItems: 'center'
    },
    normaltitle:{
        textAlign: 'left',
        fontWeight: '300',
        fontSize: 25,

        textTransform: 'uppercase',
        color: '#425884'
    },
    ultratitle:{

        fontWeight: '600',
        fontSize: 48,

        textTransform: 'uppercase',
        color: '#425884'
    },
    containerbutton:{
        justifyContent: 'center',
        alignItems: 'center'
    },
    imgbutton:{
        width: 94,
        height: 94
    },
})