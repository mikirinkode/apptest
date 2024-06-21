class ContactModel {
  final String id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  ContactModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.dob});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"]);
  }
}
