import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front_new/core/models/data_models/leader.dart';

import 'package:grove_front_new/core/services/api_helper.dart';

class LeaderProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Leader> getLeaderById(int id) async {
    final parsed = await _helper.get('/leader/' + id.toString());
    return Leader.fromJson(parsed['leader']);
  }
}
