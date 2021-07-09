class RawVote {
  final int? id;
  final int userId;
  final int issueId;
  final int viewpointId;
  final int vote;
  final DateTime created_at;

  RawVote(
      {this.id,
      required this.userId,
      required this.issueId,
      required this.viewpointId,
      required this.vote,
      required this.created_at});

  factory RawVote.fromJson(Map<String, dynamic> json) {
    return RawVote(
        id: json['id'],
        userId: json['userId'],
        issueId: json['issueId'],
        viewpointId: json['viewpointId'],
        vote: json['vote'],
        created_at: json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['issueId'] = this.issueId;
    data['viewpointId'] = this.viewpointId;
    data['vote'] = this.vote;
    data['created_at'] = this.created_at;
    return data;
  }
}
