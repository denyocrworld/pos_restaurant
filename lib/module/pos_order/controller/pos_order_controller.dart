import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PosOrderController extends State<PosOrderView> implements MvcController {
  static late PosOrderController instance;
  late PosOrderView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String search = "";
  updateSearch(String query) {
    search = query;
    setState(() {});
  }

  List productList = [];

  getQty(item) {
    var index = productList.indexWhere((i) => i["id"] == item["id"]);
    if (index > -1) {
      productList[index]["qty"] ??= 0;
      return productList[index]["qty"];
    }
    return 0;
  }

  increaseQty(item) {
    addProductIfNotFound(item);

    var index = productList.indexWhere((i) => i["id"] == item["id"]);
    if (index > -1) {
      productList[index]["qty"] ??= 0;
      productList[index]["qty"]++;
    }
    setState(() {});
  }

  decreaseQty(item) {
    addProductIfNotFound(item);

    var index = productList.indexWhere((i) => i["id"] == item["id"]);
    if (index > -1) {
      productList[index]["qty"] ??= 0;
      if (productList[index]["qty"] == 0) return;
      productList[index]["qty"]--;
    }
    setState(() {});
  }

  addProductIfNotFound(item) {
    var index = productList.indexWhere((i) => i["id"] == item["id"]);
    if (index == -1) {
      item["qty"] = 0;
      productList.add(jsonDecode(jsonEncode(item)));
    }
  }

  double get total {
    double itemTotal = 0;
    for (var item in productList) {
      itemTotal += item["qty"] * item["price"];
    }
    return itemTotal;
  }

  checkout() async {
    showLoading();
    await OrderService().create(
      tableNumber: widget.tableNumber,
      items: productList,
      total: total,
      paymentMethod: "Cash",
      status: "Pending",
    );
    hideLoading();
    Get.offAll(const MainNavigationView());
    showInfoDialog("Order created!");
  }
}
