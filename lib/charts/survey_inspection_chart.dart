import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/helper/size_config.dart';

class SurveyInspectionChart extends StatelessWidget {
  const SurveyInspectionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  'Surveys',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.2,
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 5),
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  'Inspections',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100, // Adjust based on your data range
                barGroups: _buildBarGroups(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Ja', 'Fe', 'Ma', 'Ap', 'Ma', 'Ju', 'Ju', 'Au', 'Se', 'Oc', 'No', 'De'];
                        return Text(months[value.toInt()]);
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.2,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      // showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}');
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    // Sample data for surveys and inspections by month
    final surveys = [40, 35, 50, 70, 55, 60, 80, 90, 75, 65, 50, 45];
    final inspections = [30, 25, 45, 60, 50, 55, 70, 85, 70, 60, 40, 30];

    return List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: surveys[index].toDouble(),
            color: AppColors.primaryColor.withOpacity(0.8),
            width: 8,
          ),
          BarChartRodData(
            toY: inspections[index].toDouble(),
            color: AppColors.secondaryColor,
            width: 8,
          ),
        ],
        // showingTooltipIndicators: [0, 1],
      );
    });
  }
}
