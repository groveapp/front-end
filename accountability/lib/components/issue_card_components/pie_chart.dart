import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

Widget buildPieChart() {
  return charts.PieChart(series,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: 60,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ],
      ));
}

var series = [
  charts.Series(
      domainFn: (ViewpointData viewpointData, _) => viewpointData.title,
      measureFn: (ViewpointData viewpointData, _) => viewpointData.numAgrees,
      id: '# Agrees',
      data: sampleChartData,
      labelAccessorFn: (ViewpointData row, _) =>
          '${row.title}: ${row.numAgrees}'),
];

class ViewpointData {
  String title;
  String summary;
  int numAgrees;
  int numDisagrees;
  int popularityRank;

  ViewpointData(this.title, this.summary, this.numAgrees, this.numDisagrees,
      this.popularityRank);
}

var sampleViewpoint = ViewpointData(
    "Viewpoint Title 1", "This is a viewpoint summary.", 54, 79, 5);

var sampleViewpoint2 = ViewpointData(
    "Viewpoint Title 2", "This is a viewpoint summary.", 66, 89, 5);

var sampleViewpoint3 = ViewpointData(
    "Viewpoint Title 3", "This is a viewpoint summary.", 24, 73, 5);

var sampleChartData = [sampleViewpoint, sampleViewpoint2, sampleViewpoint3];
