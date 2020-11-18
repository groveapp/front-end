class IssueData {
  String title;
  String organizationLevel;
  String summary;
  int numResponses;
  int numExpertResponses;
  int popularityRank;

  IssueData(this.title, this.organizationLevel, this.summary, this.numResponses,
      this.numExpertResponses, this.popularityRank);
}

var sampleIssue = IssueData("Issue Title", "City of Los Angeles",
    "This is an issue summary.", 54, 79, 5);

class ViewpointData {
  String title;
  String summary;
  int numAgrees;
  int numDisagrees;
  int popularityRank;

  ViewpointData(this.title, this.summary, this.numAgrees, this.numDisagrees,
      this.popularityRank);
}

var sampleViewpoint = ViewpointData("Viewpoint Title 1", summary, 54, 79, 5);

var sampleViewpoint2 = ViewpointData("Viewpoint Title 2", summary, 66, 89, 5);

var sampleViewpoint3 = ViewpointData("Viewpoint Title 3", summary, 24, 73, 5);

var sampleChartData = [sampleViewpoint, sampleViewpoint2, sampleViewpoint3];

final summary =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class LeaderData {
  String firstName;
  String lastName;
  String honorific;
  String organizationLevel;
  String organizationArea;
  int approvals;
  int disapprovals;
  int estimatedApprovalRating;

  LeaderData(
      this.firstName,
      this.lastName,
      this.honorific,
      this.organizationLevel,
      this.organizationArea,
      this.approvals,
      this.disapprovals,
      this.estimatedApprovalRating);
}

var sampleLeader = LeaderData("Barack", "Obama", "President",
    "Federal Government", "United States of America", 88, 79, 63);

class OrganizationData {
  String name;
  String organizationArea;
  int numMembers;
  int numLeaders;

  OrganizationData(
    this.name,
    this.organizationArea,
    this.numMembers,
    this.numLeaders,
  );
}

var sampleOrganization = OrganizationData(
  "Federal Government",
  "United States of America",
  2400,
  538,
);
