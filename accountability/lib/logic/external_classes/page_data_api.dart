import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class PageDataApi {
  String endpoint = "api.thecatapi.com";
  Future<Either<Exception, String>> getPageData() async {
    try {
      final queryParameters = {
        "api_key": "YOUR_API_HERE",
      };
      final uri = Uri.https(endpoint, "/v1/images/search", queryParameters);
      final response = await http.get(uri);
      return Right(response.body);
    } catch (e) {
      return (Left(e));
    }
  }
}

// getPageData(pageID) {
//   return Future<PageFullData>.delayed(Duration(seconds: 2), () {
//     return pageDict[pageID];
//   });
// }

// Future<PageSummaryData> getPageSummary(pageID) {
//   return Future<PageSummaryData>.delayed(Duration(seconds: 2), () {
//     return pageSummaryDict[pageID];
//   });
// }
