//add new issue
//view members (if public)

//add new leader activity

import 'package:flutter/material.dart';
import 'package:accountability/ui/components/page_full_card.dart';
import 'package:accountability/logic/internal_classes/data_structures.dart';

class OrganizationPageBody extends StatefulWidget {
  final PageFullData page;
  @override
  OrganizationPageBody(this.page);
  @override
  State createState() => _OrganizationPageBodyState();
}

class _OrganizationPageBodyState extends State<OrganizationPageBody> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          organizationDivergence(),
          organizationActivity(),
        ]));
  }
}

Widget organizationDivergence() {
  return Container(height: 100);
}

Widget organizationActivity() {
  return Text("Organization Activity");
}
