import 'package:blog_mobile/pages/login/loginCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var state=ref.watch(loginCtrlProvider); //observer les données
    return Scaffold(
      backgroundColor: Colors.grey[300], // Fond gris très clair
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), // Ajoute des marges
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Aligne au centre
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Espacement dynamique


              Icon(Icons.account_circle, size: 150, color: Colors.lightBlueAccent),
              SizedBox(height: 10),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent,
                ),
              ),

              SizedBox(height: 40),


              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                ),
              ),

              SizedBox(height: 20),

              // Champ Mot de passe avec labelText
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                  labelStyle: TextStyle(color: Colors.lightBlueAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.lightBlueAccent),
                ),
              ),

              SizedBox(height: 30),

              // Bouton Se connecter
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    var ctrl=ref.read(loginCtrlProvider.notifier);// pour executer une action
                    ctrl.submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.lightBlueAccent.withOpacity(0.5),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text( state.isLoading==true? 'Chargement...': "Se connecter", style: TextStyle(fontSize: 18)),
                ),
              ),

              SizedBox(height: 15),

              // Bouton Créer un compte
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.lightBlueAccent,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    elevation: 2,
                    side: BorderSide(color: Colors.lightBlueAccent, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Créer un compte', style: TextStyle(fontSize: 18)),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Espacement dynamique
            ],
          ),
        ),
      ),
    );
  }
}
