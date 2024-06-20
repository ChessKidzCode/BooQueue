class AnonUser{

  final String uid;

  AnonUser( this.uid);

}

class UserData{
  // final String? uid;
  final String name;
  final String balance;
  final int rating;
  final String birthday;
  final String order;
  final int price;
 

  UserData({required this.name, required this.balance, required this.rating, required this.birthday, required this.order, required this.price});
}