import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',

      // Login Page
      'login': "Login",
      'login_heading' : 'Go ahead and set up your account...',
      'login_subHeading' : 'Sign in-up to enjoy the best managing experience..',
      'register' : 'Register',
      'login_email' : 'Email Address',
      'password' : 'Password',
      'remember_me' : 'Remember me',
      'forgot_password' : 'Forgot Password?',
      'or_login_with' : 'Or Login with',
      'google' : 'Google',
      'facebook' : 'Facebook',

      // Home Page
      'home_heading' : 'Lao Note',
      'tab1' : 'Notes',
      'tab2' : 'Highlights',
      'tab3' : 'Favourite Notes',
      'list_notes' : 'List Notes',
      'highlight_notes' : 'Highlight Notes',
      'favourite_notes' : 'Favourite Notes',

      // Settings Page
      'name' : 'Taranjit Kaur',
      'settings_email' : 'iamtaran@gmail.com',
      'edit_profile' : 'Edit Profile',
      'settings_content' : 'CONTENT',
      'settings_preferences' : 'PREFERENCES',
      'favourites' : 'Favourites',
      'downloads' : 'Downloads',
      'language' : 'Language',
      'selected_language' : 'English',
      'dark_mode' : 'Dark Mode',
      'only_download_via_wifi' : "Only Download via Wi-Fi",
      'play_in_background' : 'Play in Background',

      //notesPage
      'quick_actions' : 'Quick Actions',
      'check_box' : 'Check Box',
      'numbered_list' : 'Numbered List',
      'bullet_list' : 'Bullet List',
      'code_block' : 'Code Block',
      'block_quote' : 'BlockQuote',
      'notes_title' : 'Title',
      'notes_subtitle' : 'Note...'
    },
    'es_US': {
      "hello": "Hola Mundo",
      "login": "Iniciar sesión"
    }
  };
}