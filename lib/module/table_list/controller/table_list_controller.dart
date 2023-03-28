import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/table_list_view.dart';

class TableListController extends State<TableListView> implements MvcController {
  static late TableListController instance;
  late TableListView view;

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