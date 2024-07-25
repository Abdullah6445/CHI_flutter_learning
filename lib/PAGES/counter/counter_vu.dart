import 'package:firebase_project_practice/PAGES/counter/counter_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CounterVU extends StackedView<CounterVM> {
  const CounterVU({super.key});

  @override
  Widget builder(BuildContext context, CounterVM viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          children: [
            Text(viewModel.count.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  viewModel.counter();
                },
                child: const Text('Press'))
          ],
        ),
      ),
    );
  }

  @override
  CounterVM viewModelBuilder(BuildContext context) {
    // TODO: im
    return CounterVM();
  }
}
