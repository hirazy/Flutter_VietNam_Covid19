import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vietnam_covid19/src/constant/constants.dart';

class CenterHomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Phòng ngừa",
              style: TextStyle(
                  fontFamily: Constants.fontPoppins,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardContent(
                  title: "Tránh tiếp xúc gần",
                  svgPicture: "assets/svg/avoidclosecontact.svg"
              ),
              cardContent(
                  title: "Làm sạch tay thường xuyên",
                  svgPicture: "assets/svg/cleanhands.svg"
              ),
              cardContent(
                  title: "Luôn mang khẩu trang",
                  svgPicture: "assets/svg/facemask.svg"
              )
            ],
          )
        ],
      ),
    );
  }

  Widget cardContent({
    required String title,
    required String svgPicture
  }) {

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPicture, fit: BoxFit.fill),
          SizedBox(height: 10,),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontFamily: Constants.fontPoppins,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
