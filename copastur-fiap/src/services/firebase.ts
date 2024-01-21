import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
import 'firebase/compat/firestore';

const firebaseConfig = {
    apiKey: "AIzaSyDQ1OPkW2DwweqZZYbyO0pKZEJgnSt4koo",
    authDomain: "cy-copastur.firebaseapp.com",
    projectId: "cy-copastur",
    storageBucket: "cy-copastur.appspot.com",
    messagingSenderId: "712379116258",
    appId: "1:712379116258:web:504f77367771738424ccbb"
};

firebase.initializeApp(firebaseConfig)

export default firebase;