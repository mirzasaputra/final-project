import 'package:finalproject/component/pages/account/button_list_component.dart';
import 'package:finalproject/request/session_user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
  late Future<UserData> _futureUserData;

  @override
  Widget build(BuildContext context) {
    _futureUserData = fetchUserData();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg-banner.png'),
                  fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.edit_outlined, color: Color(0xFFE8E8E8)),
                            SizedBox(width: 8.0),
                            Text('Edit Profile',
                                style: TextStyle(
                                    fontSize: 16.0, color: Color(0xFFE8E8E8)))
                          ],
                        )),
                    top: 20.0,
                    right: 20.0,
                  ),
                  Positioned(
                    child: Row(
                      children: [
                        const ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/user.png'),
                            fit: BoxFit.cover,
                            width: 75,
                            height: 75,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        FutureBuilder<UserData>(
                            future: _futureUserData,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.name == '') {
                                  Navigator.pushNamed(context, '/');
                                }

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Color(0xFFE8E8E8),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      snapshot.data!.phone,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFE8E8E8),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.email,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFE8E8E8),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              return const CircularProgressIndicator();
                            })
                      ],
                    ),
                    left: 20.0,
                    bottom: 40.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          ButtonListComponent(title: "Profile", icon: Icons.chevron_right),
          const SizedBox(height: 20),
          ButtonListComponent(title: "Pengaturan", icon: Icons.chevron_right),
          const SizedBox(height: 20),
          ButtonListComponent(
              title: "Tentang Aplikasi", icon: Icons.chevron_right),
          const SizedBox(height: 20),
          ButtonListComponent(
              title: "Logout",
              icon: Icons.chevron_right,
              onTap: () {
                logOut(context);
              }),
        ],
      ),
    );
  }

  Future logOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('user');
    Navigator.pushNamed(context, '/');
  }
}
