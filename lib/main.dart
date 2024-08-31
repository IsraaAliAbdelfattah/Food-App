import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/cubits/food_cubit/food_cubit_cubit.dart';
import 'package:audio_to_text_app/cubits/show_favourite_cubit/cubit/show_favourite_cubit.dart';
import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/cubits/themescubit/cubit/app_theme_cubit.dart';
import 'package:audio_to_text_app/enums/enums_theme.dart';
import 'package:audio_to_text_app/firebase_options.dart';
import 'package:audio_to_text_app/models/food_model.dart';
import 'package:audio_to_text_app/simple_block_observer.dart';
import 'package:audio_to_text_app/views/auth/login.dart';
import 'package:audio_to_text_app/views/getstarted_view.dart';
import 'package:audio_to_text_app/widgets/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();
  Hive.registerAdapter(FoodModelAdapter());
  FoodCubit.kfoodboxBox = await Hive.openBox<FoodModel>(kfoodbox);
  ShowFavouriteCubit.favouriteboxBox =
      await Hive.openBox<FoodModel>(favouritebox);
  ShowHistoryCubit.historyboxBox = await Hive.openBox<FoodModel>(historybox);
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const FoodApp());
}

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});

  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
   @override
  void initState() {
     super.initState();
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
   print(FirebaseAuth.instance.currentUser);
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodCubit()),
        BlocProvider(create: (context) => ShowFavouriteCubit()),
        BlocProvider(create: (context) => ShowHistoryCubit()),
        BlocProvider(
            create: (context) =>
                AppThemeCubit()..changeTheme(ThemeState.initial))
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is AppLightTheme) {
            return MaterialApp(
              theme: ThemeData.light(),
              routes: {
                Login.id: (context) => const Login(),
                CustomBottomNavigationBar.id:(context)=>const CustomBottomNavigationBar(),
              },
              home:const GetstartedView(),
            );
          } else {
            return MaterialApp(
              theme: ThemeData.dark(),
              routes: {
                Login.id: (context) => const Login(),
                CustomBottomNavigationBar.id:(context)=>const CustomBottomNavigationBar(),
              },
              home:const GetstartedView() ,
            );
          }
        },
      ),
    );
  }
}
