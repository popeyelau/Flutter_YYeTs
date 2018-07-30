import 'package:flutter/foundation.dart';
import 'package:yyets/models/lib_resource.dart';
import 'package:yyets/models/resource_category.dart';

@immutable
class LibState {
  final List<LibResource> resources;
  final List<LibResource> filtedResources;
  final ResourceCategory category;
  final bool isLoading;

  LibState(
      {this.resources, this.filtedResources, this.category, this.isLoading});

  LibState copyWith(
      {List<LibResource> resources,
      List<LibResource> filtedResources,
      ResourceCategory category,
      bool isLoading}) {
    return LibState(
        resources: resources ?? this.resources,
        filtedResources: filtedResources ?? this.filtedResources,
        category: category ?? this.category,
        isLoading: isLoading ?? this.isLoading);
  }

  LibState.initialState()
      : resources = [],
        filtedResources = [],
        category = ResourceCategory.initialState(),
        isLoading = true;
}
