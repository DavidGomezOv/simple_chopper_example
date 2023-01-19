import 'package:flutter/material.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';
import 'package:simple_chopper_example/src/home/view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class ItemListWidget extends ViewModelWidget<HomeViewModel> {
  final ItemListModel item;

  const ItemListWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => ListTile(
        title: Text(item.title ?? 'Title'),
        subtitle: Text(item.subtitle ?? 'Subtitle'),
      );
}
