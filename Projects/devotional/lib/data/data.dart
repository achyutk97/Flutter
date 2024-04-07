import 'package:stotram/models/first_model.dart';
import 'package:stotram/models/second_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// Function to load and parse JSON
Future<Map<String, dynamic>> loadJsonData() async {
  // Load JSON file as String
  String jsonString = await rootBundle.loadString('assets/json/data1.json');

  // Parse JSON string
  Map<String, dynamic> data = jsonDecode(jsonString);

  return data;
}

Future<List<FirstModel>> readJson() async {
  List<FirstModel> data = [];
  // Load JSON data
  Map<String, dynamic> jsonData = await loadJsonData();
  // print(jsonData['mainCategories'][0]['name']);

  for (Map<String, dynamic> firstModel in jsonData['mainCategories']) {
    List<SecondModel> secondModelList = [];

    for (var i in firstModel.keys) {
      for (var secondModel in firstModel[i]['subCategories']) {
        var secondModelData = SecondModel(
            name: secondModel['name'],
            author: secondModel['author'],
            description: secondModel['description']);
        secondModelList.add(secondModelData);
      }
      var value1 = FirstModel(
        name: firstModel[i]['name'],
        imgLink: firstModel[i]['imgLink'],
        secondModels: secondModelList,
      );
      data.add(value1);
    }
  }
  return data;
}
