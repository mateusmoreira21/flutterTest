// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller/home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$codigoBarrasAtom = Atom(name: 'HomeStoreBase.codigoBarras');

  @override
  String get codigoBarras {
    _$codigoBarrasAtom.reportRead();
    return super.codigoBarras;
  }

  @override
  set codigoBarras(String value) {
    _$codigoBarrasAtom.reportWrite(value, super.codigoBarras, () {
      super.codigoBarras = value;
    });
  }

  final _$selectedDateAtom = Atom(name: 'HomeStoreBase.selectedDate');

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  final _$leitorCodigoBarrasAsyncAction =
      AsyncAction('HomeStoreBase.leitorCodigoBarras');

  @override
  Future<void> leitorCodigoBarras() {
    return _$leitorCodigoBarrasAsyncAction
        .run(() => super.leitorCodigoBarras());
  }

  final _$selectDateAsyncAction = AsyncAction('HomeStoreBase.selectDate');

  @override
  Future selectDate(BuildContext context) {
    return _$selectDateAsyncAction.run(() => super.selectDate(context));
  }

  @override
  String toString() {
    return '''
codigoBarras: ${codigoBarras},
selectedDate: ${selectedDate}
    ''';
  }
}
