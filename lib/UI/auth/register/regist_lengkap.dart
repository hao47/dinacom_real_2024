import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:dinacom_2024/UI/auth/auth_page_controller.dart';
import 'package:dinacom_2024/UI/widget/custom_textfield.dart';
import 'package:dinacom_2024/UI/widget/loading_animation.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/validator/Validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegistLengkap extends GetView<AuthPageController> {
   RegistLengkap({super.key});



  String address = "";

  var a= [
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008'
  ];

  final _formKey = GlobalKey<FormState>();


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         toolbarHeight: 75,
         leading: const Icon(
           Icons.arrow_back_ios_new,
           color: Colors.black,
         ),
       ),
       body: Center(
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Form(
               key: _formKey,
               child: SingleChildScrollView(
                 child: Stack(
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           "Lengkapi profil anda!",
                           style: CommonAppTheme.textTheme(context)
                               .headline1!
                               .copyWith(fontSize: 25),
                         ),
                         Text(
                           "Mari lengkapi profil anda terlebih dahulu!",
                           style: CommonAppTheme.textTheme(context)
                               .bodyText1!
                               .copyWith(fontSize: 12, color: ColorValue.LightGrey),
                         ),
                         Container(
                           margin: EdgeInsets.symmetric(vertical: 75),
                           // height: 1,
                           child: Obx(
                                 () => Stack(
                               alignment: Alignment.center,
                               children: [
                                 controller.pickedFile.value != null?
                             CircleAvatar(
                                     radius: 64,
                                     backgroundImage: FileImage(File(controller.pickedFile.value!.path)),
                                   ):
                                 CircleAvatar(
                                   radius: 64,
                                   backgroundImage: NetworkImage("https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg"),
                                 ),
                                 Positioned(
                                     bottom: 0,
                                     left: 80,
                                     child: Container(
                                       width: 40,
                                       height: 40,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(100),
                                         color: ColorValue.primaryColor
                                       ),
                                       child: IconButton(onPressed: () {

                                         checkPermissions();

                                       }, icon: Icon(CupertinoIcons.pencil,)),
                                     ))
                               ],
                             ),
                           ),
                         ),
                         CustomTextFormField(
                           label: 'Bio',
                           controller:
                           controller
                               .bioController,
                           textInputType: TextInputType.text,
                           borderRadius: 15,
                           // validator: (value) => Validator.nameValidator(value),
                         ),
                         const SizedBox(height: 12.5),
                         CustomTextFormField(
                             label: 'Tanggal Lahir',
                             controller:
                             controller
                                 .tanggaLahirController,
                             textInputType: TextInputType.emailAddress,
                             borderRadius: 15,
                             readOnly: true,
                             onTap: () {
                               controller.selectDate(context);
                             },
                             validator: (value) => Validator.dateValidator(value)),
                         const SizedBox(height: 12.5),
                         CSCPicker(
                           showStates: true,
                           showCities: true,
                           flagState: CountryFlag.DISABLE,
                           dropdownDecoration: BoxDecoration(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(15)),
                               color: Colors.white,
                               border: Border.all(
                                 width: 1.5,
                                 color: const Color(0xff666666),
                               )),
                           disabledDropdownDecoration: BoxDecoration(
                               borderRadius:
                               const BorderRadius.all(Radius.circular(10)),
                               color: Colors.grey.shade300,
                               border: Border.all(
                                   color: Colors.grey.shade300, width: 1)),
                           countrySearchPlaceholder: "Country",
                           stateSearchPlaceholder: "State",
                           citySearchPlaceholder: "City",
                           countryDropdownLabel: "Country",
                           stateDropdownLabel: "State",
                           cityDropdownLabel: "City",
                           countryFilter: const [CscCountry.Indonesia],
                           selectedItemStyle: const TextStyle(
                             color: Colors.black,
                             fontSize: 14,
                           ),
                           dropdownHeadingStyle: const TextStyle(
                               color: Colors.black,
                               fontSize: 17,
                               fontWeight: FontWeight.bold),
                           dropdownItemStyle: const TextStyle(
                             color: Colors.black,
                             fontSize: 14,
                           ),
                           dropdownDialogRadius: 10.0,
                           searchBarRadius: 10.0,
                           onCountryChanged: (value) {
                             controller.countryValue!.value = value ?? "";
                           },
                           onStateChanged: (value) {
                             controller.stateValue!.value = value ?? "";
                           },
                           onCityChanged: (value) {
                             controller.cityValue!.value = value ?? "";
                           },
                         ),
                         const SizedBox(height: 60),
                         ElevatedButton(
                           onPressed: () async {
                             if (_formKey.currentState!.validate()) {


                               String pw = controller.confirmPasswordController.text;

                               address = "${controller.cityValue!.value}, ${controller.stateValue!.value}, ${controller.countryValue!.value}";

                               String tanggal =  controller
                                   .tanggaLahirController.text;

                               bool aa = false;

                               for(var data in a){
                                 if(tanggal.contains(data)){
                                   aa= true;
                                 }
                               }

                               if(aa){

                                 ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                     content: Text('Anda belum berumur 17 tahun ke atas'),
                                   ),
                                 );
                               }else {
                                 controller
                                     .regist(context, address,controller.pickedFile.value,pw);


                               }


                             }
                           },
                           child: const Text('Next'),
                         ),
                       ],
                     ),
                     ValueListenableBuilder<bool>(
                       valueListenable: controller.isLoad,
                       builder: (context, value, _) => Visibility(
                         visible: value,
                         child: const LoadingAnimation(),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           )),
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

     controller.pickedImage();
   }






}
