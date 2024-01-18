import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 20,),
        ChatContainer(typeChat: true,text: "Pak, ini jembatannya kapan dibenarkan \n ya pak?",),
        SizedBox(height: 20,),
        ChatContainer(typeChat: false,text: "Disebelah mana ya..?",),
        SizedBox(height: 20,),
        ChatContainer(typeChat: true,text: "Oh, itu pak dekat tugu",),
        SizedBox(height: 20,),
        ChatContainer(typeChat: false,text: "Baik, terimakasih infonya ",),
        SizedBox(height: 5,),
        ChatContainer(typeChat: false,text: "Akan langsung kami urus",),

      ],
    );
  }
}

class ChatContainer extends StatelessWidget {
  String text;
  bool typeChat;

  ChatContainer({super.key,required this.text,required this.typeChat});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: typeChat?Alignment.centerRight:Alignment.centerLeft,
      child: Container(

        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(

          color: typeChat ?Color(0xffa8d4ff):Color(0xff6785a3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(17),
            topLeft: Radius.circular(17),
            bottomLeft:  typeChat ?Radius.circular(17):Radius.circular(0),
            bottomRight: typeChat ?Radius.circular(0):Radius.circular(17),
          ),
        ),
        // width: screenWidth * 0.75,
        child: Text(text,
          style: textTheme.bodyText1!.copyWith(
              color: typeChat? Colors.black:Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.end,

        ),
      ),
    );
  }
}