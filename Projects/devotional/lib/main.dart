// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:stotram/data/data.dart' as input;

import 'package:stotram/models/first_model.dart';
import 'package:stotram/views/japamala.dart';
import 'package:stotram/views/settings.dart';

import 'models/second_model.dart';

import 'dart:io' show Platform;
// Define the first model

// Define the second model
Color selectedColor = Color(0xFF228B22);
void main() {
  // Load JSON data
  runApp(MaterialApp(
      title: 'Ghranth',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String contentLang = "Kannada";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> languages = ['Marathi', 'Kannada'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' ಗ್ರಂಥ ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Choose Language",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                contentLang = result;
              });
            },
            itemBuilder: (BuildContext context) {
              return languages
                  .where((lang) => lang != contentLang) // exclude current
                  .map((lang) => PopupMenuItem<String>(
                        value: lang,
                        child: Text(lang),
                      ))
                  .toList();
            },
            icon: const Icon(Icons.more_vert),
          ),
          GestureDetector(
            child: Icon(Icons.settings),
            onTap: () async {
              Color? picked = await showDialog<Color>(
                context: context,
                builder: (context) {
                  Color tempColor = selectedColor;
                  return AlertDialog(
                    title: Text('Pick a color'),
                    content: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8,
                        children: [
                          Colors.black, // Black
                          Color(0xFF000080), // Navy Blue
                          Color(0xFF4169E1), // Royal Blue
                          Color(0xFF006400), // Dark Green
                          Color(0xFF800000), // Maroon / Burgundy
                          Color(0xFF4B0082), // Deep Purple
                          Color(0xFF36454F), // Charcoal Gray
                          Color(0xFFDC143C), // Crimson
                          Color(0xFF008B8B), // Dark Cyan / Teal
                          Color(0xFF3F51B5), // Indigo
                          Color(0xFF2F4F4F), // Dark Slate Gray
                          Color(0xFF228B22), // Forest Green
                          Color(0xFF0F52BA), // Sapphire Blue
                          Color(
                              0xFFFF8C00), // Dark Orange // Dark Orange // Charcoal Gray – subtle but strong readability
                        ].map((color) {
                          return GestureDetector(
                            onTap: () {
                              tempColor = color;
                              Navigator.of(context).pop(color);
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              margin: EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: tempColor == color
                                      ? Colors.black
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              );
              if (picked != null) {
                setState(() {
                  selectedColor = picked;
                });
              }
            },
          )
        ],
        // backgroundColor: const Color.fromARGB(255, 243, 237, 237),
      ),
      body: FutureBuilder<List<FirstModel>>(
        future: input.readJson(contentLang),
        builder:
            (BuildContext context, AsyncSnapshot<List<FirstModel>> snapshot) {
          if (snapshot.data == []) {
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          } else {
            List<FirstModel> nonNullableList1 = snapshot.data ?? [];
            return GridView1(nonNullableList1);
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // print('Extended FAB Pressed');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Japamala()),
          );
        },
        icon: Icon(Icons.add),
        label: Text('Japamala'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget GridView1(List<FirstModel> snapshot) {
    var data = snapshot;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            Platform.isAndroid ? 2 : 4, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between columns
        mainAxisSpacing: 10, // Spacing between rows
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to new page showing all elements of the Second model
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondModelPage(
                  secondModels: data[index].secondModels,
                  title: data[index].name,
                ),
              ),
            );
          },
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/${data[index].imgLink}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data[index].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SecondModelPage extends StatelessWidget {
  final String title;
  final List<SecondModel> secondModels;

  const SecondModelPage(
      {super.key, required this.secondModels, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: secondModels.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: ListTile(
                title: Center(child: Text(secondModels[index].name)),
                subtitle: Center(child: Text(secondModels[index].author)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: secondModels[index].name,
                        author: secondModels[index]
                            .author, // Assuming we are showing the author of the first sub item
                        description: secondModels[index]
                            .description, // Assuming we are showing the description of the first sub item
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String title;
  final String author;
  final String description;

  const DetailPage(
      {super.key,
      required this.title,
      required this.author,
      required this.description});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _fontSize = 16.0; // Initial font size
  final double _minFontSize = 15.0;
  final double _maxFontSize = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                '${widget.author}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Card(
                color: selectedColor,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        widget.description,
                        style:
                            TextStyle(fontSize: _fontSize, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Slider(
              value: _fontSize,
              min: _minFontSize,
              max: _maxFontSize,
              onChanged: (newValue) {
                setState(() {
                  _fontSize = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
