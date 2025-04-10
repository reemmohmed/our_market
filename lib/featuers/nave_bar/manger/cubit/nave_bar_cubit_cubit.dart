import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nave_bar_cubit_state.dart';

class NaveBarCubitCubit extends Cubit<NaveBarCubitState> {
  NaveBarCubitCubit() : super(NaveBarCubitInitial());
  int currentIndex = 0;
  void changcurrentPage(int index) {
    currentIndex = index;
    emit(ChaneViewIndex(currentIndex: index));
  }
}
