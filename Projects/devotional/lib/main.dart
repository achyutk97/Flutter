// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:stotram/data/data.dart' as input;

import 'package:stotram/models/first_model.dart';

import 'models/second_model.dart';

import 'dart:io' show Platform;
// Define the first model

// Define the second model

void main() {
  // Load JSON data
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Sample data

  // List<FirstModel> data = [];
  // Future<List<FirstModel>> fetchValues() async {
  //   data = await input.readJson();
  //   return data;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetchValues();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stotramala'),
        ),
        body: FutureBuilder<List<FirstModel>>(
          future: input.readJson(),
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
      ),
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
            margin: EdgeInsets.all(20.0),
            child: Container(
              width: 60,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/${data[index].imgLink}",
                      fit: BoxFit.cover,
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
  final double _minFontSize = 12.0;
  final double _maxFontSize = 130.0;
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
        padding: EdgeInsets.all(16.0),
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
                color: Colors.orangeAccent,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        widget.description,
                        style: TextStyle(fontSize: _fontSize),
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
