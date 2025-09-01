class UserModel{

  String name;
  String email;
  String phone;
  String address;


  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address
});

  factory UserModel.fromJSON(Map<String,dynamic> jsonData){
    return UserModel(
        name: jsonData["name"]??"",
        email: jsonData["email"]??"",
        phone: jsonData["phone"]??"",
        address: jsonData["address"]??""
    );
  }
}