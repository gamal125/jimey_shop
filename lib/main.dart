import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Screens/login/login_screen.dart';
import 'package:shop_app/Screens/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/layout/home_screen.dart';
import 'package:shop_app/network/cache_helper.dart';
import 'package:shop_app/network/dio_helper.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/componnetns/constants.dart';
import 'package:shop_app/shared/mode_cubit/cubit.dart';
import 'package:shop_app/shared/mode_cubit/state.dart';
import 'package:shop_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {},
    blocObserver: MyBlocObserver(),
  );
   DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getData(key: 'token');

  if(onBoarding != null)
  {
    if(token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  }else
  {
    widget = OnBoardingScreen();
  }

  runApp(Myapp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class Myapp extends StatelessWidget {
  final  bool? isDark;
  final Widget startWidget;

  Myapp({Key? key, required this.startWidget, this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MainCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavoritesData()
              ..getUserData()
              ..getCartData()
              ..getFaqData()),
        BlocProvider(
          create: (context) => ModeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: startWidget
          );
        },
      ),
    );
  }
}
