import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> getType(String token) async{
  var response=await http.get(Uri.parse(
      'https://api.petfinder.com/v2/types'),
      headers: {
        'Authorization': token,
      });
  print(response);
  var responseData = json.decode(response.body);
  print(responseData);
  var types=responseData["types"];
  late String typename;
  var animals=['Select The Type of Pet'];
  for(int i=0; i<types.length; i++){
    print(types[i]['name']);
    animals.add(types[i]['name'].toString());
  }
  print(animals.toString());
  return animals;
}
