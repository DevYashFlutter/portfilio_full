abstract class EmailService {
  Future<void> sendEmail({required String fromName, required String fromEmail, required String message, required String subject, required String toEmail});
}
