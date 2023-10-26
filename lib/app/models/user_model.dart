class UserModel {
  String name;
  String email;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String userId;
  UserModel({
    required this.name,
    required this.email,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.userId,
  });
  //from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePic: map['profilePic'] ?? '',
      createdAt: map['createdAt'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      userId: map['userId'] ?? '',
    );
  }
  //to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "profilePic": profilePic,
      "createdAt": createdAt,
      "phoneNumber": phoneNumber,
      "userId": userId,
    };
  }
}
