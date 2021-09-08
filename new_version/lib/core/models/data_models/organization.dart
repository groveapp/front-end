class Organization {
  final int? id;
  final String name;
  final String area;

  Organization({this.id, required this.name, required this.area});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(id: json['id'], name: json['name'], area: json['area']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['area'] = this.area;
    return data;
  }
}
