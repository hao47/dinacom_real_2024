import 'dart:ui';

import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(

              initialChildSize: 0.65,
              maxChildSize: 1.0,
              minChildSize: 0.65,
              builder: (context, controller) {
                return Stack(
                  alignment: AlignmentDirectional.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.1,
                          right: width * 0.1,
                          top: height * 0.05),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Text(
                        """
Cryptocurrencies “have no intrinsic value” and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.

Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward \$20,000, only to sink as low as \$3,122 a year later.

Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: “They have no intrinsic value. That doesn’t mean to say people don’t put value on them, because they can have extrinsic value. But they have no intrinsic value.”

“I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.”

Bailey’s comments echoed a similar warning from the U.K.’s Financial Conduct Authority.

“Investing in cryptoassets, or investments and lending linked to them, generally involves taking very high risks with investors’ money,” the financial services watchdog said in January.

“If consumers invest in these types of product, they should be prepared to lose all their money.”

Bailey, who was formerly the chief executive of the FCA, has long been a skeptic of crypto. In 2017, he warned: “If you want to invest in bitcoin, be prepared to lose all your money.”
                      """,
                        style: textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                            height: 1.5,
                            color: ColorValue.BaseBlack),
                      ),
                    ),
                    Positioned(
                      top: -100,
                      width: width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10,
                              sigmaY: 10,
                            ),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Senin, 15 Januari 2024',
                                      style: textTheme.bodyText1!.copyWith(
                                          fontSize: 12,
                                          height: 1.5,
                                          color: ColorValue.BaseBlack,
                                          fontWeight: FontWeight.w900)),
                                  const SizedBox(height: 10),
                                  Text(
                                      'Debat cawapres seru ketiga paslon saling bersilat lidah dengan pedas',
                                      style: textTheme.bodyText1!.copyWith(
                                          fontSize: 16,
                                          height: 1.5,
                                          color: ColorValue.BaseBlack)),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}