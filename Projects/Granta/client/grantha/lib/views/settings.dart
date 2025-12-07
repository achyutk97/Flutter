import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings Page",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 100),
                Text(
                  "Choose Color",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 16),
                Wrap(
                  spacing: 8,
                  children: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.orange,
                    Colors.purple,
                    Colors.yellow,
                    Colors.teal,
                    Colors.brown,
                  ].map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == color
                                ? Colors.black
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: selectedColor,
        onPressed: () async {
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
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.orange,
                      Colors.purple,
                      Colors.yellow,
                      Colors.teal,
                      Colors.brown,
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
        child: Icon(Icons.color_lens),
        tooltip: 'Pick a color',
      ),
    );
  }
}
