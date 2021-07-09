import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front/core/models/data_models/raw_vote.dart';

import 'package:grove_front/core/services/api_helper.dart';

class RawVoteProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<RawVote> getRawVoteById(int id) async {
    final parsed = await _helper.get('/rawVote/' + id.toString());
    return RawVote.fromJson(parsed['rawVote']);
  }
}
