class Viewpoint {
  final int? id;
  final int issueId;
  final String text;
  //final double pop_estimate;
  final int upvotes;
  //final int userId;

  Viewpoint({
    this.id,
    required this.issueId,
    required this.text,
    //required this.pop_estimate,
    required this.upvotes,
    //required this.userId
    //
  });

  factory Viewpoint.fromJson(Map<String, dynamic> json) {
    return Viewpoint(
      id: json['id'],
      issueId: json['issueId'],
      text: json['text'],
      //pop_estimate: json['pop_estimate'],
      upvotes: json['upvotes'],
      //userId: json['userId'],
    );
  }
}
