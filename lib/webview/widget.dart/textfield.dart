import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatefulWidget {
  InAppWebViewController? webViewController;
  final String website;
  final TextEditingController controller;
  TextFieldItem(
      {super.key,
      required this.controller,
      this.webViewController,
      required this.website});

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: TextField(
        style: const TextStyle(fontSize: 14),
        keyboardType: TextInputType.url,
        onSubmitted: (value) {
          var url = Uri.parse(value);
          if (url.scheme.isEmpty) {
            url = Uri.parse("https://www.google.com/search?q=$value");
          }
          widget.webViewController!.loadUrl(urlRequest: URLRequest(url: url));
        },
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.website,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
          ),
        ),
      ),
    );
  }
}
