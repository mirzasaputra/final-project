import 'package:finalproject/request/session_user.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);
  late Future<UserData> _futureUserData;

  @override
  Widget build(BuildContext context) {
    _futureUserData = fetchUserData();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: const BoxDecoration(
        color: Color(0xFF0D47A1),
      ),
      child: FutureBuilder<UserData>(
          future: _futureUserData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.name == '') {
                Navigator.pushNamed(context, '/');
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        snapshot.data!.name,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/user.png'),
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
