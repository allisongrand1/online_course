import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:multiplatform_solutions/four_task/model/human_model.dart';

Future<List<HumanModel>> readJson() async {
  final String response =
      await rootBundle.loadString('assets/json/people.json');
  final peopleMap = await json.decode(response) as List;
  return peopleMap.map((human) => HumanModel.fromJson(human)).toList();
}
