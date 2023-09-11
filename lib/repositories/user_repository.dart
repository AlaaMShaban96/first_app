import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  static var user;
  Future<User?> getCurrentUser() async{
    user= FirebaseAuth.instance.currentUser;
    return user;
  }
}