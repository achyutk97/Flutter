import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Define the first model
class FirstModel {
  String name;
  String imgLink;
  List<SecondModel> secondModels;

  FirstModel(
      {required this.name, required this.imgLink, required this.secondModels});
}

// Define the second model
class SecondModel {
  String name;
  String author;
  String description;

  SecondModel(
      {required this.name, required this.author, required this.description});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample data
  final List<FirstModel> data = [
    FirstModel(
      name: "Raghavendra Tirtha",
      imgLink:
          "https://i1.sndcdn.com/artworks-VezeTEHcR5agYPj6-Wzmz0Q-t500x500.jpg",
      secondModels: [
        SecondModel(
          name: "॥ ಶ್ರೀರಾಘವೇನ್ದ್ರಸ್ತೋತ್ರಮ್ ॥",
          author: "ಅಪ್ಪಣ್ಣಾಚಾರ್ಯ",
          description: """
ಶ್ರೀಪೂರ್ಣಬೋಧಗುರುತೀರ್ಥಪಯೋಬ್ಧಿಪಾರಾ ಕಾಮಾರಿಮಾಕ್ಷವಿಷಮಾಕ್ಷಶಿರಃ ಸ್ಪೃಶನ್ತೀ ।
ಪೂರ್ವೋತ್ತರಾಮಿತತರಂಗಚರತ್ಸುಹಂಸಾ ದೇವಾಳಿಸೇವಿತಪರಾಂಘ್ರಿಪಯೋಜಲಗ್ನಾ ॥ 1॥

ಜೀವೇಶಭೇದಗುಣಪೂರ್ತಿಜಗತ್ಸುಸತ್ತ್ವ ನೀಚೋಚ್ಚಭಾವಮುಖನಕ್ರಗಣೈಃ ಸಮೇತಾ ।
ದುರ್ವಾದ್ಯಜಾಪತಿಗಿಳೈರ್ಗುರುರಾಘವೇನ್ದ್ರವಾಗ್ದೇವತಾಸರಿದಮುಂ ವಿಮಲೀಕರೋತು ॥ 2॥

ಶ್ರೀರಾಘವೇನ್ದ್ರಃ ಸಕಲಪ್ರದಾತಾ ಸ್ವಪಾದಕಂಜದ್ವಯಭಕ್ತಿಮದ್ಭ್ಯಃ ।
ಅಘಾದ್ರಿಸಮ್ಭೇದನದೃಷ್ಟಿವಜ್ರಃ ಕ್ಷಮಾಸುರೇನ್ದ್ರೋಽವತು ಮಾಂ ಸದಾಽಯಮ್ ॥ 3॥

ಶ್ರೀರಾಘವೇನ್ದ್ರೋಹರಿಪಾದಕಂಜನಿಷೇವಣಾಲ್ಲಬ್ಧಸಮಸ್ತಸಮ್ಪತ್ ।
ದೇವಸ್ವಭಾವೋ ದಿವಿಜದ್ರುಮೋಽಯಮಿಷ್ಟಪ್ರದೋ ಮೇ ಸತತಂ ಸ ಭೂಯಾತ್ ॥ 4॥

ಭವ್ಯಸ್ವರೂಪೋ ಭವದುಃಖತೂಲಸಂಘಾಗ್ನಿಚರ್ಯಃ ಸುಖಧೈರ್ಯಶಾಲೀ ।
ಸಮಸ್ತದುಷ್ಟಗ್ರಹನಿಗ್ರಹೇಶೋ ದುರತ್ಯಯೋಪಪ್ಲವಸಿನ್ಧುಸೇತುಃ ॥ 5॥

ನಿರಸ್ತದೋಷೋ ನಿರವದ್ಯವೇಷಃ ಪ್ರತ್ಯರ್ಥಿಮೂಕತ್ತ್ವನಿದಾನಭಾಷಃ ।
ವಿದ್ವತ್ಪರಿಜ್ಞೇಯಮಹಾವಿಶೇಷೋ ವಾಗ್ವೈಖರೀನಿರ್ಜಿತಭವ್ಯಶೇಷಃ ॥ 6॥

ಸನ್ತಾನಸಮ್ಪತ್ಪರಿಶುದ್ಧಭಕ್ತಿವಿಜ್ಞಾನವಾಗ್ದೇಹಸುಪಾಟವಾದೀನ್ ।
ದತ್ತ್ವಾ ಶರೀರೋತ್ಥಸಮಸ್ತದೋಷಾನ್ ಹತ್ತ್ವಾ ಸ ನೋಽವ್ಯಾದ್ಗುರುರಾಘವೇನ್ದ್ರಃ ॥ 7॥

ಯತ್ಪಾದೋದಕಸಂಚಯಃ ಸುರನದೀಮುಖ್ಯಾಪಗಾಸಾದಿತಾ-
ಸಂಖ್ಯಾಽನುತ್ತಮಪುಣ್ಯಸಂಘವಿಲಸತ್ಪ್ರಖ್ಯಾತಪುಣ್ಯಾವಹಃ ।
ದುಸ್ತಾಪತ್ರಯನಾಶನೋ ಭುವಿ ಮಹಾ ವನ್ಧ್ಯಾಸುಪುತ್ರಪ್ರದೋ
ವ್ಯಂಗಸ್ವಂಗಸಮೃದ್ಧಿದೋ ಗ್ರಹಮಹಾಪಾಪಾಪಹಸ್ತಂ ಶ್ರಯೇ ॥ 8॥

ಯತ್ಪಾದಕಂಜರಜಸಾ ಪರಿಭೂಷಿತಾಂಗಾ ಯತ್ಪಾದಪದ್ಮಮಧುಪಾಯಿತಮಾನಸಾ ಯೇ ।
ಯತ್ಪಾದಪದ್ಮಪರಿಕೀರ್ತನಜೀರ್ಣವಾಚಸ್ತದ್ದರ್ಶನಂ ದುರಿತಕಾನನದಾವಭೂತಮ್ ॥ 9॥

ಸರ್ವತನ್ತ್ರಸ್ವತನ್ತ್ರೋಽಸೌ ಶ್ರೀಮಧ್ವಮತವರ್ಧನಃ ।
ವಿಜಯೀನ್ದ್ರಕರಾಬ್ಜೋತ್ಥಸುಧೀನ್ದ್ರವರಪುತ್ರಕಃ ।
ಶ್ರೀರಾಘವೇನ್ದ್ರೋ ಯತಿರಾಟ್ ಗುರುರ್ಮೇ ಸ್ಯಾದ್ಭಯಾಪಹಃ ॥ 10॥

ಜ್ಞಾನಭಕ್ತಿಸುಪುತ್ರಾಯುಃ ಯಶಃ ಶ್ರೀಪುಣ್ಯವರ್ಧನಃ ।
ಪ್ರತಿವಾದಿಜಯಸ್ವಾನ್ತಭೇದಚಿಹ್ನಾದರೋ ಗುರುಃ ।
ಸರ್ವವಿದ್ಯಾಪ್ರವೀಣೋಽನ್ಯೋ ರಾಘವೇನ್ದ್ರಾನ್ನವಿದ್ಯತೇ ॥ 11॥

ಅಪರೋಕ್ಷೀಕೃತಶ್ರೀಶಃ ಸಮುಪೇಕ್ಷಿತಭಾವಜಃ ।
ಅಪೇಕ್ಷಿತಪ್ರದಾತಾಽನ್ಯೋ ರಾಘವೇನ್ದ್ರಾನ್ನವಿದ್ಯತೇ ॥ 12॥

ದಯಾದಾಕ್ಷಿಣ್ಯವೈರಾಗ್ಯವಾಕ್ಪಾಟವಮುಖಾಂಕಿತಃ ।
ಶಾಪಾನುಗ್ರಹಶಕ್ತೋಽನ್ಯೋ ರಾಘವೇನ್ದ್ರಾನ್ನವಿದ್ಯತೇ ॥ 13॥

ಅಜ್ಞಾನವಿಸ್ಮೃತಿಭ್ರಾನ್ತಿಸಂಶಯಾಪಸ್ಮೃತಿಕ್ಷಯಾಃ ।
ತನ್ದ್ರಾಕಮ್ಪವಚಃಕೌಂಠ್ಯಮುಖಾ ಯೇ ಚೇನ್ದ್ರಿಯೋದ್ಭವಾಃ ।
ದೋಷಾಸ್ತೇ ನಾಶಮಾಯಾನ್ತಿ ರಾಘವೇನ್ದ್ರಪ್ರಸಾದತಃ ॥ 14॥

`ಓಂ ಶ್ರೀ ರಾಘವೇನ್ದ್ರಾಯ ನಮಃ '  ಇತ್ಯಷ್ಟಾಕ್ಷರಮನ್ತ್ರತಃ ।
ಜಪಿತಾದ್ಭಾವಿತಾನ್ನಿತ್ಯಂ ಇಷ್ಟಾರ್ಥಾಃ ಸ್ಯುರ್ನಸಂಶಯಃ ॥ 15॥

ಹನ್ತು ನಃ ಕಾಯಜಾನ್ದೋಷಾನಾತ್ಮಾತ್ಮೀಯಸಮುದ್ಭವಾನ್ ।
ಸರ್ವಾನಪಿ ಪುಮರ್ಥಾಂಶ್ಚ ದದಾತು ಗುರುರಾತ್ಮವಿತ್ ॥ 16॥

ಇತಿ ಕಾಲತ್ರಯೇ ನಿತ್ಯಂ ಪ್ರಾರ್ಥನಾಂ ಯಃ ಕರೋತಿ ಸಃ ।
ಇಹಾಮುತ್ರಾಪ್ತಸರ್ವೇಷ್ಟೋ ಮೋದತೇ ನಾತ್ರ ಸಂಶಯಃ ॥ 17॥

ಅಗಮ್ಯಮಹಿಮಾ ಲೋಕೇ ರಾಘವೇನ್ದ್ರೋ ಮಹಾಯಶಾಃ ।
ಶ್ರೀಮಧ್ವಮತದುಗ್ಧಾಬ್ಧಿಚನ್ದ್ರೋಽವತು ಸದಾಽನಘಃ ॥ 18॥

ಸರ್ವಯಾತ್ರಾಫಲಾವಾಪ್ತ್ಯೈ ಯಥಾಶಕ್ತಿಪ್ರದಕ್ಷಿಣಮ್ ।
ಕರೋಮಿ ತವ ಸಿದ್ಧಸ್ಯ ವೃನ್ದಾವನಗತಂ ಜಲಮ್ ।
ಶಿರಸಾ ಧಾರಯಾಮ್ಯದ್ಯ ಸರ್ವತೀರ್ಥಫಲಾಪ್ತಯೇ ॥ 19॥

ಸರ್ವಾಭೀಷ್ಟಾರ್ಥಸಿದ್ಧ್ಯರ್ಥಂ ನಮಸ್ಕಾರಂ ಕರೋಮ್ಯಹಮ್ ।
ತವ ಸಂಕೀರ್ತನಂ ವೇದಶಾಸ್ತ್ರಾರ್ಥಜ್ಞಾನಸಿದ್ಧಯೇ ॥ 20॥

ಸಂಸಾರೇಽಕ್ಷಯಸಾಗರೇ ಪ್ರಕೃತಿತೋಽಗಾಧೇ ಸದಾ ದುಸ್ತರೇ ।
ಸರ್ವಾವದ್ಯಜಲಗ್ರಹೈರನುಪಮೈಃ ಕಾಮಾದಿಭಂಗಾಕುಲೇ ।
ನಾನಾವಿಭ್ರಮದುರ್ಭ್ರಮೇಽಮಿತಭಯಸ್ತೋಮಾದಿಫೇನೋತ್ಕಟೇ ।
ದುಃಖೋತ್ಕೃಷ್ಟವಿಷೇ ಸಮುದ್ಧರ ಗುರೋ ಮಾ ಮಗ್ನರೂಪಂ ಸದಾ ॥ 21॥

ರಾಘವೇನ್ದ್ರಗುರುಸ್ತೋತ್ರಂ ಯಃ ಪಠೇದ್ಭಕ್ತಿಪೂರ್ವಕಮ್ ।
ತಸ್ಯ ಕುಷ್ಠಾದಿರೋಗಾಣಾಂ ನಿವೃತ್ತಿಸ್ತ್ವರಯಾ ಭವೇತ್ ॥ 22॥

ಅನ್ಧೋಽಪಿ ದಿವ್ಯದೃಷ್ಟಿಃ ಸ್ಯಾದೇಡಮೂಕೋಽಪಿ ವಾಗ್ಪತಿಃ ।
ಪೂರ್ಣಾಯುಃ ಪೂರ್ಣಸಮ್ಪತ್ತಿಃ ಸ್ತೋತ್ರಸ್ಯಾಸ್ಯ ಜಪಾದ್ಭವೇತ್ ॥ 23॥

ಯಃ ಪಿಬೇಜ್ಜಲಮೇತೇನ ಸ್ತೋತ್ರೇಣೈವಾಭಿಮನ್ತ್ರಿತಮ್ ।
ತಸ್ಯ ಕುಕ್ಷಿಗತಾ ದೋಷಾಃ ಸರ್ವೇ ನಶ್ಯನ್ತಿ ತತ್ಕ್ಷಣಾತ್ ॥ 24॥

ಯದ್ವೃನ್ದಾವನಮಾಸಾದ್ಯ ಪಂಗುಃ ಖಂಜೋಽಪಿ ವಾ ಜನಃ ।
ಸ್ತೋತ್ರೇಣಾನೇನ ಯಃ ಕುರ್ಯಾತ್ಪ್ರದಕ್ಷಿಣನಮಸ್ಕೃತಿ ।
ಸ ಜಂಘಾಲೋ ಭವೇದೇವ ಗುರುರಾಜಪ್ರಸಾದತಃ ॥ 25॥

ಸೋಮಸೂರ್ಯೋಪರಾಗೇ ಚ ಪುಷ್ಯಾರ್ಕಾದಿಸಮಾಗಮೇ ।
ಯೋಽನುತ್ತಮಮಿದಂ ಸ್ತೋತ್ರಮಷ್ಟೋತ್ತರಶತಂ ಜಪೇತ್ ।
ಭೂತಪ್ರೇತಪಿಶಾಚಾದಿಪೀಡಾ ತಸ್ಯ ನ ಜಾಯತೇ ॥ 26॥

ಏತತ್ಸ್ತೋತ್ರಂ ಸಮುಚ್ಚಾರ್ಯ ಗುರೋರ್ವೃನ್ದಾವನಾನ್ತಿಕೇ ।
ದೀಪಸಂಯೋಜನಾಜ್ಞಾನಂ ಪುತ್ರಲಾಭೋ ಭವೇದ್ಧ್ರುವಮ್ ॥ 27॥

ಪರವಾದಿಜಯೋ ದಿವ್ಯಜ್ಞಾನಭಕ್ತ್ಯಾದಿವರ್ಧನಮ್ ।
ಸರ್ವಾಭೀಷ್ಟಪ್ರವೃದ್ಧಿಸ್ಸ್ಯಾನ್ನಾತ್ರ ಕಾರ್ಯಾ ವಿಚಾರಣಾ ॥ 28॥

ರಾಜಚೋರಮಹಾವ್ಯಾಘ್ರಸರ್ಪನಕ್ರಾದಿಪೀಡನಮ್ ।
ನ ಜಾಯತೇಽಸ್ಯ ಸ್ತೋತ್ರಸ್ಯ ಪ್ರಭಾವಾನ್ನಾತ್ರ ಸಂಶಯಃ ॥ 29॥

ಯೋ ಭಕ್ತ್ಯಾ ಗುರುರಾಘವೇನ್ದ್ರಚರಣದ್ವನ್ದ್ವಂ ಸ್ಮರನ್ ಯಃ ಪಠೇತ್ ।
ಸ್ತೋತ್ರಂ ದಿವ್ಯಮಿದಂ ಸದಾ ನಹಿ ಭವೇತ್ತಸ್ಯಾಸುಖಂ ಕಿಂಚನ ।
ಕಿಂ ತ್ವಿಷ್ಟಾರ್ಥಸಮೃದ್ಧಿರೇವ ಕಮಲಾನಾಥಪ್ರಸಾದೋದಯಾತ್ ।
ಕೀರ್ತಿರ್ದಿಗ್ವಿದಿತಾ ವಿಭೂತಿರತುಲಾ ಸಾಕ್ಷೀ ಹಯಾಸ್ಯೋಽತ್ರ ಹಿ ॥ 30॥

ಇತಿ ಶ್ರೀ ರಾಘವೇನ್ದ್ರಾರ್ಯ ಗುರುರಾಜಪ್ರಸಾದತಃ ।
ಕೃತಂ ಸ್ತೋತ್ರಮಿದಂ ಪುಣ್ಯಂ ಶ್ರೀಮದ್ಭಿರ್ಹ್ಯಪ್ಪಣಾಭಿದೈಃ ॥ 31॥

ಇತಿ ಶ್ರೀ ಅಪ್ಪಣ್ಣಾಚಾರ್ಯವಿರಚಿತಂ
ಶ್ರೀರಾಘವೇನ್ದ್ರಸ್ತೋತ್ರಂ ಸಮ್ಪೂರ್ಣಮ್

॥ ಶ್ರೀಕೃಷ್ಣಾರ್ಪಣಮಸ್ತು ॥
""",
        ),
        SecondModel(
          name: "Sub Item 2",
          author: "Author 2",
          description: "Description 2",
        ),
      ],
    ),
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
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
                    builder: (context) =>
                        SecondModelPage(secondModels: data[index].secondModels),
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
                        child: Image.network(
                          data[index].imgLink,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondModelPage extends StatelessWidget {
  final List<SecondModel> secondModels;

  const SecondModelPage({super.key, required this.secondModels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Model Details'),
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
        title: Text('Detail Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${widget.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '${widget.author}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Card(
                  color: Colors.orangeAccent,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
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
