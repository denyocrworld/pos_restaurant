import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/pos_table_view.dart';

class PosTableController extends State<PosTableView> implements MvcController {
  static late PosTableController instance;
  late PosTableView view;

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