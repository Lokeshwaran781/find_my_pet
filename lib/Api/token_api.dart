import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getToken() async{
  var url = 'https://api.petfinder.com/v2/oauth2/token';
  var response=await http.post(
      Uri.parse(url),
      body: {
        'grant_type':'client_credentials',
        'client_id' : 'rE68b7piRtpzEUuo8qS21aHxcLHqHbCO30ZragVXchM1ABocK5',
        'client_secret':'u6V6YXEqPZnJgQR8AZbavnPMUYqlF469i916Mu38',
      });
  var responseData = json.decode(response.body);
  String token_type=responseData['token_type'];
  String token=responseData['access_token'];
  return '$token_type $token';
}