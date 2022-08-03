import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<A> _list = [
    A("Ahmad", "teacher"),
    A("Mahmood", "cook"),
    A("Kamal", "doctor"),
    A("Jamal", "cook"),
    A("Ahmad", "cook"),
    A("Mahmood", "teacher"),
    A("Khalid", "doctor"),
    A("Ahmad", "pilot"),
  ];

  late List<A> _variableList = _list;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  _variableList = _list
                      .where((element) =>
                          element.name.contains(value) || element.job.contains(value))
                      .toList();
                  setState(() {});
                },
              ),
              Expanded(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: List.generate(
                    _variableList.length,
                    (index) => Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Text(_variableList[index].name),
                          Text(_variableList[index].job),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class A {
  final String name;
  final String job;

  A(this.name, this.job);
}
