import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/view_model.dart';
import '../widgets/item_widget.dart';
import '../widgets/status_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => ViewModel(),
      child: Consumer<ViewModel>(builder: (context, model, child) {
        return Column(children: [
          Row(
            children: model.sources.values
                .map((source) => StatusTile(
                      name: source.name,
                      status: source.state.index,
                    ))
                .toList(),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => model.getItems(),
              child: ListView.builder(
                itemCount: model.items.length,
                itemBuilder: (_, index) => ItemWidget(
                  model.items[index],
                  onDelete: model.delete,
                  onDismiss: model.dismiss,
                  onAdd: model.add,
                ),
              ),
            ),
          )
        ]);
      }),
    );
  }
}
