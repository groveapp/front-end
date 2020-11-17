import 'package:accountability/components/issue_card_components/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:accountability/components/issue_card_components/chart_form_field.dart';

Widget buildChart() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(children: [
        SizedBox(height: 100, width: 300, child: MyFormField()),
        SizedBox(height: 200, width: 300, child: buildPieChart())
      ]));
}

Widget buildChartArea() {
  return Column(children: [
    Container(child: SelectableText("Data", style: TextStyle(fontSize: 36))),
    Container(
      child: SizedBox(
        height: 500,
        width: 300,
        child: DefaultTabController(
          length: 2,
          child: Column(children: [
            Theme(
              data: ThemeData(
                  tabBarTheme: TabBarTheme(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.lightBlue)),
              child: TabBar(
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(text: 'Chart', icon: Icon(Icons.pie_chart)),
                  Tab(text: 'Map', icon: Icon(Icons.map)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildChart(),
                  buildChart(),
                ],
              ),
            )
          ]),
        ),
      ),
    )
  ]);
}
