import 'package:clubhouse/constant.dart';
import 'package:clubhouse/model/house_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.housemodel,
    required this.index,
  }) : super(key: key);

  final List<HouseModel> housemodel;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      housemodel[index].clubname ?? " ",
                      style: kFontlight,
                    ),
                    const Icon(
                      Icons.home_filled,
                      color: Colors.green,
                      size: 17,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.36,
                  child: Text(
                    housemodel[index].clubtopic ?? " ",
                    style: kFont,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.antiAlias,
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: 30,
                          top: 16,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/user3.jpg"),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/user.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 45),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kate Pozeznik" "  💬",
                          style: kFont,
                        ),
                        Text(
                          "Nikita Gupta" "  💬",
                          style: kFont,
                        ),
                        Text(
                          "Mike Tomasello" "  💬",
                          style: kFont,
                        ),
                        Row(
                          children: [
                            Text(
                              housemodel[index].usercount ?? "0",
                              style: kFontgrey,
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              CupertinoIcons.person_solid,
                              size: 18,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "/",
                              style: kFontgrey,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              housemodel[index].comments ?? "0",
                              style: kFontgrey,
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              CupertinoIcons.chat_bubble_text_fill,
                              size: 18,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
