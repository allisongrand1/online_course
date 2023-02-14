import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// ignore: must_be_immutable
class Buttons extends StatefulWidget {
  InAppWebViewController? webViewController;
  Buttons({super.key, this.webViewController});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
            future: widget.webViewController?.getCopyBackForwardList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.list!.length > 1) {
                  return IconButton(
                      onPressed: () {
                        widget.webViewController?.goBack();
                      },
                      icon: const Icon(Icons.arrow_back));
                }
                return Container();
              }

              return Container();
            }),
        FutureBuilder(
            future: widget.webViewController?.getCopyBackForwardList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.list!.length > 1) {
                  return IconButton(
                      onPressed: () {
                        widget.webViewController?.goForward();
                      },
                      icon: const Icon(Icons.arrow_forward));
                }
                return Container();
              }

              return Container();
            }),
        FutureBuilder(
            future: widget.webViewController?.isLoading(),
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return IconButton(
                    onPressed: () {}, icon: const Icon(Icons.close));
              }
              return IconButton(
                  onPressed: () {
                    widget.webViewController?.reload();
                  },
                  icon: const Icon(Icons.replay));
            }),
      ],
    );
  }
}
