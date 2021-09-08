import 'package:flutter/material.dart';
import 'typography.dart';

// Define tables (mostly used in LeaderView)

class PastVotesTable extends StatelessWidget {
  final int data;
  PastVotesTable({required this.data});

  Widget build(BuildContext context) {
    return PaginatedDataTable(
        header: Text("Hello"),
        columns: [
          DataColumn(label: Head3Plain(text: "Bill Name")),
          DataColumn(label: Head3Plain(text: "Vote Date")),
          DataColumn(label: Head3Plain(text: "Vote")),
          DataColumn(label: Head3Plain(text: "Public Opinion"))
        ],
        source: PastVotesDataTableSource());
  }
}

class PastVotesDataTableSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('row #$index')),
        DataCell(Text('name #$index')),
      ],
    );
  }

  @override
  int get rowCount => 10; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 2;
}
