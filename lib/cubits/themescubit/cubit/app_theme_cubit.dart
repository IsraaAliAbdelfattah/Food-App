import 'package:audio_to_text_app/constant.dart';
import 'package:audio_to_text_app/enums/enums_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        if (sharedPreferences!.getString('theme') != null) {
          if (sharedPreferences!.getString('theme') == 'l') {
            emit(AppLightTheme());
          } else {
            emit(AppDarkTheme());
          }
        }
        break;
      case ThemeState.light:
        sharedPreferences!.setString('theme', 'l');
        emit(AppLightTheme());
        break;
      case ThemeState.dark:
        sharedPreferences!.setString('theme', 'd');
        emit(AppDarkTheme());
        break;
    }
  }
}
