// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:our_market/featuers/product_detalse/mange/SliderCubit/slider_cubit_cubit.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// class Apptest extends StatelessWidget {
//   const Apptest({super.key, required this.imageUrls});

//   final List<String> imageUrls;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => SliderCubit(),
//       child: Column(
//         children: [
//           BlocBuilder<SliderCubit, int>(
//             builder: (context, currentIndex) {
//               return CarouselSlider(
//                 options: CarouselOptions(
//                   height: 250,
//                   enlargeCenterPage: true,
//                   enableInfiniteScroll: false,
//                   viewportFraction: 0.9,
//                   onPageChanged: (index, reason) {
//                     context.read<SliderCubit>().changeIndex(index);
//                   },
//                 ),
//                 items: imageUrls.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final imageUrl = entry.value;
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => FullScreenImageGallery(
//                             imageUrls: imageUrls,
//                             initialIndex: index,
//                           ),
//                         ),
//                       );
//                     },
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.network(
//                         imageUrl,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),

//           const SizedBox(height: 12),

//           // ✅ استخدام DotsIndicator
//           BlocBuilder<SliderCubit, int>(
//             builder: (context, currentIndex) {
//               return DotsIndicator(
//                 dotsCount: imageUrls.length,
//                 position: currentIndex.toDouble(),
//                 decorator: DotsDecorator(
//                   size: const Size.square(9.0),
//                   activeSize: const Size(18.0, 9.0),
//                   activeColor: Theme.of(context).primaryColor,
//                   activeShape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FullScreenImageGallery extends StatelessWidget {
//   final List<String> imageUrls;
//   final int initialIndex;

//   const FullScreenImageGallery({
//     super.key,
//     required this.imageUrls,
//     required this.initialIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: PhotoViewGallery.builder(
//         scrollPhysics: const BouncingScrollPhysics(),
//         itemCount: imageUrls.length,
//         pageController: PageController(initialPage: initialIndex),
//         builder: (context, index) {
//           return PhotoViewGalleryPageOptions(
//             imageProvider: NetworkImage(imageUrls[index]),
//             heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
//             minScale: PhotoViewComputedScale.contained,
//             maxScale: PhotoViewComputedScale.covered * 2.5,
//           );
//         },
//         backgroundDecoration: const BoxDecoration(
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
// }
