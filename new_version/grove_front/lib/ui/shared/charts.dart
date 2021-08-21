import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grove_front/ui/shared/colors.dart';
import 'package:grove_front/ui/shared/typography.dart';
import 'package:grove_front/core/models/data_models/viewpoint.dart';

class ViewpointApprovalChart extends StatefulWidget {
  final List<Viewpoint> viewpointList;
  ViewpointApprovalChart({required this.viewpointList});
  @override
  State createState() => _ViewpointApprovalChartState();
}

class _ViewpointApprovalChartState extends State<ViewpointApprovalChart> {
  final Color barBackgroundColor = offPrimaryColor;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Head2Plain(text: "Estimated Viewpoint Approval"),
          const SizedBox(
            height: 4,
          ),
          Head3Plain(text: "Est. Percent of People in District Approving"),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BarChart(
                mainBarData(),
                swapAnimationDuration: animDuration,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: primaryColor,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              widget.viewpointList[group.x.toInt()].id;
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double index) {
            return widget.viewpointList[index.toInt()].id.toString();
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: groupsToShow(),
    );
  }

  List<BarChartGroupData> groupsToShow() {
    return widget.viewpointList
        .map<BarChartGroupData>((viewpoint) => makeGroupData(
            viewpoint.id ?? 1, viewpoint.upvotes.toDouble(),
            isTouched: widget.viewpointList.indexOf(viewpoint) == touchedIndex))
        .toList();
  }

  BarChartGroupData makeGroupData(
    int index,
    double value, {
    bool isTouched = false,
    Color barColor = actionColor,
    double width = 15,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          y: value,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
  }
}
