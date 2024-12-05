import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class YourProgressScreen extends StatelessWidget {
  final String role = "Student";

  const YourProgressScreen({super.key}); // Replace with dynamic role if needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(  // Make the body scrollable
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Centering the "Hello, Student!" text
                Center(
                  child: Text(
                    'Hello, $role!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildChartCard(
                  context,
                  title: 'Activity Distribution',
                  chart: SfCircularChart(
                    title: ChartTitle(text: 'Activity Distribution'),
                    legend: const Legend(isVisible: true),
                    series: <CircularSeries>[
                      PieSeries<_ChartData, String>(
                        dataSource: [
                          _ChartData.pieOrBar('Assignments', 40),
                          _ChartData.pieOrBar('Exams', 30),
                          _ChartData.pieOrBar('Projects', 20),
                          _ChartData.pieOrBar('Others', 10),
                        ],
                        xValueMapper: (_ChartData data, _) => data.category,
                        yValueMapper: (_ChartData data, _) => data.value,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildChartCard(
                  context,
                  title: 'Monthly Progress',
                  chart: SfCartesianChart(
                    title: ChartTitle(text: 'Monthly Progress'),
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      ColumnSeries<_ChartData, String>(
                        dataSource: [
                          _ChartData.pieOrBar('Jan', 75),
                          _ChartData.pieOrBar('Feb', 85),
                          _ChartData.pieOrBar('Mar', 90),
                          _ChartData.pieOrBar('Apr', 80),
                        ],
                        xValueMapper: (_ChartData data, _) => data.category,
                        yValueMapper: (_ChartData data, _) => data.value,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildChartCard(
                  context,
                  title: 'Performance Over Time',
                  chart: SfCartesianChart(
                    title: ChartTitle(text: 'Performance Over Time'),
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<_ChartData, DateTime>(
                        dataSource: [
                          _ChartData.lineChart(DateTime(2024, 1, 1), 60),
                          _ChartData.lineChart(DateTime(2024, 2, 1), 70),
                          _ChartData.lineChart(DateTime(2024, 3, 1), 80),
                          _ChartData.lineChart(DateTime(2024, 4, 1), 90),
                        ],
                        xValueMapper: (_ChartData data, _) => data.date,
                        yValueMapper: (_ChartData data, _) => data.value,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildProgressCard(
                  context,
                  title: 'Overall Progress',
                  value: 0.75, // Example progress (75%)
                  progressText: '75% Completed',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChartCard(BuildContext context, {required String title, required Widget chart}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 300, // Making the chart bigger
              child: chart,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context, {required String title, required double value, required String progressText}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
            ),
            const SizedBox(height: 15),
            Center(
              child: CircularProgressIndicator(
                value: value, // Example progress (75%)
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                strokeWidth: 8,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                progressText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  final String category;
  final double value;
  final DateTime date;

  _ChartData.pieOrBar(this.category, this.value) : date = DateTime.now();
  _ChartData.lineChart(this.date, this.value) : category = '';
}
