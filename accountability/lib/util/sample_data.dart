import 'package:accountability/ui/styles.dart';

import '../logic/internal_classes/data_structures.dart';
import 'package:flutter/material.dart';
// class IssueData {
//   String title;
//   String organizationLevel;
//   String summary;
//   int numResponses;
//   int numExpertResponses;
//   int popularityRank;
//   String image;

//   IssueData(this.title, this.organizationLevel, this.summary, this.numResponses,
//       this.numExpertResponses, this.popularityRank, this.image);
// }

// var sampleIssue = IssueData("Issue Title", "City of Los Angeles",
//     "This is an issue summary.", 54, 79, 5, "images/barack-obama-main.jpg");

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

// class LeaderData {
//   String firstName;
//   String lastName;
//   String honorific;
//   String organizationLevel;
//   String organizationArea;
//   int approvals;
//   int disapprovals;
//   int estimatedApprovalRating;

//   LeaderData(
//       this.firstName,
//       this.lastName,
//       this.honorific,
//       this.organizationLevel,
//       this.organizationArea,
//       this.approvals,
//       this.disapprovals,
//       this.estimatedApprovalRating);
// }

// var sampleLeader = LeaderData("Barack", "Obama", "President",
//     "Federal Government", "United States of America", 88, 79, 63);

// class OrganizationData {
//   String name;
//   String organizationArea;
//   int numMembers;
//   int numLeaders;

//   OrganizationData(
//     this.name,
//     this.organizationArea,
//     this.numMembers,
//     this.numLeaders,
//   );
// }

// var sampleOrganization = OrganizationData(
//   "Federal Government",
//   "United States of America",
//   2400,
//   538,
// );

class PageData {
  String pageName;
  String organizationLevel;
  String organizationArea;
  int numResponses;
  int numViewpoints;

  PageData(
    this.pageName,
    this.organizationLevel,
    this.organizationArea,
    this.numResponses,
    this.numViewpoints,
  );
}

var samplePage = PageData(
    "Sidewalk Repairs", "City of Pittsburgh", "Pittsburgh, USA", 88, 5);

class QueryArgs {
  final String query;
  QueryArgs(this.query);
}

class SearchResult {
  String name;
  String type;

  SearchResult(this.name, this.type);
}

var sampleSearchResult = SearchResult("BarackObama", 'leader');

var sampleLeaderPage = LeaderSummaryData("Barack", "Obama", "Test 1", "Test@",
    "Blah Blah", 56, 67, 23, 'images/barack-obama-main.jpg');

var sampleOrganizationPage = OrganizationSummaryData("Federal Government",
    "United States", 53, 33, 'images/barack-obama-main.jpg');

var sampleIssuePage = IssueSummaryData(
  "Sidewalk Repair",
  "City of Pittsburgh",
  "United States",
  33,
  33,
);

var sampleIssue = IssueData(sampleIssuePage,
    SelectableText("This is the issue summary", style: subtitle1()));

var sampleLeader = LeaderData(sampleLeaderPage,
    SelectableText("This is the leader summary", style: subtitle1()));

var sampleOrganization = OrganizationData(sampleOrganizationPage,
    SelectableText("This is the organization summary", style: subtitle1()));

var loaderData = sampleOrganization;

var summaryLoaderData = sampleOrganizationPage;
