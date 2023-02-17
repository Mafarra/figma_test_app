import 'package:flutter_svg/svg.dart';

const String imagePath = "assets/images";

class AppMedia {
  static const String parfum1 = "$imagePath/parfum1.jpeg";
  static const String parfum2 = "$imagePath/parfum2.jpeg";
  static const String parfum3 = "$imagePath/parfum3.jpeg";
  static const String channel = "$imagePath/channel.jpeg";
  static const String crown = "$imagePath/crown.png";
  static const String comment = "$imagePath/comment.png";
  static const String crownUrl = "https://www.flaticon.com/free-icons/crown_6941697";
  static const String channelUrl = "https://i.pinimg.com/736x/08/81/be/0881be6b025e8c7477a37e1ecee08641--chanel-logo-letter-c.jpg";
  static var svgImag = SvgPicture.string('''
<svg width="20" height="9" viewBox="0 0 20 9" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15.4056 0.244751C14.2585 0.244751 13.1751 0.688097 12.3984 1.45997L10.148 3.43913L10.144 3.43516L8.93716 4.49203L8.94511 4.49993L6.79829 6.39203C6.28848 6.89475 5.61138 7.17185 4.89045 7.17185C3.40082 7.17185 2.18998 5.97247 2.18998 4.49997C2.18998 3.02747 3.40082 1.8281 4.89045 1.8281C5.61138 1.8281 6.28848 2.10519 6.83414 2.6435L7.73827 3.43913L8.94112 2.38225L7.93341 1.4956C7.12088 0.692067 6.04147 0.248722 4.89041 0.248722C2.5166 0.244751 0.588814 2.15269 0.588814 4.49997C0.588814 6.84725 2.5166 8.75519 4.89045 8.75519C6.03755 8.75519 7.11696 8.31185 7.8976 7.54394L10.148 5.56082L10.152 5.56479L11.3549 4.50394L11.3509 4.49997L13.4977 2.61185C14.0075 2.10519 14.6846 1.8281 15.4056 1.8281C16.8952 1.8281 18.106 3.02747 18.106 4.49997C18.106 5.97247 16.8952 7.17185 15.4056 7.17185C14.6846 7.17185 14.0075 6.89475 13.4619 6.36038L12.5577 5.56475L11.3549 6.6256L12.3626 7.51225C13.1751 8.31578 14.2545 8.75515 15.4016 8.75515C17.7794 8.75519 19.7072 6.84725 19.7072 4.49997C19.7072 2.15269 17.7794 0.244751 15.4056 0.244751Z" fill="#5F5F5F"/>
</svg>
''');
}
