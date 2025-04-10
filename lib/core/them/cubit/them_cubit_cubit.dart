import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'them_cubit_state.dart';

class ThemCubit extends Cubit<ThemCubitState> {
  ThemCubit() : super(ThemCubitInitial());
  static const String themStatus = 'ThemDark';
  bool darkThem = false;

  // Set the theme value to SharedPreferences and emit a new state
  Future<void> setIsDarkTheme(bool isValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themStatus, isValue);
    darkThem = isValue;
    emit(ThemLoaded(darkThem)); // Emit new state with the updated theme
  }

  // Get the current theme from SharedPreferences and emit the state
  Future<void> getThem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkThem = sharedPreferences.getBool(themStatus) ?? false;
    emit(ThemLoaded(darkThem)); // Emit the state after loading the theme
  }
}
