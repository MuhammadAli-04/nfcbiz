import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({
    super.key,
    this.width,
    this.height,
    required this.weeklyLabels,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<String>? weeklyLabels;
  final List<dynamic>? chartData;

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  getLineColor(String color) {
    String sanitizedString = color.replaceAll('rgb(', '').replaceAll(')', '');
    List<String> colorValues = sanitizedString.split(',');
    int red = int.parse(colorValues[0]);
    int green = int.parse(colorValues[1]);
    int blue = int.parse(colorValues[2]);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    // return Container(height: 300, color: Colors.red);
     return (widget.chartData == null)
        ? Container(
            height: 300,
            alignment: Alignment.center,
            child: const Text(
              'No Data Available!!',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : Container(
            height: 300,
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  for (var data in widget.chartData!)
                    LineChartBarData(
                      spots: [
                        for (var i = 0; i < data['data'].length; i++)
                          FlSpot(i.toDouble(), data['data'][i].toDouble()),
                      ],
                      isCurved: true,
                      curveSmoothness: 0.5,
                      preventCurveOverShooting: true,
                      color: getLineColor(data['backgroundColor']),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < widget.weeklyLabels!.length) {
                          return Text(widget.weeklyLabels![value.toInt()]
                              .toString()
                              .split('-')
                              .first,style: const TextStyle(height: 1.5),);
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 28,
                      showTitles: true,
                    ),
                  ),
                  topTitles: const AxisTitles(),
                  rightTitles: const AxisTitles(
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    fitInsideHorizontally: true,
                    tooltipBgColor: Colors.blueGrey.shade50,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final flSpot = barSpot;

                        final data = widget.chartData![barSpot.barIndex];
                        final label = data['label'];

                        return (flSpot.y != 0)
                            ? LineTooltipItem(
                                '$label: ${flSpot.y.toInt()}', // Display label and y-axis value
                                TextStyle(
                                    color:
                                        getLineColor(data['backgroundColor']),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              )
                            : null;
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          );
  }
}
