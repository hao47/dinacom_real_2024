import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:dinacom_2024/data/model/get_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentPoran extends StatelessWidget {

  GetCommentModel commentModel;
  String text;
   CommentPoran({super.key,required this.commentModel,required this.text});

  @override
  Widget build(BuildContext context) {



    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: commentModel.responseComment!.length
      ,itemBuilder: (context, index) {

      timeago.setLocaleMessages('id', timeago.IdMessages());

      DateTime now = DateTime.now().toLocal();

      DateTime inputDate = commentModel.responseComment![index].createdAt.toLocal();

      Duration difference = now.difference(inputDate);

      String formattedDate = DateFormat('yyyy-MM-dd').format(inputDate);

      String timeAgo = timeago.format(now.subtract(difference), locale: 'id');

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorValue.VeryLightGrey,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text(
                    'Membalas',
                    style: CommonAppTheme.textTheme(context)
                        .bodyText1!
                        .copyWith(fontSize: 12, color: ColorValue.LightGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child:
                    Icon(Icons.circle, size: 4, color: ColorValue.LightGrey),
                  ),
                  Text(
                    text,
                    style: CommonAppTheme.textTheme(context).bodyText1!.copyWith(
                        fontSize: 12,
                        color: ColorValue.BaseBlack,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(

                            commentModel.responseComment![index].user.photoProfile
                         ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              commentModel.responseComment![index].user.username,
                              style: CommonAppTheme.textTheme(context)
                                  .bodyText1!
                                  .copyWith(
                                  fontSize: 10,
                                  color: ColorValue.BaseBlack,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(width: 10),
                            Role(name:       commentModel.responseComment![index].user.role,),
                          ],
                        ),
                         Text(timeAgo),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 36, height: 36),
                    const SizedBox(width: 5),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Text(
                        commentModel.responseComment![index].body,
                        style: CommonAppTheme.textTheme(context)
                            .bodyText1!
                            .copyWith(
                            fontSize: 12, color: ColorValue.BaseBlack),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },);
  }
}