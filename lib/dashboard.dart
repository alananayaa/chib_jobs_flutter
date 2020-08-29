import 'package:chib_jobs_flutter/detail_job.dart';
import 'package:chib_jobs_flutter/dollar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'worker_data.dart';
import 'api.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chib Jobs',
        debugShowCheckedModeBanner: false,
        home: WorkersList());
  }
}

class WorkersList extends StatefulWidget {
  @override
  createState() => _WorkersList();
}

class _WorkersList extends State {
  var workers = List<Worker>();
  Dollar dollar = Dollar(22.0);

  _getWorkers() {
    API.getUsers().then((response) {
      setState(() {
        List list = json.decode(response.body);
        list.forEach((worker) {
          if (worker['profession'] != null &&
              worker['jobDescription'] != null &&
              worker['priceRate'] != null) {
            workers.add(Worker(
                '${worker['firstName']} ${worker['lastName']}',
                worker['phoneNumber'],
                worker['profession'],
                worker['jobDescription'],
                worker['priceRate']));
          }
        });

        workers.sort((a, b) => a.fullName.compareTo(b.fullName));

      });
    });
  }

  _getDollarPrice() {
    API.getDollarPrice().then((response) {
      dollar = Dollar.fromJson(json.decode(response.body));
      print(dollar.dollarPrice);
    });
  }

  initState() {
    super.initState();
    _getWorkers();
    _getDollarPrice();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chib Jobs',
        home: Scaffold(
            appBar: AppBar(title: const Text('Chib Jobs')),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                        itemCount: workers.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              height: 220,
                              width: double.maxFinite,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailJob(
                                            worker: workers[index],
                                            dollar: dollar),
                                      ));
                                },
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 2.0, color: Colors.blue),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Stack(children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Stack(
                                            children: <Widget>[
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(children: <Widget>[
                                                        workerInformation(
                                                            workers[index]),
                                                        Spacer(),
                                                        jobCost(workers[index],
                                                            dollar)
                                                      ]),
                                                      Row(
                                                        children: <Widget>[
                                                          jobInformation(
                                                              workers[index])
                                                        ],
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          jobContactInformation(
                                                              workers[index])
                                                        ],
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ),
                ],
              ),
            )));
  }
}

Widget workerInformation(data) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: '${data.fullName}',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        children: <TextSpan>[
          TextSpan(
              text: '\n${data.profession}',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget jobCost(data, dollar) {
  final double usdCost = data.priceRate.toDouble() / dollar.dollarPrice;
  final double totalCost = usdCost + (usdCost * 0.029) + 0.30;
  return Align(
      alignment: Alignment.centerRight,
      child: RichText(
          text: TextSpan(
              text: 'USD\$${totalCost.toStringAsFixed(2)}/hr',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 16))));
}

Widget jobInformation(data) {
  return Container(
      width: 250,
      height: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          data.jobDescription,
          style: TextStyle(fontSize: 14),
          maxLines: 4,
        ),
      ));
}

Widget jobContactInformation(data) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: 'Tel. ${data.phoneNumber}',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14),
      ),
    ),
  );
}
