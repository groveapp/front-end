import 'package:http/http.dart' as http;

// import needed model here
import 'package:grove_front/core/models/data_models/viewpoint.dart';

import 'package:grove_front/core/services/api_helper.dart';

class ViewpointProvider {
  http.Client client = http.Client();
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Viewpoint> getViewpointById(int id) async {
    final parsed = await _helper.get('/viewpoint/' + id.toString());
    return Viewpoint.fromJson(parsed['viewpoint']);
  }

  Future<List<Viewpoint>> getViewpointsByIssue(int? issueId) async {
    final parsed = await _helper.get('/viewpoint/issue/' + issueId.toString());
    return parsed['viewpoint']
        .map<Viewpoint>((json) => Viewpoint.fromJson(json))
        .toList();
  }

  Future postViewpoint(Viewpoint viewpoint) async {
    return await _helper.post('/viewpoint/', viewpoint).catchError((error) {
      return "error";
    });
  }
}
