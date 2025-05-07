import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMRScreen extends StatefulWidget {
  const BMRScreen({super.key});

  @override
  _BMRPageState createState() => _BMRPageState();
}

class _BMRPageState extends State<BMRScreen> {
  String gender = 'male';
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? bmrResult;

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  Future<void> loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = prefs.getString('gender') ?? 'male';
      weightController.text = prefs.getString('weight') ?? '';
      heightController.text = prefs.getString('height') ?? '';
      ageController.text = prefs.getString('age') ?? '';
      bmrResult = prefs.getString('bmr');
    });
  }

  Future<void> saveData(String bmr) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
    await prefs.setString('weight', weightController.text);
    await prefs.setString('height', heightController.text);
    await prefs.setString('age', ageController.text);
    await prefs.setString('bmr', bmr);
  }

  void calculateBMR() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);
    final int? age = int.tryParse(ageController.text);

    if (weight != null && height != null && age != null) {
      double bmr;
      if (gender == 'male') {
        bmr = 10 * weight + 6.25 * height - 5 * age + 5;
      } else {
        bmr = 10 * weight + 6.25 * height - 5 * age - 161;
      }

      String result = bmr.toStringAsFixed(2);
      setState(() {
        bmrResult = result;
      });
      saveData(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('BMR Calculator'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Calculate your Basal Metabolic Rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: gender,
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items:
                  ['male', 'female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value[0].toUpperCase() + value.substring(1)),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age (years)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: calculateBMR,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Calculate BMR'),
              ),
            ),
            SizedBox(height: 24),
            if (bmrResult != null)
              Center(
                child: Text(
                  'Your BMR is: $bmrResult kcal/day',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal[800],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
