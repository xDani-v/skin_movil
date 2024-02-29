import 'package:flutter/widgets.dart';

class Globals {
  static final Globals _instance = Globals._internal();

  factory Globals() {
    return _instance;
  }

  Globals._internal();


  final Color lochmara50 = Color.fromRGBO(240, 249, 254, 1);
  final Color lochmara100 = Color.fromRGBO(220, 241, 253, 1);
  final Color lochmara200 = Color.fromRGBO(193, 232, 252, 1);
  final Color lochmara300 = Color.fromRGBO(151, 219, 249, 1);
  final Color lochmara400 = Color.fromRGBO(101, 198, 245, 1);
  final Color lochmara500 = Color.fromRGBO(65, 171, 240, 1);
  final Color lochmara600 = Color.fromRGBO(44, 142, 228, 1);
  final Color lochmara700 = Color.fromRGBO(36, 122, 214, 1);
  final Color lochmara800 = Color.fromRGBO(35, 97, 170, 1);
  final Color lochmara900 = Color.fromRGBO(34, 82, 134, 1);
  final Color lochmara950 = Color.fromRGBO(25, 51, 82, 1);

}