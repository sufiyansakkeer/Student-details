import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample_2/widgets/edit_student.dart';

class DisplayStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;

  final int index;
  const DisplayStudent({
    super.key,
    required this.name,
    required this.age,
    required this.address,
    required this.number,
    required this.index,

    // required String photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Student Full Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF284350)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Name: $name',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Age: $age',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Address: $address',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone Number: $number',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EditStudent(
                          name: name,
                          age: age,
                          address: address,
                          number: number,
                          index: index,
                        );
                      })));
                    }),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
