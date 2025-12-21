import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:grantha/models/first_model.dart';
import 'package:grantha/models/second_model.dart';

const String jsonUrl =
    'https://drive.usercontent.google.com/u/0/uc?id=1Mybf_QsUKnYRgfacSBbXxhGVKeESRr05&export=download';

Future<File> _getLocalJsonFile() async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/merged_file.json');
}

Future<Map<String, dynamic>> loadJsonData() async {
  final file = await _getLocalJsonFile();

  // ✅ Use local file if exists
  if (await file.exists()) {
    final bytes = await file.readAsBytes();
    return jsonDecode(utf8.decode(bytes));
  }

  // ⬇ Download only once
  final response = await http.get(Uri.parse(jsonUrl));

  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to download JSON');
  }
}

Future<List<FirstModel>> readJson(String lang) async {
  List<FirstModel> data = [];

  final Map<String, dynamic> jsonData = await loadJsonData();

  final List mainCategories = jsonData[lang]['mainCategories'];

  for (final Map<String, dynamic> firstModel in mainCategories) {
    for (final key in firstModel.keys) {
      final category = firstModel[key];
      final List<SecondModel> secondModelList = [];

      for (final secondModel in category['subCategories']) {
        secondModelList.add(
          SecondModel(
            name: secondModel['name'],
            author: secondModel['author'],
            description: secondModel['description'],
          ),
        );
      }

      data.add(
        FirstModel(
          name: category['name'],
          imgLink: category['imgLink'],
          secondModels: secondModelList,
        ),
      );
    }
  }

  return data;
}


Future<void> forceRefreshJson() async {
  final file = await _getLocalJsonFile();
  print("Here");
  // 🗑 Delete cached file if exists
  if (await file.exists()) {
    await file.delete();
  }
  // final url = 'https://drive.usercontent.google.com/u/0/uc?id=14eHJoILRjXkeu0G32D1R7Q4LonAk61Li&export=download';
  // ⬇ Download fresh copy
  final response = await http.get(Uri.parse(jsonUrl));
  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);
  } else {
    throw Exception('Failed to refresh JSON');
  }
}

// Future<List<FirstModel>> readJson(String lang) async {
//   List<FirstModel> data = [];
//   // Load JSON data
//   Map<String, dynamic> jsonData = await loadJsonData();
//   // print(jsonData['mainCategories'][0]['name']);

//   for (Map<String, dynamic> firstModel in jsonData[lang]['mainCategories']) {
//     List<SecondModel> secondModelList = [];

//     for (var i in firstModel.keys) {
//       for (var secondModel in firstModel[i]['subCategories']) {
//         var secondModelData = SecondModel(
//             name: secondModel['name'],
//             author: secondModel['author'],
//             description: secondModel['description']);
//         secondModelList.add(secondModelData);
//       }
//       var value1 = FirstModel(
//         name: firstModel[i]['name'],
//         imgLink: firstModel[i]['imgLink'],
//         secondModels: secondModelList,
//       );
//       data.add(value1);
//     }
//   }
//   return data;
// }
