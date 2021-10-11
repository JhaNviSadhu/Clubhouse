import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar myAppbar() {
  return AppBar(
    foregroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.search,
        size: 35,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.envelope_open,
            size: 35,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.calendar,
            size: 40,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.bell,
            size: 40,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          onPressed: () {},
          icon: Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/user6.jpg"),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
