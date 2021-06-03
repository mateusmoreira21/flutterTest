import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part '../home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String codigoBarras = '';

  @observable
  DateTime selectedDate = DateTime.now();

  @action
  Future<void> leitorCodigoBarras() async {
    String? barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', 'Cancelar', true, ScanMode.BARCODE);
    if (barcodeScanRes == '-1') {
      Exception('error');
    } else {
      codigoBarras = barcodeScanRes;
      Modular.to.pushNamed('/pagamento');
    }
  }

  @action
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) selectedDate = picked;
  }
}
