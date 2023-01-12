import 'package:advanced_widget/main.dart';
import 'package:advanced_widget/pages/appBar/appBar.dart';
import 'package:advanced_widget/pages/renderObject.dart';
import 'package:advanced_widget/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
    textController.addListener(_changeNumber);
  }

  _changeNumber() {
    setState(() {
      textController.text == ''
          ? DataWidget.of(context).number
          : DataWidget.of(context).number = double.parse(textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: CustomTheme.isDarkTheme
                    ? CustomTheme.darkTheme.colorScheme.secondary
                    : CustomTheme.lightTheme.colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                      color: CustomTheme.isDarkTheme
                          ? AppColors.black
                          : AppColors.white,
                      offset: const Offset(-5, -5),
                      spreadRadius: 1,
                      blurRadius: 15),
                  BoxShadow(
                      color: CustomTheme.isDarkTheme
                          ? CustomTheme.darkTheme.colorScheme.onPrimary
                          : CustomTheme.lightTheme.colorScheme.onPrimary
                              .withOpacity(0.6),
                      offset: const Offset(5, 5),
                      spreadRadius: 1,
                      blurRadius: 15),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      child: BodyText(
                          blur: 5,
                          color: CustomTheme.isDarkTheme
                              ? AppColors.textdark
                              : AppColors.textlight,
                          offset: const Offset(5, 5),
                          child: const Text(
                            'Введите число от 0 до 1',
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: SizedBox(
                      width: 100,
                      child: TextFormField(
                        style: TextStyle(
                            color: CustomTheme.isDarkTheme
                                ? CustomTheme.darkTheme.textTheme
                                    .apply()
                                    .bodyMedium!
                                    .color
                                : CustomTheme.lightTheme.textTheme
                                    .apply()
                                    .bodyMedium!
                                    .color),
                        keyboardType: TextInputType.number,
                        controller: textController,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SheetAppBar(),
        ],
      ),
    ));
  }
}
