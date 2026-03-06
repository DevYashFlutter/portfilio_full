import 'dart:convert';
import 'package:http/http.dart' as http;
import 'email_service.dart';

class EmailServiceImpl implements EmailService {
  // Replace with your EmailJS credentials
  static const String _serviceId = 'service_6586byo';
  static const String _templateId = 'template_fv3jzel';
  static const String _publicKey = 'FaAJvy7W28VG4uHmu';

  @override
  Future<void> sendEmail({required String fromName, required String fromEmail, required String message, required String subject, required String toEmail}) async {
    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': _serviceId,
        'template_id': _templateId,
        'user_id': _publicKey,
        'template_params': {'to_email': toEmail, 'from_name': fromName, 'from_email': fromEmail, 'subject': subject, 'message': message},
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to send email: ${response.body}");
    }
  }
}
