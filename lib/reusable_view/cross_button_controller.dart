import 'package:get/get.dart';

class CrossButtonController extends GetxController{
   
 RxBool showClearButton=false.obs;

 void onTextChanged(String text){
  showClearButton.value=text.isNotEmpty;
 }
}