import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userName = 'Big Jojo';  
    final String userEmail = 'bigjojo@gmail.com';

    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Profile User',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        elevation: 12,
        backgroundColor: Colors.red,
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
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Email de l'utilisateur
            Text(
              userEmail,
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
