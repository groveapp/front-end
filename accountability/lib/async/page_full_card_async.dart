import 'package:accountability/logic/internal_classes/data_structures.dart';
import 'package:flutter/material.dart';
import 'package:accountability/util/sample_data.dart';

// Future<PageFullData> getPageData(pageID) async {
//   //query server here, using pageID

//   // if (pageID.type == 'leader') {
//   //   return sampleLeader;
//   // } else if (pageID.type == 'organization') {
//   //   return sampleOrganization;
//   // } else if (pageID.type == 'issue') {
//   //   return sampleIssue;
//   // } else
//   //   throw ("wrong page type");

//   return await pageDict[pageID];
// }

// loadPageData(pageID) {
//   Future<PageFullData> pageDataFuture = pageDict[pageID];
//   return FutureBuilder<PageFullData>(
//       future: pageDataFuture,
//       builder: (BuildContext context, AsyncSnapshot<PageFullData> snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return Text('Loading....');
//           default:
//             if (snapshot.hasError)
//               return Text('Error: ${snapshot.error}');
//             else
//               return Text('Result: ${snapshot.data}');
//         }
//       });
// }

//query server here, using pageID

// if (pageID.type == 'leader') {
//   return sampleLeader;
// } else if (pageID.type == 'organization') {
//   return sampleOrganization;
// } else if (pageID.type == 'issue') {
//   return sampleIssue;
// } else
//   throw ("wrong page type");
Future<PageFullData> getPageData(pageID) {
  return Future<PageFullData>.delayed(Duration(seconds: 2), () {
    return pageDict[pageID];
  });
}

Future<PageSummaryData> getPageSummary(pageID) {
  return Future<PageSummaryData>.delayed(Duration(seconds: 2), () {
    return pageSummaryDict[pageID];
  });
}
