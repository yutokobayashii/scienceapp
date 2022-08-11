import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class WeightData {
  final DateTime date;
  final double weight;

  WeightData(this.date, this.weight);
}
SizedBox graf() {
  return SizedBox(
    height: 500,
    child: Column(
      children: [
        // Card(
        //
        //   child: SizedBox(
        //     width: 300,
        //     height: 100,
        //     child: Center(child: Text('Elevated Card')),
        //   ),
        //
        // ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('点数グラフ'),
              Container(
                height: 300,
                child: charts.TimeSeriesChart(
                  _createWeightData(weightList),
                ),
              ),

              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("全体正答率：xx%"),
                    Text("最新正答率：xx%"),
                    Text("全体正答率：xx%"),
                    Text("全体正答率：xx%"),
                    Text("全体正答率：xx%"),
                  ],
                ),
              ),


            ],
          ),
        ),
      ],
    ),
  );
}


final weightList = <WeightData>[
  WeightData(DateTime(2020, 10, 2), 5),
  WeightData(DateTime(2020, 10, 3), 3),
  WeightData(DateTime(2020, 10, 4), 6),
  WeightData(DateTime(2020, 10, 9), 4),
  WeightData(DateTime(2020, 10, 15), 8),
  WeightData(DateTime(2020,10,20), 8)
];

List<charts.Series<WeightData, DateTime>> _createWeightData(
    List<WeightData> weightList) {
  return [
    charts.Series<WeightData, DateTime>(
      id: 'Muscles',
      data: weightList,
      colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
      domainFn: (WeightData weightData, _) => weightData.date,
      measureFn: (WeightData weightData, _) => weightData.weight,

    )
  ];
}