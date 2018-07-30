import 'package:redux/redux.dart';
import 'package:yyets/models/profile.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/main.dart';

class ProfileViewModel extends ViewModel {
  ProfileViewModel(Store<ReduxState> store) : super(store);

  Profile get profile => this.store.state.profile.profile;
}
