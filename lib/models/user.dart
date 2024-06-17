class AnonUser{

  final String uid;

  AnonUser( this.uid);

}

class UserData{
  final String? uid;
  final String? name;
  final String? sugars;
  final int? strength;
  final String? birthday;
 

  UserData({ this.uid, this.name, this.sugars, this.strength, required this.birthday, });
}