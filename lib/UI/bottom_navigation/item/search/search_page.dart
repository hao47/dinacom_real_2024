
import 'package:dinacom_2024/UI/bottom_navigation/item/search/widget/short_showmodal.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _LaporState();
}

class _LaporState extends State<SearchPage> {


  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorValue.LightBlue,
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 25),
          Expanded(
            child: Container(
              height: 36,
              child: TextFormField(
                controller: _controller,
                cursorColor: ColorValue.BaseBlue,
                style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                  fontSize: 10,
                  color: ColorValue.BaseBlack,
                ),
                decoration: InputDecoration(
                  hintText: 'Cari Laporan ..',
                  hintStyle:
                  CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                    fontSize: 10,
                    color: ColorValue.LightGrey,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color(0xff666666),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color(0xff666666),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 2,
                      color: ColorValue.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: (){

              // _controller.isSelectionWithinTextBounds()
              //
              FocusScope.of(context).unfocus();
              _controller.clear();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SortShowmodal();
                },
              );
            },
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.settings_input_composite,
                  color: ColorValue.LightBlue, size: 20),
            ),
          ),
          SizedBox(width: 25),
        ],
      ),
    );
  }
}