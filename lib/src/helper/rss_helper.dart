class RssHelper {
  static String getImageFromFeed(String description) {
    int indexStart = description.indexOf('src=\"') + 5;
    int indexEnd = description.indexOf(' align=') - 1;
    return description.substring(indexStart, indexEnd);
  }

  static String changeSizeImage(
      {required String url, required int width, required int height}) {
    int index = url.indexOf('Uploaded') - 1;

    String newSize = '${height}x$width';
    url = url.replaceRange(27, index, newSize);
    return url;
  }
}
