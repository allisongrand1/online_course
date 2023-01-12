// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:advanced_widget/icons/custom_icons.dart';
import 'package:advanced_widget/main.dart';
import 'package:advanced_widget/theme/theme.dart';
// ignore: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class Sheet extends StatelessWidget {
  final bool isVisible;
  const Sheet({
    super.key,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    String getInfo(double value) {
      if (0.0 <= value && value <= 0.3) {
        DataWidget.of(context).degree = 20;
        return "Солнечно";
      } else if (0.4 <= value && value <= 0.7) {
        DataWidget.of(context).degree = 10;
        return "Облачно";
      } else {
        DataWidget.of(context).degree = 5;
        return "Дождливо";
      }
    }

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        AnimatedOpacity(
            opacity: isVisible ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: Switch.adaptive(
              activeColor: CustomTheme.darkTheme.colorScheme.primary,
              onChanged: (value) {
                currentTheme.toggleTheme();
              },
              value: CustomTheme.isDarkTheme,
            )),
        AnimatedPositioned(
          top: isVisible ? 150 : 0,
          left: 110,
          duration: const Duration(milliseconds: 300),
          child: AnimatedOpacity(
              opacity: isVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: 70,
                child: Column(
                  children: [
                    Text(
                      getInfo(DataWidget.of(context).number),
                      style: TextStyle(
                          fontSize: CustomTheme
                              .darkTheme.textTheme.headline1!.fontSize),
                    ),
                    Text("+${DataWidget.of(context).degree} °C")
                  ],
                ),
              )),
        ),
        AnimatedPositioned(
            right: isVisible ? 172 : 20,
            bottom: isVisible ? 70 : null,
            duration: const Duration(milliseconds: 300),
            child: CustomPaint(
              painter: Sun(opacity: DataWidget.of(context).number),
            )),
      ],
    );
  }
}
