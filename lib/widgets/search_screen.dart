import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sample_2/provider/provider_student.dart';
import 'package:sample_2/widgets/display_student_screen.dart';
import 'package:sample_2/widgets/students_list.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProviderStudent>(
      builder: ((context, value, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = value.studentDetails[index];
            if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const ListStudents();
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    // leading: CircleAvatar(
                    //   backgroundImage: FileImage(File(data.photo)),
                    // ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: value.studentDetails.length,
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<ProviderStudent>(
      builder: ((context, value, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = value.studentDetails[index];
            if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return DisplayStudent(
                              name: data.name,
                              age: data.age,
                              address: data.address,
                              number: data.phnNumber,
                              index: index,
                              // photo: data.photo
                            );
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    // leading: CircleAvatar(
                    //   backgroundImage: FileImage(File(data.photo)),
                    // ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: value.studentDetails.length,
        );
      }),
    );
  }
}
