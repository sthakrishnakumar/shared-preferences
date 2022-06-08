import 'package:flutter/material.dart';
import 'package:shared_preference/features/form/data/models/form_model.dart';
import 'package:shared_preference/features/form/data/service/service.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key, required this.formModel}) : super(key: key);
  FormModel formModel;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: formModel.name);
    final addressController = TextEditingController(text: formModel.address);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.grey[200],
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.grey[200],
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Address',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final FormModel formModel = FormModel(
                  name: nameController.text,
                  address: addressController.text,
                );
                await Service().saveData(data: formModel.toJson());
              },
              child: const Text('Save to DB'),
            ),
          ],
        ),
      ),
    );
  }
}
