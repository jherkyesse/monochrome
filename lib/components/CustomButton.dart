import 'package:flutter/material.dart';
import 'package:monochrome/constants/colors.dart';

Widget renderIconButton(icon, onTap, isActive, theme) => Container(
    width: 47.0,
    height: 47.0,
    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: isActive ? theme.primaryColor : white,
      border: Border.all(
        color: theme.primaryColor,
        width: 2.4,
      ),
    ),
    child: Material(
        color: Colors.transparent,
        child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: onTap,
            splashColor: theme.accentColor,
            hoverColor: theme.accentColor,
            focusColor: theme.accentColor,
            highlightColor: theme.accentColor,
            child: Icon(
              icon,
              size: 24,
              color: isActive ? white : theme.primaryColor,
            ))));

Widget renderOutlinedButton(label, onPressed, theme) => OutlinedButton(
    child: Text(label,
        style: TextStyle(
            fontFamily: 'Titillium',
            fontSize: 20.0,
            fontWeight: FontWeight.w900)),
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        primary: theme.canvasColor,
        backgroundColor: theme.primaryColor,
        side: BorderSide(color: theme.primaryColor),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)))));
