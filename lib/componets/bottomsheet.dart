import 'package:clubhouse/constant.dart';
import 'package:clubhouse/model/room_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Mybottomsheet extends StatefulWidget {
  const Mybottomsheet({
    Key? key,
  }) : super(key: key);

  @override
  _MybottomsheetState createState() => _MybottomsheetState();
}

class _MybottomsheetState extends State<Mybottomsheet> {
  final List<RoomModel> _roomhouse = getListOfRoom();
  var controller = TextEditingController();
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8),
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
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      content: Padding(
                        padding: EdgeInsets.all(4),
                        child: CupertinoTextField(
                          controller: controller,
                          maxLength: 60,
                          maxLines: 6,
                        ),
                      ),
                      title: Column(
                        children: const [
                          Text(
                            'Add a Title',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'e.g Raising wolves - good idea ?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            print(controller.text);
                            controller.clear();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                           
                            print(controller.text);
                            controller.clear();
                             Navigator.pop(context);
                          },
                          child: const Text(
                            'Set Title',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "+ Add a title",
                style: kFontgrey.copyWith(color: buttoncolor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: CupertinoScrollbar(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 5.20, crossAxisCount: 3),
                itemCount: _roomhouse.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (isSelected == index)
                              ? const Color.fromRGBO(225, 228, 241, 1)
                              : Colors.transparent,
                          border: Border.all(
                            color: (isSelected == index)
                                ? const Color.fromRGBO(214, 215, 219, 1)
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(42),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      _roomhouse[index].img,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _roomhouse[index].name ?? " ",
                                style: kFont.copyWith(fontSize: 18),
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
          const Divider(
            thickness: 1.5,
          ),
          const SizedBox(height: 20),
          RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: kFont,
              children: <TextSpan>[
                TextSpan(
                  text: (isSelected == 0)
                      ? 'Start a room'
                      : (isSelected == 1)
                          ? 'Start a room with'
                          : (isSelected == 2)
                              ? 'Start a room for'
                              : null,
                  style: TextStyle(color: Colors.grey[400], fontSize: 19),
                ),
                TextSpan(
                  text: (isSelected == 0)
                      ? ' open to everyone'
                      : (isSelected == 1)
                          ? ' people I follow'
                          : (isSelected == 2)
                              ? ' pepole I choose'
                              : null,
                  style: kFontgrey.copyWith(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CupertinoButton(
            child: Text(
              (isSelected == 2) ? "Choose people..." : "🎉 Let's go",
              style: kFontwhite,
            ),
            onPressed: () {},
            color: buttoncolor,
            borderRadius: BorderRadius.circular(30),
            padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          ),
        ],
      ),
    );
  }
}
