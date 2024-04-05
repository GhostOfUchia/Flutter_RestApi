
class Location{
  final String city;
  final String state;
  final String countery;
  final int postCode;
  final Street street;
  final Coordinates coordinates;
  final Timezone timezone;

  Location({required this.city, required this.state,
    required this.countery, required this.postCode,
    required this.street, required this.coordinates,
    required this.timezone});

 }

 class Street{
  final int sNumber;
  final String sName;
  Street({required this.sNumber, required this.sName});

 }

 class Coordinates{
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});
 }

 class Timezone{
  final String offset;
  final String description;

  Timezone({required this.offset, required this.description});
 }



