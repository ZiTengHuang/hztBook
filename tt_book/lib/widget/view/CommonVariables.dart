/*
 * @Description: 头部注释
 * @Author: 连京帅
 * @Date: 2019-06-28 11:14:59
 * @LastEditTime: 2019-07-18 17:50:15
 * @LastEditors: Do not edit
 */
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 顶级变量👇👇👇👇👇👇👇👇👇👇
// double screenWidth = MediaQueryData.fromWindow(window).size.width;
// double screenHeight = MediaQueryData.fromWindow(window).size.height;
// double ratio = screenWidth / 375.0;
double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
double appBarHeight = AppBar().preferredSize.height;
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double ratio(BuildContext context) => MediaQuery.of(context).size.width / 375.0;
