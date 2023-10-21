import 'package:flutter/material.dart';

import 'See_more.dart';

class organizationDetails extends StatefulWidget {
  final List data;
  const organizationDetails({super.key, required this.data});

  @override
  State<organizationDetails> createState() => _organizationDetailsState();
}

class _organizationDetailsState extends State<organizationDetails> {
  var data2=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('SEARCH RESULT'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Container(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20.0),
                  color: Colors.green.shade300,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.data[index][1],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Table(
                                defaultColumnWidth: FixedColumnWidth(130.0),
                                border: TableBorder.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2),
                                children: [
                                  TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Text('PARAMETERS',style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Text('VALUE',style: TextStyle(fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Id'),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(widget.data[index][0].toString()),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Email'),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(widget.data[index][2].toString()!=null?widget.data[index][2].toString():'NA'),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),
                                  TableRow(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Phone'),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(widget.data[index][3].toString()!=null?widget.data[index][3].toString():'NA'),
                                            ),
                                          ],
                                        ),
                                      ]
                                  ),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  child: TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SeeMorePage(url: widget.data[index][4]),
                                            )
                                        );
                                      },
                                      child: Text("See more...",style: TextStyle(color: Colors.black),)
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  width: 200,
                );
              },
            ),
            width: 350,
          ),
        ),
      ),
    );;
  }
}
