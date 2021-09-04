import 'dart:js';

class Leader {
  final int? id;
  final int organizationId;
  final String firstName;
  final String lastName;
  final String bio;
  final int approvals;
  final int disapprovals;
  final double estApproval;
  final String votingRecord;

  Leader(
      {this.id,
      required this.organizationId,
      required this.firstName,
      required this.lastName,
      required this.bio,
      required this.approvals,
      required this.disapprovals,
      required this.estApproval,
      required this.votingRecord});

  factory Leader.fromJson(Map<String, dynamic> json) {
    return Leader(
        id: json['id'],
        organizationId: json['organizationId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        bio: json['bio'],
        approvals: json['approvals'],
        disapprovals: json['disapprovals'],
        estApproval: json['estApproval'],
        votingRecord: json['votingRecord']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['bio'] = this.bio;
    data['approvals'] = this.approvals;
    data['disapprovals'] = this.disapprovals;
    data['estApproval'] = this.estApproval;
    data['votingRecord'] = this.votingRecord;
    data['organizationId'] = this.organizationId;
    return data;
  }
}
