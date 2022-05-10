import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/data/models/data_model.dart';
import 'package:riverpoddemo/data/services/remote_services.dart';

final cc =
    StateNotifierProvider<Counternotifier, Data?>((ref) => Counternotifier());

class Counternotifier extends StateNotifier<Data?> {
  Counternotifier() : super(Data(user: 'bum', fakedatabase: 0));
  void mycounter() async {
    state = await RemoteServices.fetchdata();
  }

  void add(Data d) async {
    await RemoteServices.increment(d);
  }

  void substract(Data d) async {
    await RemoteServices.decrement(d);
  }
}
