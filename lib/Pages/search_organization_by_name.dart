import 'package:findmypet/Api/organization_search_name_api.dart';
import 'package:findmypet/Pages/organizationDetails.dart';
import 'package:flutter/material.dart';

import '../Api/token_api.dart';

class search_organization_by_name extends StatefulWidget {
  const search_organization_by_name({super.key});

  @override
  State<search_organization_by_name> createState() => _search_organization_by_nameState();
}

class _search_organization_by_nameState extends State<search_organization_by_name> {
  @override
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
                    hintText: 'Enter the Organization Name',
                    labelText: 'Organization Name',
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
                        await searchOrganizationName(token, name_controller.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => organizationDetails(data: data),
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

