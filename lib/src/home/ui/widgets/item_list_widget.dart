import 'package:flutter/material.dart';
import 'package:simple_chopper_example/src/home/model/item_list_model.dart';
import 'package:simple_chopper_example/src/home/view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class ItemListWidget extends ViewModelWidget<HomeViewModel> {
  final ItemListModel item;
  final GestureTapCallback? onTap;

  const ItemListWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) => Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: onTap,
          child: ListTile(
            title: Text(
              item.title ?? 'Title',
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(item.subtitle ?? 'Subtitle'),
          ),
        ),
      );
}
