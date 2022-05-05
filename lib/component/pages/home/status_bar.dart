import 'package:finalproject/request/status_bar_request.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusBar extends StatelessWidget {
  StatusBar({Key? key}) : super(key: key);
  late Future<StatusBarRequest> _futureStatusBar;

  @override
  Widget build(BuildContext context) {
    _futureStatusBar = fetchStatusBar();

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: FutureBuilder<StatusBarRequest>(
          future: _futureStatusBar,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.onTime,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Text('Hadir'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.lateLate,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Text('Terlambat'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.notPresent,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      const Text('Tidak Hadir'),
                    ],
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Text('Hadir'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Text('Terlambat'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24)),
                      Text('TIdak Hadir'),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }
}
