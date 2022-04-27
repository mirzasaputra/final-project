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
                  border: Border.all(color: Colors.grey.shade200, width: 1.0)
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: const Text('Pukul: 07.00 - 08.00 WIB', style: TextStyle(fontSize: 10.0, color: Colors.white))
                    ),
                    const SizedBox(height: 10.0),
                    const Text("Anda masih belum melakukan presensi", style: TextStyle(fontSize: 15),),
                    RaisedButton(
                        onPressed: (){
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.blue,
                                Colors.blue.shade900,
                              ],
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Container(
                            width: 150.0,
                            constraints: const BoxConstraints(minWidth: 50.0, minHeight: 40.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text('Presensi Sekarang', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                          ),
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
