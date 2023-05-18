import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProfileController extends State<ProfileView> implements MvcController {
  static late ProfileController instance;
  late ProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLogout() async {
    showLoading();
    await AuthService().logout();
    hideLoading();
    Get.offAll(const LoginView());
  }
}
