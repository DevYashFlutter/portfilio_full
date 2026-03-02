import 'package:url_launcher/url_launcher.dart';
import 'file_download_helper.dart';

class FileDownloadHelperImpl implements FileDownloadHelper {
  @override
  Future<void> download(String assetPath, String fileName) async {
    final Uri url = Uri.parse(assetPath);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
