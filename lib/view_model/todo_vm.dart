import 'package:flutter_grpc/view_model/base_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final mealViewModelProvider = ChangeNotifierProvider(
  (_) => TodoViewModel(),
);



class TodoViewModel extends BaseViewModel{

  
}