class User{
  final String name ;
  final String email;
  final String phone;
  final String address;
  final String bday;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.bday,
});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      bday: json['bday'],
    );
  }
}
