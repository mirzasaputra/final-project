import 'dart:ffi';

import 'package:finalproject/component/pages/account/button_list_component.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-banner.png'),
                fit: BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        children: const [
                          Icon(Icons.edit_outlined, color: Color(0xFFE8E8E8)),
                          SizedBox(width: 8.0),
                          Text('Edit Profile', style: TextStyle(fontSize: 16.0, color: Color(0xFFE8E8E8)))
                        ],
                      )
                    ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Adi Purnomo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFE8E8E8))),
                            SizedBox(height: 5.0,),
                            Text('+62822-33000-884', style: TextStyle( fontSize: 13, color: Color(0xFFE8E8E8))),
                            Text('contact.katarama@gmail.com', style: TextStyle( fontSize: 13, color: Color(0xFFE8E8E8))),
                          ],
                        )
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
          ButtonListComponent(title: "Tentang Aplikasi", icon: Icons.chevron_right),
          const SizedBox(height: 20),
          ButtonListComponent(title: "Logout", icon: Icons.chevron_right),
        ],
      ),
    );
  }
}