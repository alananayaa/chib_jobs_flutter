import 'dart:async';
import 'package:http/http.dart' as http;

<<<<<<< Updated upstream
const baseUrl = 'https://wise-happy-ferryboat.glitch.me';
=======
const baseUrl = 'https://wise-happy-ferryboat.glitch.me/';
>>>>>>> Stashed changes

class API {
  static Future getUsers() {
    return http.Client().get(baseUrl + '/users');
  }

  static Future getDollarPrice() {
    return http.Client()
        .get('https://api.exchangeratesapi.io/latest?base=USD&symbols=MXN');
  }
}
