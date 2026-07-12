import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;

// IMPORTANT: This file assumes you have added the 'intl' package to your pubspec.yaml file.
// To fix the "intl" errors, please add the following line to your dependencies section
// in pubspec.yaml and run "flutter pub get":
//
// dependencies:
//   flutter:
//     sdk: flutter
//   http: ^1.1.0
//   intl: ^0.18.1
//
// The 'http' package is already in your code, but it's good practice to list it here as well.

class Panchanga extends StatefulWidget {
  String contentLang = "Hindi"; // Default language
  Panchanga({super.key, required this.contentLang});

  @override
  State<Panchanga> createState() => _PanchangaState();
}

class _PanchangaState extends State<Panchanga> {
  // Store the selected date
  DateTime _selectedDate = DateTime.now();

  // The Future for the API call
  late Future<Map<String, dynamic>> _panchangaDataFuture;

  @override
  void initState() {
    super.initState();
    _panchangaDataFuture = loadPanchangaFromAssets(_selectedDate);
  }

  // // Fetches Panchanga data for a given date
  // Future<Map<String, dynamic>> fetchPanchangaData(DateTime date) async {
  //   final formattedDate = DateFormat('dd-MM-yyyy').format(date);
  //   String queryLang = "en"; // Default to English
  //   print("Content Language: ${widget.contentLang}");
  //   if (widget.contentLang == "Kannada") {
  //     queryLang = "ka";
  //   } else if (widget.contentLang == "Marathi") {
  //     queryLang = 'mr';
  //   } else {
  //     queryLang = "en";
  //   }
  //   final url = Uri.parse(
  //       'http://192.168.1.5:8000/panchanga/$formattedDate?language=$queryLang');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = jsonDecode(response.body);
  //     print(data); // For debugging
  //     return data;
  //   } else {
  //     throw Exception('Failed to load Panchanga data for $formattedDate');
  //   }
  // }

  Future<Map<String, dynamic>> loadPanchangaFromAssets(DateTime date) async {
    final dateKey = DateFormat('dd-MM-yyyy').format(date);

    // Map contentLang → JSON key
    String langKey = "en";
    if (widget.contentLang == "Kannada") langKey = "ka";
    if (widget.contentLang == "Marathi") langKey = "mr";

    const assetPath = "assets/json/panchanga/panchang_table_details.json";

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonData = jsonDecode(jsonString);

      if (!jsonData.containsKey(langKey)) {
        throw Exception("Language not available: $langKey");
      }

      final langData = jsonData[langKey];

      if (!langData.containsKey(dateKey)) {
        throw Exception("Date not found: $dateKey");
      }

      return {dateKey: langData[dateKey]};
    } catch (e) {
      throw Exception("Error loading Panchanga: $e");
    }
  }

  // Shows the date picker and updates the state
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2030, 12),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Trigger a new future for the FutureBuilder
        _panchangaDataFuture = loadPanchangaFromAssets(_selectedDate);
      });
    }
  }

  // Go to the previous day
  void _goToPreviousDay() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
      _panchangaDataFuture = loadPanchangaFromAssets(_selectedDate);
    });
  }

  // Go to the next day
  void _goToNextDay() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
      _panchangaDataFuture = loadPanchangaFromAssets(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme's brightness
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Define colors for dark theme
    final backgroundColor = isDarkMode ? Colors.grey.shade900 : Colors.white;
    final appBarColor = isDarkMode ? Colors.grey.shade800 : Colors.blue;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final headingColor = isDarkMode ? Colors.white : Colors.black;
    final tableBorderColor =
        isDarkMode ? Colors.grey.shade600 : Colors.grey.shade700;
    final tableInsideBorderColor =
        isDarkMode ? Colors.grey.shade700 : Colors.grey.shade400;
    // Changed `shade850` to `shade800` to resolve the error.
    final zebraStripeColor1 =
        isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;
    final zebraStripeColor2 =
        isDarkMode ? Colors.grey.shade800 : Colors.grey.shade100;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Panchanga'),
        backgroundColor: appBarColor,
        foregroundColor: textColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Date Picker and Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous Day Button
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _goToPreviousDay,
                  color: textColor,
                ),
                const SizedBox(width: 8),
                // Date Picker Button
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDarkMode ? Colors.blueGrey.shade700 : Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    'Select Date: ${DateFormat('dd MMM yyyy').format(_selectedDate)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 8),
                // Next Day Button
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _goToNextDay,
                  color: textColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // FutureBuilder to display data
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _panchangaDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(color: textColor));
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(color: textColor)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No data found',
                            style: TextStyle(color: textColor)));
                  }

                  final data = snapshot.data!;
                  final dateKey = data.keys.first;
                  final dateData = data[dateKey] as Map<String, dynamic>;

                  return Column(
                    children: [
                      // Date Heading
                      Text(
                        dateKey,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: headingColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Table
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: tableBorderColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(3),
                            },
                            border: TableBorder.symmetric(
                              inside: BorderSide(color: tableInsideBorderColor),
                              outside: BorderSide(color: tableBorderColor),
                            ),
                            children: dateData.entries
                                .toList()
                                .asMap()
                                .entries
                                .map((entry) {
                              int idx = entry.key;
                              var row = entry.value;
                              return TableRow(
                                decoration: BoxDecoration(
                                  color: idx % 2 == 0
                                      ? zebraStripeColor1
                                      : zebraStripeColor2,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      row.key,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      row.value.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
