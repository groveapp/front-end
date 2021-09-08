import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front_new/core/models/data_models/issue.dart';

import 'package:grove_front_new/core/services/api_helper.dart';

class IssueProvider {
  // change endpoint
  // final String _url = "https://grove-backend.herokuapp.com/api/issue/";
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Issue> getIssueById(int id) async {
    final parsed = await _helper.get('/issue/' + id.toString());
    return Issue.fromJson(parsed['issue']);
  }

  Future<List<Issue>> getIssuesByOrganization(int organizationId) async {
    final parsed =
        await _helper.get('/issue/organization/' + organizationId.toString());
    return parsed['issue'].map<Issue>((json) => Issue.fromJson(json)).toList();
  }

  Future<List<Issue>> getAllIssues() async {
    final parsed = await _helper.get('/issue');
    return parsed['issue'].map<Issue>((json) => Issue.fromJson(json)).toList();
  }

  // change future type, refactor to fetch lists/use other request params
  // Future<Issue> getIssueById(int id) async {
  //   final response = await client.get(Uri.parse(_url + id.toString()));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final parsed = json.decode(response.body);
  //     return Issue.fromJson(parsed['issue']);
  //   } else {
  //     throw Exception('Failed to load messages');
  //   }
  // }

}
