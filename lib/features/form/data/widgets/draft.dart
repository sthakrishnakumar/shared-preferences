import 'package:flutter/material.dart';
import 'package:shared_preference/features/form/data/models/form_model.dart';
import 'package:shared_preference/features/form/data/service/service.dart';

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
          future: Service().getData(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Column(
                children: [
                  Text(snap.data!.name.toString()),
                  Text(snap.data!.address.toString()),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
