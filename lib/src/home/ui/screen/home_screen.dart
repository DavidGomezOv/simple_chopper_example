import 'package:flutter/material.dart';
import 'package:simple_chopper_example/src/home/ui/widgets/item_list_widget.dart';
import 'package:simple_chopper_example/src/home/view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Column(
              children: [
                const Text('Flutter Chopper Example'),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.itemList.length,
                    itemBuilder: (context, index) => ItemListWidget(
                      item: viewModel.itemList[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
