import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front/core/models/data_models/profile.dart';

import 'package:grove_front/core/services/api_helper.dart';

class ProfileProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Profile> getProfileById(int id) async {
    final parsed = await _helper.get('/profile/' + id.toString());
    return Profile.fromJson(parsed['profile']);
  }
}
