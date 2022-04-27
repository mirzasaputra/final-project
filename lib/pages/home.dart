import 'package:flutter/material.dart';
import 'package:finalproject/component/pages/home/header.dart';
import 'package:finalproject/component/pages/home/status_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jumat, 12 September 2021",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "Absensi Masuk",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width * 0.6) - 40,
            left: 0,
            right: 0,
            child: const Center(
              child: StatusBar(),
            ),
          ),
        ],
      ),
    );
  }
}
