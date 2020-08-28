import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = 'http://13.66.218.45:5000';

class API {
  static Future getUsers() {
    return http.Client().get(baseUrl + '/users');
  }

  static Future getDollarPrice() {
    return http.Client()
        .get('https://api.exchangeratesapi.io/latest?base=USD&symbols=MXN');
  }
}
