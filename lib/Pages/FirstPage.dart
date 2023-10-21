import 'package:findmypet/Pages/search_by_type.dart';
import 'package:findmypet/Pages/search_organization_by_name.dart';
import 'package:flutter/material.dart';
import 'package:findmypet/Pages/Search_Pet_By_Name.dart';

import '../Api/dropdown_api.dart';
import '../Api/token_api.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text(
              'FIND MY PET',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchByName(),
                      ));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Find Pet By Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      color: Colors.blueGrey,
                      width: 300,
                    )
                ),
                TextButton(
                    onPressed: () async{
                      snackBar("Loading....");
                      var token= await getToken();
                      var item=await getType(token);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => search_by_type(token: token, dropdown: item),
                          ));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('Find Pet By Type',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      color: Colors.blueGrey,
                      width: 300,
                    )
                ),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => search_organization_by_name(),
                          ));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text('Search Organization',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      color: Colors.blueGrey,
                      width: 300,
                    )
                ),
              ],
            ),
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
