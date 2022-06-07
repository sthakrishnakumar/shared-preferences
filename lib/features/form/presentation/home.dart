import 'package:flutter/material.dart';
import 'package:shared_preference/features/form/data/models/form_model.dart';
import 'package:shared_preference/features/form/data/service/service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController nameController;
  late TextEditingController addressController;

  @override
  void initState() {
    nameController = TextEditingController();
    addressController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Storage'),
      ),
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
                    name: nameController.text, address: addressController.text);
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
