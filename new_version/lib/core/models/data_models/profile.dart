class Profile {
  final int? id;
  final String firstName;
  final String lastName;
  final String address;
  final int voterReg;
  final String voterRegLoc;
  final int age;

  Profile(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.voterReg,
      required this.voterRegLoc,
      required this.age});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'],
        address: json['address'],
        voterRegLoc: json['voterRegLoc'],
        voterReg: json['voterReg']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['age'] = this.age;
    data['address'] = this.address;
    data['voterRegLoc'] = this.voterRegLoc;
    data['voterReg'] = this.voterReg;
    return data;
  }
}
