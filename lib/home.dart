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
    bool isSelected = false;
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
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 8),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  width: 40,
                                  height: 6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "+ Add a title",
                                      style: kFontgrey.copyWith(
                                          color: buttoncolor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 400,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 3 / 3.5,
                                            crossAxisCount: 3),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            print(isSelected);
                                            isSelected = !isSelected;
                                          });
                                        },
                                        child: isSelected
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      225, 228, 241, 1),
                                                  border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        214, 215, 219, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        "assets/open.png",
                                                        height: 100,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Open",
                                                        style: kFont,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/open.png",
                                                      height: 100,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "Open",
                                                      style: kFont,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Divider(
                                  thickness: 1.5,
                                ),
                              ],
                            ),
                          );
                        },
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
