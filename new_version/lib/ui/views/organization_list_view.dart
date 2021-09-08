import 'package:flutter/material.dart';
import 'package:grove_front_new/core/providers/viewpoint_provider.dart';
import 'package:grove_front_new/ui/shared/buttons.dart';
import 'package:grove_front_new/ui/shared/web_wrapper.dart';
import 'package:grove_front_new/ui/shared/cards.dart';
import 'package:grove_front_new/core/models/data_models/organization.dart';
import 'package:grove_front_new/core/providers/organization_provider.dart';
import 'package:provider/provider.dart';
import 'package:grove_front_new/core/models/page_models/issue_page_model.dart';
import 'package:grove_front_new/ui/shared/typography.dart';

// Define list of organizations view.

class OrganizationListView extends StatefulWidget {
  // accept passed arguments from nav here

  @override
  State createState() => _OrganizationListViewState();
}

class _OrganizationListViewState extends State<OrganizationListView> {
  bool isLoading = false;

  //add needed data models here: late List<MessageModel> messageList;
  late List<Organization> organizations;

  //add needed data providers here: MessageProvider messageProvider = new MessageProvider();
  OrganizationProvider organizationProvider = new OrganizationProvider();

  void initState() {
    _fetchData();
    super.initState();
  }

  Future _fetchData() async {
    setState(() => isLoading = true);
    // add method to fetch here: messageList = await messageProvider.fetchPosts();
    organizations = await organizationProvider.getAllOrganizations();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return WebScreen(Center(
        child: isLoading
            ? CircularProgressIndicator()
            :
            //add code here
            Column(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  alignment: Alignment.topCenter,
                  child: Head3Plain(text: "Organizations"),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: organizations.length,
                    itemBuilder: (context, index) {
                      return OrganizationCard(
                          organizationId: organizations[index].id.toString(),
                          name: organizations[index].name,
                          area: organizations[index].area);
                    }),
              ])));
  }
}
