import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  int counter = 0;

  setPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('count', counter);
  }

  getPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    counter = sp.getInt('count') ?? 0;
  }

  addCount() async {
    setPref();
    counter++;
  }

  int getCount() {
    getPref();
  
    return counter;
  }
}
