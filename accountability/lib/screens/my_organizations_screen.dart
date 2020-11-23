import 'package:accountability/components/page_summary_card.dart';
import 'package:accountability/styles.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:flutter/material.dart';

class MyOrganizationsScreenBody extends StatelessWidget {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;
    return _buildBody(screenWidth, screenHeight);
  }
}

Widget _buildBody(screenWidth, screenHeight) {
  var numColumns = screenWidth ~/ (400 + 32);
  return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("My Organizations", style: title2())),
              Expanded(
                child: GridView.count(
                    childAspectRatio: 3 / 2,
                    crossAxisCount: numColumns,
                    mainAxisSpacing: 0,
                    children: [
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      _myOrganizations(sampleOrganizationPage),
                      Container(
                          height: 400,
                          width: 400,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: TextButton(
                              child: Text("Join More Organizations"),
                              onPressed: () {}))
                    ]),
              )
            ],
          )));
}

Widget _myOrganizations(organization) {
  return buildSummaryCard(organization);
}
