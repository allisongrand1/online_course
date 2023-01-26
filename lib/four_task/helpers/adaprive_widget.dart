import 'package:flutter/cupertino.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget? bigScreen;
  final Widget? smallScreen;
  const AdaptiveWidget({super.key, this.bigScreen, this.smallScreen});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 720 && bigScreen != null) {
      return bigScreen!;
    }

    if (smallScreen != null) {
      return smallScreen!;
    }

    throw Exception('Layout не собирается');
  }
}
