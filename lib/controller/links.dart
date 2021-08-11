import 'package:url_launcher/url_launcher.dart';

class Links {
  _abrirInstagram() async {
    var instagramUrl = '';

    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Insira Seu Instagram $instagramUrl ';
    }
  }

  _abrirWats() async {
    var whatsapp = '';
    var watsappUrl =
        "https://api.whatsapp.com/send?phone=55${whatsapp}&text=sua%20mensagem.";

    if (await canLaunch(watsappUrl)) {
      await launch(watsappUrl);
    } else {
      throw 'Insira Whatsapp DDD $watsappUrl ';
    }
  }

  _abrirFacebook() async {
    var facebookUrl = 'https://www.facebook.com/profile.php?id=100007156547397';

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Insira Seu Instagram $facebookUrl ';
    }
  }

  Future<void> _chamadaTelefonica() async {
    String telef = '';
    if (await canLaunch(telef)) {
      await launch(telef);
    } else {
      throw 'Não foi possivel completar a ligação';
    }
  }

  _abrirGmail() async {
    String email = 'berseker3120@gmail.com';
    final Uri params = Uri(
      scheme: 'mailto',
      path: '$email',
      query: '',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  getEmail() {
    return _abrirGmail();
  }

  getTelef() {
    return _chamadaTelefonica();
  }

  getwats() {
    return _abrirWats();
  }

  getInsta() {
    return _abrirInstagram();
  }

  getFacebook() {
    return _abrirFacebook();
  }
}
