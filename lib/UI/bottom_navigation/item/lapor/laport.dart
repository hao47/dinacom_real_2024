import 'dart:io';

import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/image_upload_service.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';


class Lapor extends StatefulWidget {
   Lapor({super.key});

  @override
  State<Lapor> createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
   PoranProvider uploadService = PoranProvider();

   XFile? pickedFile;

   TextEditingController _ditujukancontroller = TextEditingController();

   TextEditingController _contentcontroller = TextEditingController();

   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {

          Provider.of<PoranProvider>(context, listen: false).profile();

          Navigator.pop(context);
        }, icon: Icon(Icons.close,)),


        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {

                if(pickedFile != null){

                  uploadService.uploadImage(pickedFile);

                }
              },
              child: Text("unggah",style: CommonAppTheme.textTheme(context).headline1!.copyWith(
                color: ColorValue.secondaryColor,
                fontSize: 16
              )),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _ditujukancontroller,
            ),
            TextFormField(
              controller: _contentcontroller,
            ),

            Visibility(
              visible: pickedFile != null,
              child: pickedFile != null
                  ? Image.file(File(pickedFile!.path), height: 200)
                  : Container(),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

      if (_formKey.currentState!.validate()) {



        checkPermissions();


      }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.image),
      ),
    );
  }

   checkPermissions() async {
     Map<Permission, PermissionStatus> statuses = await [
       Permission.camera,
       Permission.storage,
     ].request();

     if (statuses[Permission.camera] != PermissionStatus.granted &&
         statuses[Permission.storage] != PermissionStatus.granted) {
       return;
     }

     pickedImage();

   }

   pickedImage() async {
     final picker = ImagePicker();
     pickedFile = await picker.pickImage(source: ImageSource.gallery);
     setState(() {});
   }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedValue = 'Option 1'; // Initial selected value

  // List of dropdown items
  List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Selected Value: $selectedValue'),
        SizedBox(height: 20),
        DropdownButton<String>(
          value: selectedValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
