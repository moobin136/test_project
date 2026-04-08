import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/view/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          splashController.clearListItem();
        },
        child: Icon(Icons.delete),
      ),
      appBar: CustomAppBar(
        title: 'Delivery by tomorrow 6 AM Onwards',
        subTitle: 'Tue , Aug 05',
        notificationIconData: Icon(Icons.cut_outlined),
        cutIconData: Icon(Icons.notification_add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: splashController.textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      splashController.addItem();
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Obx(
                () => ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  itemCount: splashController.itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Obx(
                          () => Text(
                            splashController.itemList[index],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () => splashController.removeItem(index),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.notificationCounter,
    this.notificationCounterBuy,
    required this.notificationIconData,
    required this.cutIconData,
  });

  final String title;
  final String subTitle;
  final String? notificationCounter;
  final String? notificationCounterBuy;
  final Widget notificationIconData;
  final Widget cutIconData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Wrap(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                subTitle,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ],
      ),
      actions: [
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0x5F636F85)),
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.circle),
            child: notificationIconData),
        const SizedBox(width: 8),
        Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: const Color(0x5F636F85)),
                color: const Color(0xFFFFFFFF),
                shape: BoxShape.circle),
            child: cutIconData),
        const SizedBox(width: 3),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// ✅ Custom SnackBar Helper Class
class AppSnackBar {
  // ✅ Success
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xFF2E7D32),
      icon: Icons.check_circle_outline,
      iconColor: Colors.white,
    );
  }

  // ❌ Error
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xFFC62828),
      icon: Icons.error_outline,
      iconColor: Colors.white,
    );
  }

  // ⚠️ Warning
  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xFFF57F17),
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.white,
    );
  }

  // ℹ️ Info
  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: const Color(0xFF1565C0),
      icon: Icons.info_outline,
      iconColor: Colors.white,
    );
  }

  // 🔧 Base Method
  static void _show(BuildContext context,
      {required String message,
      required Color backgroundColor,
      required IconData icon,
      required Color iconColor,
      Duration duration = const Duration(seconds: 3),
      String? actionLabel,
      VoidCallback? onAction}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          margin: const EdgeInsets.all(16),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (actionLabel != null)
                  GestureDetector(
                    onTap: onAction,
                    child: Text(
                      actionLabel,
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
  }
}
