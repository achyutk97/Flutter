import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Japamala extends StatefulWidget {
  @override
  State<Japamala> createState() => _JapamalaState();
}

class _JapamalaState extends State<Japamala> {
  static const int defaultValue = 0;
  int counter = defaultValue;
  int target = defaultValue;
  bool isTargetSet = false; // Flag to check if the target is set
  bool isFloatingActive = true;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Japamala'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.more_vert),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 243, 237, 237),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show TextField only if the target is not set
            if (!isTargetSet)
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter Japamala target",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  setState(() {
                    target = int.tryParse(value) ?? defaultValue;
                    counter =
                        defaultValue; // Reset the counter when target changes
                    isTargetSet = true; // Hide the TextField once target is set
                    isFloatingActive = false;
                  });
                },
              ),
            if (isTargetSet) ...[
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Japa: $counter",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Japamala Target: $target",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  counter < target
                      ? "Click on Below botton to increment the Japa"
                      : "Japamala target Reached!",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
              Center(
                child: IconButton(
                    onPressed: () {
                      isTargetSet = !isTargetSet;
                      isFloatingActive = true;
                      setState(() {});
                    },
                    icon: Icon(Icons.edit)),
              ),
              if (!isFloatingActive)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      print(counter);
                      if (counter < target - 1) {
                        counter++;
                      } else {
                        counter++;
                        isFloatingActive = !isFloatingActive;
                      }
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Icon(Icons.ads_click_sharp),
                  ),
                ),
            ]
          ],
        ),
      ), // Hide FAB if the target is not set
    );
  }
}
