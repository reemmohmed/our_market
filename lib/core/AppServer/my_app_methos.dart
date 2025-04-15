import 'package:flutter/material.dart';
import 'package:our_market/core/const/app_asset.dart';
import 'package:our_market/core/widgets/subtitel_text_widget.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class MyAppMethos {
  static Future<void> showDialogErorr(
      {required BuildContext context,
      required String subtitel,
      required Function onpresed,
      bool isError = false}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAsset.imagebanner,
                  height: 70,
                  width: 70,
                ),
                TitelTextWidget(text: subtitel),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SubtitelTextWidget(
                            text: "canel",
                            color: Colors.red,
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          onpresed();
                          Navigator.pop(context);
                        },
                        child: const SubtitelTextWidget(
                          text: "Ok",
                          color: Colors.green,
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> showimagePicer({
    required BuildContext context,
    required VoidCallback onpresedcamera,
    required VoidCallback onpresedGanaly,
    required VoidCallback onpresedremove,
  }) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: TitelTextWidget(text: "chose Potion")),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomelevatedDilog(
                  text: "camera",
                  icon: Icons.abc,
                  // icon: IconlyLight.camera,
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    onpresedcamera();
                  },
                ),
                CustomelevatedDilog(
                  text: "Ganarry",
                  icon: Icons.camera,
                  // icon: IconlyLight.image,
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    onpresedGanaly();
                  },
                ),
                CustomelevatedDilog(
                  text: "remove",
                  icon: Icons.delete,
                  // icon: IconlyLight.delete,
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                    onpresedremove();
                  },
                ),
              ],
            ),
          );
        });
  }
}

class CustomelevatedDilog extends StatelessWidget {
  const CustomelevatedDilog({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
      onPressed: onPressed,
      label: SubtitelTextWidget(
        text: text,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      icon: Icon(
        icon,
        size: 18,
      ),
    );
  }
}
