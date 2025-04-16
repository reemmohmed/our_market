// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';
// // تأكد من استيراد الـ Cubit

// class ProductDotsIndicator extends StatelessWidget {
//   final List<String> imageUrls;

//   const ProductDotsIndicator({
//     super.key,
//     required this.imageUrls,
//   });
//   // final double position;
//   @override
//   Widget build(BuildContext context) {
//     final blocprovider = context.read<DotesImageCubit>();
//     return BlocProvider(
//       create: (context) => DotesImageCubit(),
//       child: DotsIndicator(
//         dotsCount: imageUrls.length,
//         position: blocprovider.currentIndex.toDouble(),
//         decorator: DotsDecorator(
//           size: const Size.square(9.0),
//           activeSize: const Size(18.0, 9.0),
//           activeColor: Theme.of(context).primaryColor,
//           activeShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market/featuers/product_detalse/mange/DotesImage/dotes_image_cubit.dart';

class ProductDotsIndicator extends StatelessWidget {
  final List<String> imageUrls;

  const ProductDotsIndicator({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DotesImageCubit, DotesImageState>(
      builder: (context, state) {
        int index = 0;
        if (state is ChaneViewIndex) {
          index = state.currentIndex;
        }
        return DotsIndicator(
          dotsCount: imageUrls.length,
          position: index.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: Theme.of(context).primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        );
      },
    );
  }
}
