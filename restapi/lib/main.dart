import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restapi/service/UserApi.dart';

import 'models/user.dart';


void main() {
  runApp(MaterialApp(
    home: RestApi(),
  ));
}

class RestApi extends StatefulWidget {
  const RestApi({super.key});

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {

  List<User>users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rest Api"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
             fetchUsers();

          },
          child: Text("Data"),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              final email = user.email;
              final gender = user.gender;
              final title = user.name.titleName;
              final firstname = user.name.firstName;
              final lastname = user.name.lastName;


              return ListTile(
                title: Text(user.userDob.age.toString()),
                subtitle: Text(user.userDob.date),
              );
            },
          ),
        ));
  }

  Future<void> fetchUsers() async {

    final responce = await UserApi.callApi();


    setState(() {
      users = responce;
    });





  }
  }
