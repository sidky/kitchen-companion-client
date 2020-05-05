import firebase from "firebase";

const Persistence = firebase.auth.Auth.Persistence;

const firebaseConfig = {
    apiKey: "AIzaSyDoRlSKkn2qM6Gv2qeZoRGtgQtqeKc0ghs",
    authDomain: "kitchen-companion-274003.firebaseapp.com",
    databaseURL: "https://kitchen-companion-274003.firebaseio.com",
    projectId: "kitchen-companion-274003",
    storageBucket: "kitchen-companion-274003.appspot.com",
    messagingSenderId: "339253752505",
    appId: "1:339253752505:web:219f62c62272636ea52168"
};

firebase.initializeApp(firebaseConfig);

export const auth = firebase.auth();
auth.setPersistence(Persistence.LOCAL);
export const firestore = firebase.firestore();