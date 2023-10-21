import 'package:findmypet/Api/nameSearchApi.dart';
import 'package:findmypet/Pages/petDetails.dart';
import 'package:flutter/material.dart';

import '../Api/token_api.dart';

class SearchByName extends StatefulWidget {
  const SearchByName({super.key});

  @override
  State<SearchByName> createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  final TextEditingController name_controller = TextEditingController();
  String token = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'FIND PET USING NAME',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Pet Name',
                    labelText: 'Pet Name',
                  ),
                  controller: name_controller,
                ),
                width: 325,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      if (name_controller.text != '') {
                        snackBar("Loading....");
                        print(name_controller.text);
                        String id = name_controller.text;
                        token = await getToken();
                        print(token);
                        var data =
                            await nameSearchResult(token, name_controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => petDetails(data: data),
                            ));
                      }
                      else{
                        snackBar("Search Value can't be empty...");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  color: Colors.blueGrey,
                  width: 125,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  snackBar(String Message) {
    final snackbar = SnackBar(
      content: Text(Message),
      duration: const Duration(milliseconds: 3000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
