importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

/*Update with yours config*/
const firebaseConfig = {
    apiKey: "AIzaSyDeBuUihlUjqEpEFNsHLhhKgtZPijbtMdA",
    authDomain: "akwaaba-app-ghana.firebaseapp.com",
    projectId: "akwaaba-app-ghana",
    storageBucket: "akwaaba-app-ghana.appspot.com",
    messagingSenderId: "538850303764",
    appId: "1:538850303764:web:8097a2405906464a15ac01",
    measurementId: "G-538850303764"
};
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

/*messaging.onMessage((payload) => {
console.log('Message received. ', payload);*/
messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
        notificationOptions);
});