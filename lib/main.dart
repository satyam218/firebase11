import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseAuth auth = FirebaseAuth.instance;


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  //
  // TextEditingController t1=TextEditingController();
  // TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // TextField(controller: t1,),
          // TextField(controller: t2,),
          // ElevatedButton(onPressed: () async {
          //   try {
          //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //         email: t1.text,
          //         password: t2.text
          //     );
          //   } on FirebaseAuthException catch (e) {
          //     if (e.code == 'weak-password') {
          //       print('The password provided is too weak.');
          //     } else if (e.code == 'email-already-in-use') {
          //       print('The account already exists for that email.');
          //     }
          //   } catch (e) {
          //     print(e);
          //   }
          // }, child:Text("Submit")),
          // SizedBox(
          //   height: 25,
          // ),
          // ElevatedButton(onPressed: () async {
          //   try {
          //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          //         email: t1.text,
          //         password: t2.text
          //     );
          //   } on FirebaseAuthException catch (e) {
          //     if (e.code == 'user-not-found') {
          //       print('No user found for that email.');
          //     } else if (e.code == 'wrong-password') {
          //       print('Wrong password provided for that user.');
          //     }
          //   }
          // }, child:Text("Submit")),
          
          ElevatedButton(onPressed: () {
            signInWithGoogle().then((value) => print(value));

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return second();
            // },
            // ));
          }, child: Text("SIGN IN"))
        ],
      ),
    );

  }
}
class second extends StatelessWidget {
  const second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: [
          Row(
            children: [

            ],
          ),
          Row(
            children: [

            ],
          )
        ],
      ),
    );
  }
}

