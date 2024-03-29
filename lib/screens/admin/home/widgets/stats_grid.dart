import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatelessWidget {
  final totalVehiclesCount;
  final totalScansCount;
  final totalVehicleLogsCount;
  final totalExpiredVehiclesCount;
  final Function currentScreenHandler;

  StatsGrid({
    @required this.totalVehiclesCount,
    @required this.totalScansCount,
    @required this.totalVehicleLogsCount,
    @required this.totalExpiredVehiclesCount,
    this.currentScreenHandler,
  });

  // final graphRed = Color(0xffff6a69);
  // final graphBlue = Color(0xff7a54ff);
  // final graphOrange = Color(0xffff8f61);
  // final graphGreen = Color(0xff96da47);
  // final graphLightBlue = Color(0xff2ac3ff);

  final graph1 = Color(0xff37306B);
  final graph2 = Color(0xff66347F);
  final graph3 = Color(0xff9E4784);
  final graph4 = Color(0xffD27685);
  

  final numberFormatter = NumberFormat.compact(locale: 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Vehicles', totalVehiclesCount, graph1,
                    () {
                  currentScreenHandler(2);
                }),
                _buildStatCard(
                    'Permit Expired', totalExpiredVehiclesCount, graph2, () {
                  currentScreenHandler(2);
                }),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Total Scans', totalScansCount, graph3, () {}),
                _buildStatCard(
                    'Total Vehicle Logs', totalVehicleLogsCount, graph4,
                    () {
                  currentScreenHandler(1);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(
      String title, int count, Color color, Function navigateHandler) {
    return Expanded(
      child: GestureDetector(
        onTap: navigateHandler,
        child: Container(
          margin: EdgeInsets.all(7.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: color,
                blurRadius: 0,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Countup(
                begin: 0,
                end: count.toDouble(),
                separator: ',',
                duration: Duration(seconds: 2),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
