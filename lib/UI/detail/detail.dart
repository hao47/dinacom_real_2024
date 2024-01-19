import 'package:dinacom_2024/UI/detail/widget/comment.dart';
import 'package:dinacom_2024/UI/detail/widget/info_rich_text.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile_biodata.dart';
import 'package:dinacom_2024/UI/masyarakat_profile/profile_post.dart';
import 'package:dinacom_2024/UI/widget/role.dart';
import 'package:dinacom_2024/common/app_theme.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          title: Text(
            "Poran",
            style: textTheme.headline1!.copyWith(fontSize: 20, height: 1.5),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: ColorValue.VeryLightBlue,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Nyoman Deka',
                                    style: CommonAppTheme.textTheme(context)
                                        .headline1!
                                        .copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(width: 10),
                                  const Role(name: "Masyarakat", ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.report_problem_outlined)),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                shape: BoxShape.rectangle,
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Haiii kawan kawan Gonnect gimana nih kabar kalian? kabar mindus sih baik nih. Kalian pada gasabar ga sih dengan perkembangan IKN?  kalo mindus udah gasabar bangett nunguin IKN gimana kedepanya btw kalian udah pada tau belum apa itu IKN? kalau ada yang belum tau yuk simak link dibawah ini!!",
                              style: CommonAppTheme.textTheme(context)
                                  .bodyText1!
                                  .copyWith(
                                  fontSize: 14,
                                  color: ColorValue.BaseBlack),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: const Row(
                            children: [
                              Text('16:00 Pm'),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(Icons.circle,
                                    size: 3, color: ColorValue.LightGrey),
                              ),
                              Text('17 Januari 2024')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: ColorValue.VeryLightGrey,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: ColorValue.VeryLightGrey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            InfoRichText(total: 250, title: "Tanggapan"),
                            SizedBox(width: 10),
                            InfoRichText(total: 150, title: "Repost"),
                            SizedBox(width: 10),
                            InfoRichText(total: 78, title: "Dibagikan"),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                            iconSize: 16),
                      ],
                    ),
                  ),
                  const Column(
                    children: [
                      CommentPoran(),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: TextFormField(
                  style: textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: ColorValue.BaseBlack,
                  ),
                  maxLines: null,
                  cursorColor: ColorValue.BaseBlue,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    focusColor: ColorValue.BaseBlue,
                    labelText: null,
                    hintText: 'Balas Kota Kudus',
                    hintStyle: textTheme.bodyText1!.copyWith(fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}