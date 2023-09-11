
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_app/mixins/cach_manager.dart';
import 'package:test_app/repositories/user_repository.dart';

class AuthController extends GetxController with CacheManager {


   Future<int> singIn( auth) async{
    // try{

      var response=await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: auth['email'],
              password: auth["password"],
            );
      saveUser(user:response.user) ;
    // }on FirebaseAuthException catch(e){
    //   print(e);
    //
    //   switch(e.code){
    //     case "network-request-failed" :return 401;
    //     case "user-not-found" :return 404;
    //     case "wrong-password" :return 401;
    //     default : return 500;
    //   }

    // }catch(e){
    //   print(e);
    // }
      return 200 ;
   }

  void singUp( auth) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: auth['email'],
        password: auth["password"],
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    FirebaseAuth.instance.authStateChanges().listen(( user) {
      print("result ${user}");

    });
  }


}