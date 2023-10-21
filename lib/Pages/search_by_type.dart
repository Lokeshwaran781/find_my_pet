import 'package:findmypet/Api/dropdown_api.dart';
import 'package:findmypet/Api/typeSearch.dart';
import 'package:findmypet/Pages/petDetails.dart';
import 'package:flutter/material.dart';

class search_by_type extends StatefulWidget {
  final String token;
  final List dropdown;
  const search_by_type(
      {super.key, required this.token, required this.dropdown});

  @override
  State<search_by_type> createState() => _search_by_typeState();
}

class _search_by_typeState extends State<search_by_type> {
  List<String> items = [];
  String dropdownvalue = 'Select The Type of Pet';

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.dropdown.length; i++) {
      items.add(widget.dropdown[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search By Type"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                child: TextButton(
                  onPressed: () async {
                    if (dropdownvalue != 'Select The Type of Pet') {
                      snackBar("Loading....");
                      var data =
                          await typeSearchResult(widget.token, dropdownvalue);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => petDetails(data: data),
                          ));
                    }
                    else{
                      snackBar("Invalid Selection.....");
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
