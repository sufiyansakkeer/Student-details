import 'package:flutter/material.dart';
import 'package:sample_2/core/constants.dart';
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
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Student Full Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF284350)),
                  ),
                ),
                kHight20,
                Text(
                  'Name: $name',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                kHight20,
                Text(
                  'Age: $age',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                kHight20,
                Text(
                  'Address: $address',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                kHight20,
                Text(
                  'Phone Number: $number',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                kHight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        label: const Text('Edit')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
