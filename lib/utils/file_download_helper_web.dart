import 'dart:html' as html;
import 'file_download_helper.dart';

class FileDownloadHelperImpl implements FileDownloadHelper {
  @override
  Future<void> download(String assetPath, String fileName) async {
    // On Web, the simplest way is to link directly to the asset URL
    // Flutter Web serves assets from 'assets/' prefix
    final String url = assetPath.startsWith('assets/') ? assetPath : 'assets/$assetPath';
    final anchor = html.AnchorElement()
      ..href = url
      ..download = fileName
      ..style.display = 'none';
    html.document.body!.children.add(anchor);
    anchor.click();
    html.document.body!.children.remove(anchor);
  }
}
