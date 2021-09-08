import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front_new/core/models/data_models/user.dart';

import 'package:grove_front_new/core/services/api_helper.dart';

class UserProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<User> getUserById(int id) async {
    final parsed = await _helper.get('/user/' + id.toString());
    return User.fromJson(parsed['user']);
  }
}
