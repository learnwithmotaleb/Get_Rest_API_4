import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi4/ReusebleComponent.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rest API'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
              future: getUserApi(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index) {
                    return Card(
                      child: Column(

                        children: [
                          ReusbaleRow(title: 'Name', value: data[index]['name'].toString()),
                          ReusbaleRow(title: 'UserName', value: data[index]['username'].toString()),
                          ReusbaleRow(title: 'E-mail', value: data[index]['email'].toString()),
                          ReusbaleRow(title: 'Address', value: data[index]['address']['street'].toString()),
                          ReusbaleRow(title: 'Zip Code', value: data[index]['address']['zipcode'].toString()),
                          ReusbaleRow(title: 'LAT', value: data[index]['address']['geo']['lat'].toString()),
                          ReusbaleRow(title: 'LNG', value: data[index]['address']['geo']['lng'].toString()),
                        ],
                      ),
                    );
                  });
                }
              },
            ))
          ],
        ));
  }
}
