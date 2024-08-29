
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription? _subscription;
  NetworkCubit() : super(NetworkInitial());

   void connected(){
    emit(NetworkConnectedState());
   }

   void disconnected(){
    emit(NetworkDisconnectedState());
   }

  
  void checkConnection() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      print(result);
      if(result.contains(ConnectivityResult.none)){
        emit(NetworkDisconnectedState());
      }
      // } else if (result.contains(ConnectivityResult.none)) {
      //   disconnected();
      // }
    });
  }

    @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
  
}
