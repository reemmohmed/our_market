import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dotes_image_state.dart';

class DotesImageCubit extends Cubit<DotesImageState> {
  DotesImageCubit() : super(DotesImageInitial());
  int currentIndex = 0;

  void changcurrentPage(int index) {
    currentIndex = index;
    emit(ChaneViewIndex(currentIndex: index));
  }
}
