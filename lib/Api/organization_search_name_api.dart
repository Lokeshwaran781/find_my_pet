import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> searchOrganizationName(String token, String name) async{
  Map<String, String> queryParams = {
    'name':name,
  };
  var response=await http.get(Uri.parse(
      'https://api.petfinder.com/v2/organizations').replace(queryParameters: queryParams),
      headers: {
        'Authorization': token,
      });
  var responseData = json.decode(response.body);
  print(responseData);
  var listData=responseData['organizations'];
  var reducedList=[];
  for(int i=0; i<listData.length; i++){
    var list$i = [];
    list$i.add(listData[i]["id"]);
    list$i.add(listData[i]["name"]);
    list$i.add(listData[i]["email"]);
    list$i.add(listData[i]["phone"]);
    list$i.add(listData[i]["url"]);
    reducedList.add(list$i);
  }
  return reducedList;
}