import 'package:flutter/material.dart';
import 'package:hyper_ui/service/order_service/order_service.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/order_view.dart';

class OrderController extends State<OrderView> implements MvcController {
  static late OrderController instance;
  late OrderView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  updateStatusToPaid({
    required String orderId,
    required String tableNumber,
  }) async {
    await OrderService().setOrderToPaid(
      orderId: orderId,
      tableNumber: tableNumber,
    );
  }

  String status = "Pending";
  updateStatus(newStatus) {
    status = newStatus;
    setState(() {});
  }
}
