import 'package:flutter/material.dart';
import 'package:booqueue/utils/colors.dart';
import 'package:booqueue/utils/dimensions.dart';
import 'package:booqueue/widgets/big_text.dart';
import 'package:booqueue/widgets/icon_and_text.dart';
// import 'package:mobileapp/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  // final String birdCategory;
  final int stars;
  AppColumn({required this.text, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "1 Ticket + $text", size: Dimensions.font20,),
                    SizedBox(height: Dimensions.height10/2,),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            children: List.generate(stars, (index) {
                              return Icon(Icons.stars, color: AppColors.mainColor,size: 12,);
                            }),
                          ),
                        ),
                        
                      ],
                    ),
                    SizedBox(height: Dimensions.height10/3,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                        text: "Items Left: $stars",
                        iconColor: AppColors.iconColor1
                        ),
                      ],
                    )
                  ],
                ),
    );
  }
}