
import 'package:get/get.dart';

class TranslationScript extends Translations {
  @override
  
  Map<String, Map<String, String>> get keys => {
    'en_US':{
         "welcome":"Welcome",
         "your_email":" Your Email",
         "password":"Password",
         "forgot_password":"Forget Password?",
         "sign_in":"Login",
         "empty_field":"Empty Field",
         "send_email":"Send mail"
    },
     'fr_FR':{
      "send_email":"Envoyer email",
         "welcome":"Bienvenue",
         "your_email":" Votre Email",
         "password":"Mot de passe",
         "forgot_password":"Mot de passe oublié ?",
         "sign_in":"Se connecter",
         "empty_field":"Champ vide",
    }
  };


}