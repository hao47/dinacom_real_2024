import 'dart:io';

import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/image_upload_service.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/widget/change_location.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/widget/dropdown.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/widget/hapus_dialog.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile_provider.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/search_controller.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../widget/loading_animation.dart';

class Lapor extends StatefulWidget {
  Lapor({super.key});

  @override
  State<Lapor> createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  ImageUploadService uploadService = ImageUploadService();

  XFile? pickedFile;

  TextEditingController _ditujukancontroller = TextEditingController();
  TextEditingController _contentcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  QuillController _controller = QuillController.basic();
  QuillController _controller1 = QuillController.basic();

  // @override
  // void initState() {
  //   _controller.addListener(() {
  //     print(_controller.document.toPlainText());
  //   });
  //   super.initState();
  // }

  var alamat = "";

  Widget unggahButton() {
    if(_controller.document.toPlainText() != "" && _controller1.document.toPlainText() != "" && alamat != ""){
      return Container(
        // color: ColorValue.secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
        TextButton(
          onPressed: () {
            if (alamat != "") {
              final judul = _controller.document.toPlainText();
              final content = _controller1.document.toPlainText();

              print(judul.length);
              // print(judul);

              uploadService.uploadImage(
                  pickedFile, context, content, judul, alamat);
            }
          },
          child: Text("Unggah",
              style: CommonAppTheme.textTheme(context)
                  .headline1!
                  .copyWith(color: Colors.white, fontSize: 16)),
        ),
      );
    }
    return Container(
      // color: ColorValue.secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
      TextButton(
        onPressed: () {},
        child: Text("Unggah",
            style: CommonAppTheme.textTheme(context)
                .headline1!
                .copyWith(color: Colors.grey, fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorValue.secondaryColor,
        leading: IconButton(
          onPressed: () {
            // Provider.of<PoranProvider>(context, listen: false).profile();

            // Get.put(PoranController()).profile();
            // Get.put(SearchPageController());

            Navigator.pop(context);

            // Get.bottomSheet(ExitPostDialog());
          },
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          unggahButton()
        ],
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 15),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorValue.BaseGrey,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          Get.put(ProfileController())
                                              .profileModel
                                              .value
                                              .responseProfile!
                                              .photoProfile))),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: QuillEditor.basic(
                                  configurations: QuillEditorConfigurations(
                                      placeholder: "Judul...",
                                      controller: _controller,
                                      readOnly: false,
                                      sharedConfigurations:
                                          const QuillSharedConfigurations(
                                        locale: Locale('id'),
                                      ),
                                      customStyles: DefaultStyles(
                                        link: TextStyle()
                                            .copyWith(color: Colors.blue),
                                        color: Colors.black,
                                        paragraph: DefaultTextBlockStyle(
                                            CommonAppTheme.textTheme(context)
                                                .bodyText1!
                                                .copyWith(
                                                    color: ColorValue.LightGrey,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18,
                                                    height: 1),
                                            VerticalSpacing(0, 0),
                                            VerticalSpacing(0, 0),
                                            null),
                                        placeHolder: DefaultTextBlockStyle(
                                            CommonAppTheme.textTheme(context)
                                                .bodyText1!
                                                .copyWith(
                                                    color: ColorValue
                                                        .VeryLightGrey,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18,
                                                    height: 1.2),
                                            VerticalSpacing(0, 0),
                                            VerticalSpacing(0, 0),
                                            null),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20),
                          child: QuillEditor.basic(
                            configurations: QuillEditorConfigurations(
                                placeholder: "Konten...",
                                controller: _controller1,
                                readOnly: false,
                                sharedConfigurations:
                                    const QuillSharedConfigurations(
                                  locale: Locale('id'),
                                ),
                                customStyles: DefaultStyles(
                                    link: TextStyle()
                                        .copyWith(color: Colors.blue),
                                    color: Colors.black,
                                    paragraph: DefaultTextBlockStyle(
                                        CommonAppTheme.textTheme(context)
                                            .bodyText1!
                                            .copyWith(
                                            color: ColorValue.LightGrey,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            height: 1.2),
                                        VerticalSpacing(0, 0),
                                        VerticalSpacing(0, 0),
                                        null),
                                    placeHolder: DefaultTextBlockStyle(
                                        CommonAppTheme.textTheme(context)
                                            .bodyText1!
                                            .copyWith(
                                            color: ColorValue.VeryLightGrey,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                            height: 1.2),
                                        VerticalSpacing(0, 0),
                                        VerticalSpacing(0, 0),
                                        null))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      alamat == ""
                          ? InkWell(
                              onTap: () async {
                                uploadService.isLoad.value = true;
                                // _controller.indentSelection();
                                FocusManager.instance.primaryFocus?.unfocus();
                                // FocusScope.of(context).unfocus();
                                // _controller.clear();
                                // var result = await Get.bottomSheet(ChangeLocation());
                                //
                                //
                                //
                                // // if (result != null && result is List<String?>) {
                                //   List<String?> streets = result;
                                //   setState(() {
                                //     alamat = streets[0]!;
                                //   });
                                // }

                                Position position = await _determinePosition();

                                List<Placemark> placemark =
                                    await placemarkFromCoordinates(
                                        position.latitude, position.longitude);

                                if (placemark[0].street != null &&
                                    placemark[0].street != "") {
                                  uploadService.isLoad.value = false;

                                  setState(() {
                                    alamat = placemark[0].street as String;
                                  });
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, size: 25),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Pilih Lokasi Kejadian",
                                      style: CommonAppTheme.textTheme(context)
                                          .bodyText1,
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, size: 25),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    alamat,
                                    style: CommonAppTheme.textTheme(context)
                                        .bodyText1,
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 10,
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
          ValueListenableBuilder<bool>(
            valueListenable: uploadService.isLoad,
            builder: (context, value, _) => Visibility(
              visible: value,
              child: const LoadingAnimation(),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 30.0),
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // print(doc.toPlainText());
              // print(Provider.of<PoranProvider>(context,listen: false).instasi);
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
