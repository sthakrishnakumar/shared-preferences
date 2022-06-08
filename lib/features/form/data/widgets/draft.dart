import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preference/features/form/data/data_sources/data_sources.dart';
import 'package:shared_preference/features/form/data/models/form_model.dart';
import 'package:shared_preference/features/form/data/widgets/edit_page.dart';

class Draft extends StatelessWidget {
  const Draft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draft Page'),
      ),
      body: Center(
        child: FutureBuilder<FormModel>(
          future: DataSource().getFormData(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Column(
                children: [
                  Text(snap.data!.name),
                  Text(snap.data!.address),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => EditPage(formModel: snap.data!),
                      ),
                    ),
                    child: const Text('Edit'),
                  ),
                ],
              );
            } else {
              return const Text('No Draft');
            }
          },
        ),
      ),
    );
  }
}
