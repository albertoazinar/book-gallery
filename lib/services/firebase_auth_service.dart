import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Auth_Service{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    Firebase_Auth_Service(this.firebaseAuth);

    Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

    Future<UserCredential?> signIn({String? email, String? password}) async {
        try{
            return await firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
        } on FirebaseAuthException catch (e){
            if (e.code == 'user-not-found') {
                throw Exception('No user found for that email.');
            } else if (e.code == 'wrong-password') {
                throw Exception('Wrong password provided for that user.');
            } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
            }
        }
    }

    Future<String?> signUp({String? email, String? password}) async{
        try{
            await firebaseAuth.createUserWithEmailAndPassword(
                email: email!, password: password!
            );
        }on FirebaseAuthException catch (e){
            if (e.code == 'weak-password') {
                return 'The password provided is too weak.';
            } else if (e.code == 'email-already-in-use') {
                return 'The account already exists for that email.';
            }
            return null;
        } catch (e) {
            print(e);
        }
    }

}
