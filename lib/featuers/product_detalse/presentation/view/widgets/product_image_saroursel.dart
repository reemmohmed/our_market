import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/core/componant/shimmer_iamge.dart';
import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';
import 'package:our_market/featuers/product_detalse/presentation/view/widgets/screen_image_gallary.dart';

class ProductImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImageCarousel({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.9,
        onPageChanged: (index, reason) {
          context.read<DotesImageCubit>().changcurrentPage(index);
        },
      ),
      items: imageUrls.map((imageUrl) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullScreenImageGallery(
                  imageUrls: imageUrls,
                  initialIndex: imageUrls.indexOf(imageUrl),
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ShimmerImage(imageUrl: imageUrl),
          ),
        );
      }).toList(),
    );
  }
}
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:our_market/test/apptest.dart';

// class ProductImageCarousel extends StatelessWidget {
//   final List<String> imageUrls;

//   const ProductImageCarousel({super.key, required this.imageUrls});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 250,
//         enlargeCenterPage: true,
//         enableInfiniteScroll: false,
//         viewportFraction: 0.9,
//         onPageChanged: (index, reason) {
//           // Handle index change
//         },
//       ),
//       items: imageUrls.map((imageUrl) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => FullScreenImageGallery(
//                   imageUrls: imageUrls,
//                   initialIndex: imageUrls.indexOf(imageUrl),
//                 ),
//               ),
//             );
//           },
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(imageUrl),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }