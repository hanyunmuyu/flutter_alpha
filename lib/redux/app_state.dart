import 'ThemeRedux.dart';
import '../model/theme_model.dart';

class AppState {
  ThemeModel themeModel;

  AppState({ this.themeModel});
}

AppState appReducer(AppState state, action) {
  return AppState(
    themeModel: ThemeDataReducer(state.themeModel, action),
  );
}
