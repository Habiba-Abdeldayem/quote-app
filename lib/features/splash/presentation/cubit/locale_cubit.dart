
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/utils/app_strings.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(ChangeLocaleState(
    Locale(AppStrings.englishCode),
  ));

  // get saved language (from shared prefs)

  // change language
}
