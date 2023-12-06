import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class RegistrationForCooker extends StatefulWidget {
  @override
  _RegistrationForCookerState createState() => _RegistrationForCookerState();
}

class _RegistrationForCookerState extends State<RegistrationForCooker> {
  List<String> bangladeshiFoods = [
    'Biriyani',
    'Khichuri',
    'Hilsha Fish Curry',
    'Rasgulla',
    'Sandesh',
    'Mishti Doi',
    'Rasmalai',
    'Chomchom',
    'Malpua',
    'Pantua',
    'Kheer',
    'Fuchka (Pani Puri)',
    'Singara',
    'Mezban',
    'Tehari',
    'Morog Polao',
    'Chingri Bharta',
    'Panta Ilish',
    'Alu Posto',
    'Shingi Machh Bhapa',
    'Mochar Ghonto',
    'Shorshe Ilish Bhapa',
    'Shorshe Bata Diye Machh',
    'Aloo Dum',
    'Shorshe Maach',
    'Bhapa Ilish',
    'Chhanar Payesh',
    'Kalojam',
    'Begun Bhaja',
    'Sorshe Bhindi',
    'Mutton Curry',
    'Sorshe Ilish',
    'Rice',
    // Add more food items as needed
  ];

  List<String> selectedFoods = []; // Store the selected food items here

  void _showMultiSelect(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Bangladeshi Food'),
          content: Container(
            width: double.maxFinite, // Set a fixed width for the content
            height: 600, // Set a fixed height for the content
            child: ListView.builder(
              itemCount: bangladeshiFoods.length,
              itemBuilder: (context, index) {
                return MultiSelectChip(
                  [bangladeshiFoods[index]],
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedFoods = selectedList;
                    });
                  },
                  initialSelectedValues: selectedFoods,
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _showMultiSelect(context);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Select Bangladeshi Food',
                ),
                child: Text(selectedFoods.join(', ')),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle login button press
                    // You can add your desired login logic here
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle register button press
                    // You can add your desired register logic here
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;
  final List<String> initialSelectedValues;

  MultiSelectChip(this.reportList,
      {required this.onSelectionChanged, required this.initialSelectedValues});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    selectedChoices = widget.initialSelectedValues;
  }

  _buildChoiceList() {
    List<Widget> choices = [];

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
