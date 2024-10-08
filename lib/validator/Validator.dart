import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
class Validator {
  static Widget checkIconTexFormField(bool? str,String? user) {
    if (str == true) {
      return Icon(Icons.lock_outlined);
    } else  if( user == "user"){
      return Icon(
        Icons.person,
      );
    }else {
      return Icon(
        Icons.email_outlined,
      );
    }

  }
  static String? emptyValidator(value) {
    return value.toString().trim().isEmpty ? null : null;
  }

  static String? nameValidator(value) {
    return value.toString().length <= 3 ? 'Nama tidak valid' : null;
  }
  static String? dateValidator(value) {
    return value.toString().length <= 3 ? 'Tanggal tidak valid' : null;
  }

 static Map<String, dynamic>? decodeJwtClaims(String jwtToken) {
    try {
      List<String> parts = jwtToken.split('.');

      if (parts.length != 3) {
        // Invalid JWT format
        return null;
      }

      String payload = utf8.decode(base64Url.decode(parts[1]));
      Map<String, dynamic> decodedClaims = json.decode(payload);

      return decodedClaims;
    } catch (e) {
      // Handle decoding errors
      return null;
    }
  }

  static String? emailValidator(value) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    return !emailValid ? 'Email tidak valid' : null;
  }

  static String? passwordValidator(value) {
    return value.toString().length < 8
        ? 'Kata sandi tidak boleh kurang dari 8 karakter'
        : null;
  }

  static String? confirmPasswordValidator(String value ,String olpw) {


    if(value == ""){
      return "confirm password kosong";
    }else if(value != olpw){
      return "confirm password Tidak sama";

    }else{
      return null;
    }
  }

  static String? phoneValidator(value) {
    return value.toString().length <= 10 || value.toString().length >= 14
        ? 'Nomor telepon tidak valid'
        : null;
  }

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  static Future<bool> isTokenStillValid(String token) async {

    final response = await http.get(Uri.parse("https://urchin-app-hlgon.ondigitalocean.app/api/secured/ping"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': '$token',
        }
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
}
