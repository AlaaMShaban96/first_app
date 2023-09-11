import 'package:shared_preferences/shared_preferences.dart';
class Helper{
  static void setDataInSharePreference(key,data) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key,data);
  }
  static Future<String?> getDataFromSharePreference(key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    return data;
  }
  static void pushDataInsideModel( key,Function decode,Function encode,newData) async{

    // try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString(key);
      // print(decode(data)) ;

      List<dynamic> list = decode(data!);
      list.add(newData);
      Helper.setDataInSharePreference(key, encode(list));

      // print(newData) ;
      print(true) ;
    // }
    // catch(e){
    //   print(false) ;
    //   print(e) ;
    // }
  }


}
