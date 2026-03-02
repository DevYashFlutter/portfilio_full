import 'package:url_launcher/url_launcher.dart';
import 'file_download_helper_mobile.dart' if (dart.library.html) 'file_download_helper_web.dart';

class FileService {
  static Future<void> downloadFile(String assetPath, String fileName, {String? fallbackUrl}) async {
    try {
      await FileDownloadHelperImpl().download(assetPath, fileName);
    } catch (e) {
      if (fallbackUrl != null) {
        final Uri url = Uri.parse(fallbackUrl);
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
  }
}
