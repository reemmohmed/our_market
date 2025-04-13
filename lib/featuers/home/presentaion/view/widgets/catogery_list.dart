import 'package:flutter/material.dart';
import 'package:our_market/featuers/home/presentaion/view/widgets/catogery_item.dart';

class CatogeriesModel {
  final IconData icon;
  final String text;

  const CatogeriesModel({required this.icon, required this.text});
}

class CatogetyList extends StatelessWidget {
  const CatogetyList({super.key});
  final List<CatogeriesModel> catogers = const [
    CatogeriesModel(icon: Icons.sports_baseball_outlined, text: "Sports"),
    CatogeriesModel(icon: Icons.tv, text: "Electoronic "),
    CatogeriesModel(icon: Icons.collections, text: "Collections"),
    CatogeriesModel(icon: Icons.sports, text: "store"),
    CatogeriesModel(icon: Icons.sports_esports_rounded, text: "Game"),
    CatogeriesModel(icon: Icons.home, text: "Home"),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catogers.length,
          itemBuilder: (context, index) {
            return CatogeryItem(
              catogery: catogers[index],
            );
          }),
    );
  }
}
