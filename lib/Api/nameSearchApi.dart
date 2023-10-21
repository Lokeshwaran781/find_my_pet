import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> nameSearchResult(String token, String name) async{
  Map<String, String> queryParams = {
    'name':name,
  };
  var response=await http.get(Uri.parse(
      'https://api.petfinder.com/v2/animals').replace(queryParameters: queryParams),
      headers: {
        'Authorization': token,
      });
  print(response);
  var responseData = json.decode(response.body);
  var listData=responseData['animals'];
  var reducedList=[];
  for(int i=0; i<listData.length; i++){
    var list$i = [];
    list$i.add(listData[i]["id"]);
    list$i.add(listData[i]["organization_id"]);
    list$i.add(listData[i]["url"]);
    list$i.add(listData[i]["type"]);
    list$i.add(listData[i]["species"]);
    list$i.add(listData[i]["age"]);
    list$i.add(listData[i]["gender"]);
    list$i.add(listData[i]["name"]);
    reducedList.add(list$i);
  }
  return reducedList;
}