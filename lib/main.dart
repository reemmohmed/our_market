import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:our_market/core/them/Styels.dart';
import 'package:our_market/core/them/cubit/them_cubit_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/manger/cubit/authentication_cubit.dart';
import 'package:our_market/featuers/auth/presentaion/view/logen_view.dart';
import 'package:our_market/featuers/nave_bar/presentation/view/navebar.dart';
import 'package:our_market/test/runtest.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );

  runApp(const OurMarket());
}

class OurMarket extends StatelessWidget {
  const OurMarket({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseClient clint = Supabase.instance.client;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return ThemCubit()..getThem();
          },
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
      ],
      child: BlocBuilder<ThemCubit, ThemCubitState>(
        builder: (context, state) {
          bool isDark = false;

          if (state is ThemLoaded) {
            isDark = state.isDarkTheme;
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OurMarket',
            theme: Styels.themeData(isDarkTheem: isDark, context: context),
            // check user is empepty go to NaveBar also  go to logein

            home: clint.auth.currentUser != null
                ? const NaveBar()
                : const LogenView(),

            //  home: Runtest(),
          );
        },
      ),
    );
  }
}
