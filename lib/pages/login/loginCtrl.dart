import 'package:blog_mobile/pages/login/loginState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Définition d'un contrôleur pour gérer l'état de la connexion
class Loginctrl extends StateNotifier<LoginState> {
  // Initialisation du contrôleur avec un état de connexion par défaut
  Loginctrl() : super(LoginState()) {
    // Ici, on pourrait ajouter une logique d'initialisation si nécessaire
  }

  // Fonction asynchrone pour soumettre le formulaire de connexion
  Future<void> submitForm() async {
    // Mise à jour de l'état : isLoading devient true pour indiquer que le chargement commence
    state = state.copyWith(isLoading: true);

    // Simulation d'un délai de 3 secondes (ex: attente de réponse d'un serveur)
    await Future.delayed(Duration(seconds: 3));

    // Mise à jour de l'état : isLoading repasse à false une fois le traitement terminé
    state = state.copyWith(isLoading: false);
  }
}

// Déclaration d'un provider Riverpod pour Loginctrl
final loginCtrlProvider = StateNotifierProvider<Loginctrl, LoginState>((ref) {
  // Permet de garder le provider actif même s'il n'est plus utilisé temporairement
  ref.keepAlive();

  // Retourne une instance du contrôleur de connexion
  return Loginctrl();
});
