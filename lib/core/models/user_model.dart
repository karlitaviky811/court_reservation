class User {
  final String firstname;
  final String lastname;
  final String email;
  final String image;
  final String token;

  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.image,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      image: json['image'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'image': image,
      'token': token,
    };
  }
}
