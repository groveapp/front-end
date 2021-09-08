class Issue {
  int? id;
  String name;
  String summary;
  int totalVotes;
  int isBill;
  int organizationId;

  Issue(
      {this.id,
      required this.name,
      required this.summary,
      required this.totalVotes,
      required this.isBill,
      required this.organizationId});

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'],
      name: json['name'],
      summary: json['summary'],
      totalVotes: json['total_votes'],
      isBill: json['isBill'],
      organizationId: json['organizationId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['summary'] = this.summary;
    data['total_votes'] = this.totalVotes;
    data['isBill'] = this.isBill;
    data['organizationId'] = this.organizationId;
    return data;
  }
}
