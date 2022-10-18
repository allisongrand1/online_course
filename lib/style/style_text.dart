import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String? information;
  final double size;
  final String? aboutInfo;
  final Color? color;
  const CustomText(
      {super.key,
      this.information,
      this.aboutInfo,
      this.size = 12,
      this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: aboutInfo,
              style: TextStyle(
                  fontSize: size, fontWeight: FontWeight.w300, color: color)),
          TextSpan(
              text: information,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 12, color: color)),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double size;
  final String header;
  const Header({super.key, required this.header, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(header,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: size));
  }
}
