import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/dropdown_ditujukan.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TambahPoran extends StatelessWidget {
  const TambahPoran({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          leading: const Icon(
            Icons.close_rounded,
            color: Colors.black,
            size: 30,
          ),
          actions: [
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: Text(
                  'Unggah',
                  style: textTheme.headline1!.copyWith(
                    fontSize: 16,
                    color: ColorValue.BaseBlue,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(
          // children: [
          //   DropdownButton(
          //     value: Provider.of<PostPoranProvider>(context, listen: false).selectedItem,
          //     items: Provider.of<PostPoranProvider>(context, listen: false).items
          //         .map((item) => DropdownMenuItem(child: Text(item)))
          //         .toList(),
          //     onChanged: (item) => Provider.of<PostPoranProvider>(context, listen: false).selectDrop(item),
          //   )
          // ],
        ),
      ),
    );
  }
}
