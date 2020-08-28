import 'package:chib_jobs_flutter/worker_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dollar.dart';

class DetailJob extends StatelessWidget {
  final Worker worker;
  final Dollar dollar;
  const DetailJob({Key key, @required this.worker, this.dollar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double serviceCost = worker.priceRate.toDouble() / dollar.dollarPrice;
    final double taxes = serviceCost * 0.029;
    final double totalCost = serviceCost + taxes;

    return Scaffold(
        appBar: AppBar(
          title: Text(worker.fullName),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        worker.profession,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    height: 200,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        worker.jobDescription,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                        maxLines: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    height: 30,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tel: ${worker.phoneNumber}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    height: 16,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Desglose del costo:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Costo del servicio: USD\$${serviceCost.toStringAsFixed(2)}/hr',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Cobro de plataforma: USD\$${taxes.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 360,
                    height: 30,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Cobro total: USD\$${totalCost.toStringAsFixed(2)}/hr',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
