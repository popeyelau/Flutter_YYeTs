import 'package:redux/redux.dart';
import 'package:yyets/models/comment.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/main.dart';

class DynamicViewModel extends ViewModel {
  DynamicViewModel(Store<ReduxState> store) : super(store);

  List<Comment> get comments => this
      .store
      .state
      .dynamics
      .comments
      .where((v) => v.resourceInfo != null)
      .toList();

  List<Help> get helps => this.store.state.dynamics.helps;
  bool get isLoading => this.store.state.dynamics.isLoading;
}
