import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/person_model.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  final List<Person> people = [
    Person(name: "sagnik1", description: "Boy"),
    Person(name: "sagnik2", description: "Boy"),
    Person(name: "sagnik3", description: "Boy"),
    Person(name: "sagnik4", description: "Boy"),
    Person(name: "sagnik5", description: "Boy"),
    Person(name: "sagnik6", description: "Boy"),
  ];

  // final List<String>names=["sagnik1","sagnik2","sagnik3","sagnik4","sagnik5","sagnik6",];
  // final List <String>description=["Boy","Boy","Boy","Boy","Boy","Boy","Boy",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(),
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    Text(people[index].name),
                    Text(people[index].description)
                  ],
                );


              },),
            ),
          ],
        ),
      ),
    );
  }
}
