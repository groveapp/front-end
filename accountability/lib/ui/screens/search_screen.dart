import 'package:accountability/util/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:accountability/ui/web_app/web_screen_builder.dart';

class SearchScreenBody extends StatefulWidget {
  @override
  State createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height - kToolbarHeight;

    final String query = ModalRoute.of(context).settings.arguments;

    return _buildBody(query, screenWidth, screenHeight);
  }
}

// Widget _buildBody(context, query, screenWidth) {
//   return Center(child: Text('$query'));
// }

Widget _buildBody(query, screenWidth, screenHeight) {
  var numColumns = screenWidth ~/ (400 + 32);

  return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Center(
          child: Expanded(
              child: DefaultTabController(
                  length: 4,
                  child: Column(children: [
                    Container(
                      height: 50,
                      child: Theme(
                          data: ThemeData(
                              tabBarTheme: TabBarTheme(
                                  labelColor: Colors.blue,
                                  unselectedLabelColor: Colors.lightBlue)),
                          child: TabBar(tabs: [
                            Tab(
                              text: "All (35)",
                              //icon: Icon(Icons.dashboard),
                            ),
                            Tab(
                              text: "Leaders (12)",
                              //icon: Icon(Icons.business_center)
                            ),
                            Tab(
                              text:
                                  "Organizations (12)", //icon: Icon(Icons.people)
                            ),
                            Tab(
                              text: "Issues (23)",
                              //: Icon(Icons.star)
                            ),
                          ])),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      _searchResultsList('all', numColumns),
                      _searchResultsList('leaders', numColumns),
                      _searchResultsList('organizations', numColumns),
                      _searchResultsList('issues', numColumns)
                    ]))
                  ])))));

  // Center(
  //     child: DefaultTabController(
  //         length: 4,
  //         child: Column(children: [
  //           Container(
  //               height: 50,
  //               child: TabBar(tabs: [
  //                 Tab(text: "All (35)"),
  //                 Tab(text: "Leaders (12)"),
  //                 Tab(text: "Organizations (5)"),
  //                 Tab(text: "Issues (49)"),
  //               ])),
  //           TabBarView(children: [
  //             _searchResultsList('all', numColumns),
  //             _searchResultsList('leaders', numColumns),
  //             _searchResultsList('organizations', numColumns),
  //             _searchResultsList('issues', numColumns)
  //           ])
  //         ])));
}

Widget _searchResultsList(type, numColumns) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: numColumns,
                mainAxisSpacing: 0,
                children: [
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                  _searchResultItem(sampleSearchResult),
                ]),
          )
        ],
      ));
}

Widget _searchResultItem(searchResult) {
  return Card(child: Center(child: Text(searchResult.name)));
}
