import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'https://wise-happy-ferryboat.glitch.me/';

class API {
  static Future getUsers() {
    return http.Client().get(baseUrl + '/users');
  }

  static Future getDollarPrice() {
    return http.Client()
        .get('https://api.exchangeratesapi.io/latest?base=USD&symbols=MXN');
  }
}
