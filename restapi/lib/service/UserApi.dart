import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:restapi/models/user_dob.dart';
import 'package:restapi/models/user_location.dart';
import 'dart:convert';

import '../models/user.dart';
import '../models/user_name.dart';
class UserApi{


   static Future<List<User>> callApi()async {

     log("user api run");
     const url = 'https://randomuser.me/api/?results=20';
    final uri =  Uri.parse(url);
    final responce =  await http.get(uri);
    final body =  responce.body;
    final json = jsonDecode(body);
    final result = json['data'] as List<dynamic>;
    final users = result.map((e) {


      final name =  UserName(
          titleName: e['name']['title'],
          firstName: e["name"]['first'],
          lastName: e['name']['last']
      );

      final dob = UserDob(
          date: e['dob']['date'] ,
          age:e['dob']['age'] );

    /*  final street = Street(
          sNumber: e['location']['street']['number'],
          sName: e['location']['street']['name']);

      final coordinates = Coordinates(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']);

      final timezone = Timezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);

      final location = Location(
          city: e['location']['city'],
          state: e['location']['state'],
          countery: e['location']['country'],
          postCode: e['location']['postcode'],
          street: street,
          coordinates: coordinates,
          timezone: timezone);  */

      return User(
        gender: e['gender'],
        email: e['email'],
        name: name,
       userDob: dob,
   //       location: location

      );

    }).toList();

    return users;

  }

}