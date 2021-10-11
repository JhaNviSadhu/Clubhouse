import 'package:clubhouse/componets/bottomsheet.dart';
import 'package:clubhouse/constant.dart';
import 'package:clubhouse/model/house_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/widgets.dart';

import 'componets/card_contents.dart';
import 'componets/my_appbar.dart';

class HomeClass extends StatefulWidget {
  HomeClass({Key? key}) : super(key: key);

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  @override
  Widget build(BuildContext context) {
    List<HouseModel> housemodel = getListOfHouse();
    return Scaffold(
      backgroundColor: themecolor,
      appBar: myAppbar(),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: housemodel.length,
            itemBuilder: (BuildContext context, int index) {
              return CardContent(
                housemodel: housemodel,
                index: index,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    themecolor.withOpacity(0.1),
                    themecolor.withOpacity(0.5),
                    themecolor,
                  ],
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.64),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => const Mybottomsheet(),
                      );
                    },
                    child: Container(
                      width: 240,
                      height: 55,
                      decoration: BoxDecoration(
                        color: buttoncolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "+ Start a room",
                          style: kFontwhite,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.paperplane,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
