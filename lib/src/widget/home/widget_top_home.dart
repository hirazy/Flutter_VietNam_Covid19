import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/constant/constants.dart';

import '../../constant/theme.dart';

class TopHomeWidget extends StatelessWidget {
  VoidCallback onCall;
  VoidCallback onSendSMS;

  TopHomeWidget({Key? key, required this.onCall, required this.onSendSMS})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Constants.colorMain,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      // color: Constants.colorMain,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              "Tình trạng sức khỏe của bạn hôm nay thế nào?",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: Constants.fontPoppins,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Bạn có cảm thấy như bị bệnh?",
              style: TextStyle(
                  color: Colors.white, fontFamily: Constants.fontPoppins),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              // AppLocalization.of(context).
              "Nếu bạn cảm thấy bị bệnh với bất kỳ triệu chứng Covid-19 nào, "
              "vui lòng gọi hoặc nhắn tin SMS cho chúng tôi ngay lập tức để được giúp đỡ",
              style: TextStyle(
                  color: Colors.white, fontFamily: Constants.fontPoppins),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _btnDesign(
                    context: context,
                    title: "Gọi ngay",
                    icon: Icons.call,
                    onTap: onCall,
                    backgroundColor: ThemePrimary.green),
                SizedBox(width: 10.0),
                _btnDesign(
                    context: context,
                    title: "Gửi tin nhắn",
                    icon: Icons.message,
                    onTap: onSendSMS,
                    backgroundColor: ThemePrimary.orange)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _btnDesign(
      {required BuildContext context,
      required String title,
      required IconData icon,
      required Function onTap,
      required Color backgroundColor}) {
    return Flexible(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Expanded(
            child: Center(
                child: TextButton(
          onPressed: onTap(),
          child: Row(
            children: [Icon(icon), Text(title)],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.45, 54)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12)),
            elevation: MaterialStateProperty.all(6),
            //Defines Elevation
            shadowColor: MaterialStateProperty.all(Colors.grey),
            //Define
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
                // side: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ))),
      ),
    );
  }
}
