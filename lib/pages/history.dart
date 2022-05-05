// ignore_for_file: must_be_immutable

import 'package:finalproject/request/get_history_data.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  late Future<List<DataHistory>> _futureHistory;

  @override
  Widget build(BuildContext context) {
    _futureHistory = fetchDataHistory();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade900,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 135),
            alignment: Alignment.topCenter,
            child: const Text(
              'Riwayat Presensi',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SafeArea(
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: (MediaQuery.of(context).size.height - 200) /
                    MediaQuery.of(context).size.height,
                minChildSize: (MediaQuery.of(context).size.height - 200) /
                    MediaQuery.of(context).size.height,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 15.0, right: 15.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: FutureBuilder<List<DataHistory>>(
                        future: _futureHistory,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              controller: scrollController,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, idx) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                                Icons.date_range_outlined),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              child: Text(
                                                snapshot.data![idx].datetime,
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                                Icons.location_on_outlined),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              child: Text(
                                                snapshot.data![idx].location,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.width * 0.1,
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          }
                        }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
