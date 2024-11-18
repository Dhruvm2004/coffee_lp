class UserModel {
  final String? id;
  final String name;
  final String phone;
  final String dob;
  final String email;

  const UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.dob,
    required this.email,
  });
  toJson() {
    return {
      "FullName":name,
      "Email":email,
      "Phone":phone,
      "BirthDate":dob,
    };
  }
}
