import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front/core/models/data_models/organization.dart';

import 'package:grove_front/core/services/api_helper.dart';

class OrganizationProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Organization> getOrganizationById(int id) async {
    final parsed = await _helper.get('/organization/' + id.toString());
    return Organization.fromJson(parsed['organization']);
  }

  Future<List<Organization>> getAllOrganizations() async {
    final parsed = await _helper.get('/organizations');
    return parsed['organization']
        .map<Organization>((json) => Organization.fromJson(json))
        .toList();
  }
}
