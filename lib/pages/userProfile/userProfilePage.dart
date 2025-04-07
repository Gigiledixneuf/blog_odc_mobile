import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/pages/userProfile/userProfileCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfilePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var state = ref.watch(UserProfileCtrlProvider);
    var controller = ref.read(UserProfileCtrlProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile User',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        elevation: 12,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Photo de profil (Icône de profil)
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            Text(
              state.user?.name??"",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Email de l'utilisateur
            Text(
              state.user?.email??"",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 200),

            ElevatedButton(
              onPressed: () {
                print("Déconnexion...");
              },
              child:Text(
                'Déconnexion',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
