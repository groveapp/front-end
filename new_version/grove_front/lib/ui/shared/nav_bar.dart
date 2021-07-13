import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:grove_front/ui/shared/buttons.dart';
import 'package:grove_front/ui/shared/typography.dart';

Widget buildNavBar(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              child: Column(
                children: [
                  NavLarge(text: "Grove"),
                  BodyPlain(text: "in Wainscott")
                ],
              ),
              onTap: () {
                Beamer.of(context).beamToNamed('/');
              }),
          NavButton(
            text: "Issues",
            onPressed: () {
              Beamer.of(context).beamToNamed('/organizations');
            },
          ),
          NavButton(
            text: "Leaders",
            onPressed: () {
              Beamer.of(context).beamToNamed('/issues/1');
            },
          ),
          NavButton(
            text: "About",
            onPressed: () {
              Beamer.of(context).beamToNamed('/issues/1');
            },
          ),
          ButtonBar(children: [
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog<void>(
            //           context: context,
            //            builder: (context) => (context)));
            //     },
            //     child: Text("Sign In")),
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog<void>(
            //           context: context,
            //            builder: (context) => (context)));
            //     },
            //     child: Text("Sign Up"))
          ])
        ],
      ));
}
