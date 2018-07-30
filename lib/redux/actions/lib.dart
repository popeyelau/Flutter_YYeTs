import 'package:yyets/models/lib_resource.dart';
import 'package:yyets/models/resource_category.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateLibResources extends ActionType {
  String get type => ReduxActions.updateLibResources;
  final List<LibResource> payload;
  UpdateLibResources({this.payload});
}

class UpdateFiltedResources extends ActionType {
  String get type => ReduxActions.updateFiltedResources;
  final List<LibResource> payload;
  UpdateFiltedResources({this.payload});
}

class UpdateResourceCategory extends ActionType {
  String get type => ReduxActions.updateResourceCategory;
  final ResourceCategory payload;
  UpdateResourceCategory({this.payload});
}
