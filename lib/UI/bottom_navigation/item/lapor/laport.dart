import 'dart:io';

import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/image_upload_service.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/widget/dropdown.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {
            Provider.of<PoranProvider>(context, listen: false).profile();

            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                if (pickedFile != null) {


                  final doc = _controller.document.toPlainText();

                  uploadService.uploadImage(pickedFile,doc);
                }
              },
              child: Text("Unggah",
                  style: CommonAppTheme.textTheme(context).headline1!.copyWith(
                      color: ColorValue.secondaryColor, fontSize: 16)),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownDitujukan(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 15),
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorValue.BaseGrey,
                    ),
                  ),
                  Expanded(
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        placeholder: "Ketik Sesuatu di sini",
                        controller: _controller,
                        readOnly: false,
                        sharedConfigurations: const QuillSharedConfigurations(
                          locale: Locale('de'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Visibility(
              visible: pickedFile != null,
              child: pickedFile != null
                  ? Image.file(File(pickedFile!.path), height: 200)
                  : Container(),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller,
                  multiRowsDisplay: false,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 30.0),
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {

              // print(doc.toPlainText());

              checkPermissions();
            }
          },
          tooltip: 'Increment',
          backgroundColor: ColorValue.BaseBlue,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(50.0), // Adjust the radius as needed
          ),
          child: const Icon(
            Icons.image_rounded,
            color: ColorValue.VeryLightGrey,
            size: 25,
          ),
        ),
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