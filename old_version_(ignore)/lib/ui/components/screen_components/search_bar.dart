import 'package:accountability/routes.dart';
import 'package:accountability/util/sample_data.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Search pages',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        suffixIcon: IconButton(
          onPressed: () {
            search(context, searchController.text);
          },
          icon: Icon(Icons.search, color: Colors.grey),
        ),
        //enabledBorder: UnderlineInputBorder(
        //borderSide: BorderSide(color: Color(0xFF6200EE)),
        // ),
      ),
      onEditingComplete: () {
        search(context, searchController.text);
      },
    );
  }
}

Future search(context, query) {
  print('search_bar> $query');
  return Navigator.pushNamed(context, SearchPageRoute, arguments: query);
}
