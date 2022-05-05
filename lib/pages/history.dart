import 'package:flutter/material.dart';
import 'package:finalproject/component/pages/history/data.dart';
import 'package:finalproject/component/pages/history/userlist.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Presensi'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: MyHistory(),
    );
  }
}

class MyHistory extends StatefulWidget {
  MyHistory({Key? key}) : super(key: key);

  _MyHistoryState createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: background,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return userList(context, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
