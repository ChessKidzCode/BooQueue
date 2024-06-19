class AnonUser{

  final String uid;

  AnonUser( this.uid);

}

class UserData{
  final String? uid;
  final String? name;
  final String? balance;
  final int? rating;
  final String? birthday;
 

  UserData({ required this.uid,required this.name, this.balance, this.rating, required this.birthday, });
}