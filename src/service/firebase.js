import { initializeApp } from "firebase/app";
import { getAuth, createUserWithEmailAndPassword } from 'firebase/auth';
import { getFirestore, collection, addDoc } from 'firebase/firestore';
import Vue from 'vue';

const firebaseConfig = {
    apiKey: "AIzaSyDII6euuvJWeVKm7M4Fr7H0l0jy1wBeQt0",
    authDomain: "chatapp-955d5.firebaseapp.com",
    projectId: "chatapp-955d5",
    storageBucket: "chatapp-955d5.appspot.com",
    messagingSenderId: "468610058153",
    appId: "1:468610058153:web:2b3561c5d0119bf77166b8"
  };

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);