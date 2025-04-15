import 'package:flutter/material.dart';
import 'package:our_market/core/widgets/titel_text_widget.dart';

class CustomButtonCheet extends StatelessWidget {
  const CustomButtonCheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: const Border(top: BorderSide(width: 2, color: Colors.grey))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(child: TitelTextWidget(text: "Subotal")),
                    Text(
                      " price",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () async {
                    await showModalBottomSheet(
                        backgroundColor: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        context: context,
                        builder: (context) {
                          return const CustomButtomSheet();
                        });
                    if (context.mounted) {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Text("ThankYou");
                      }));
                    }
                  },
                  child: const Text(
                    'CheckOut',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const PaymentListView(),
          const SizedBox(
            height: 10,
          ),
          // CustomButtom(
          //   titel: 'Containue',
          //   onTab: () {
          //     PaymentStrpe.makePayment('usd', 200);
          //   },
          // ),
        ],
      ),
    );
  }
}
