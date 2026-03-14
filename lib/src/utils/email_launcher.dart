import 'package:url_launcher/url_launcher.dart';

class EmailLauncher {
  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    try {
      if (await canLaunchUrl(Uri.parse(emailUri.toString()))) {
        await launchUrl(Uri.parse(emailUri.toString()));
      } else {
        throw 'No se pudo abrir el correo';
      }
    } catch (e) {
      throw 'Error al intentar abrir el correo: $e';
    }
  }
}
