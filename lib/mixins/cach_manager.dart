import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveUser({User? user}) async {
    final box = GetStorage();
    // Helper.toString(user);
    await box.write('user-email', user?.email);
    return true;
  }

  String? getUser() {
    final box = GetStorage();
    return box.read('user-email');
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove('user-email');
  }
}