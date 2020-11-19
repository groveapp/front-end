class PageSummaryData {
  String pageName;
  String subtitle1;
  String subtitle2;
  String subtitle3;
  String data1;
  String data2;
  String data3;
  String image;

  PageSummaryData(
      {this.pageName = '',
      this.subtitle1 = '',
      this.subtitle2 = '',
      this.subtitle3 = '',
      this.data1 = '',
      this.data2 = '',
      this.data3 = '',
      this.image = 'images/barack-obama-main.jpg'});
}

class LeaderSummaryData extends PageSummaryData {
  LeaderSummaryData(
    String firstName,
    String lastName,
    String honorific,
    String organization,
    String organizationArea,
    int approvals,
    int disapprovals,
    double estimatedApprovalRating,
    String image,
  ) : super(
            pageName: '$firstName $lastName',
            subtitle1: honorific,
            subtitle2: organization,
            subtitle3: organizationArea,
            data1: '$approvals Approvals',
            data2: '$disapprovals Disapprovals',
            data3: '$estimatedApprovalRating Estimated Approval',
            image: image);
}

class OrganizationSummaryData extends PageSummaryData {
  OrganizationSummaryData(
    String name,
    String organizationArea,
    int numMembers,
    int numLeaders,
    String image,
  ) : super(
            pageName: name,
            subtitle1: organizationArea,
            data1: '$numMembers Members',
            data2: '$numLeaders Leaders',
            image: image);
}

class IssueSummaryData extends PageSummaryData {
  IssueSummaryData(
    String pageName,
    String organization,
    String organizationArea,
    int numResponses,
    int numViewpoints,
  ) : super(
          pageName: pageName,
          subtitle1: organization,
          subtitle2: organizationArea,
          data1: "$numResponses Responses",
          data2: "$numViewpoints Viewpoints",
        );
}
