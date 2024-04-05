
 import 'package:restapi/models/user_dob.dart';
import 'package:restapi/models/user_location.dart';
import 'package:restapi/models/user_name.dart';

class User{
    final String gender;
    final String email;
    final UserName name;
   final UserDob userDob;
   // final Location location;


    User(  {
    required this.gender,
    required this.email,
    required this.name,
     required this.userDob,
    //  required this.location
    });

    String get fullName{
  return '${name.titleName} ${name.firstName} ${name.lastName}';
}

 }

