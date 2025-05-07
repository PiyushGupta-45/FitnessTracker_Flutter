import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalizedGoalsScreen extends StatefulWidget {
  const PersonalizedGoalsScreen({super.key});

  @override
  _PersonalizedGoalsScreenState createState() =>
      _PersonalizedGoalsScreenState();
}

class _PersonalizedGoalsScreenState extends State<PersonalizedGoalsScreen> {
  final TextEditingController _goalController = TextEditingController();
  final List<String> _goals = [];

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _goals.addAll(prefs.getStringList('goals') ?? []);
    });
  }

  Future<void> _saveGoals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('goals', _goals);
  }

  void _addGoal() {
    if (_goalController.text.trim().isEmpty) return;
    setState(() {
      _goals.add(_goalController.text.trim());
      _goalController.clear();
    });
    _saveGoals();
  }

  void _editGoal(int index) {
    _goalController.text = _goals[index];
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Edit Goal'),
            content: TextField(
              controller: _goalController,
              decoration: InputDecoration(hintText: 'Enter your goal'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _goalController.clear();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _goals[index] = _goalController.text.trim();
                    _goalController.clear();
                  });
                  Navigator.pop(context);
                  _saveGoals();
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
    _saveGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personalized Goals'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _goalController,
                    decoration: InputDecoration(
                      hintText: 'Enter your goal',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _addGoal, child: Text('Add')),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child:
                  _goals.isEmpty
                      ? Center(child: Text('No goals added yet.'))
                      : ListView.builder(
                        itemCount: _goals.length,
                        itemBuilder:
                            (context, index) => Card(
                              child: ListTile(
                                title: Text(_goals[index]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () => _editGoal(index),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteGoal(index),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
