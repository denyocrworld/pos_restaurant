import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/dashboard_view.dart';

/*
Basic Flutter
  Common Widget
  Layout
  ListView
  GridView

State Management
  setState
  ValueNotifier
  Stream

  Getx
  BLoc
  Riverpod
  Provider

Architecture
  MVC
  MVVM
  Clean Architecture
  BLoc Architecture
  Riverpod Architecture
*/
class DashboardController extends State<DashboardView>
    implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
