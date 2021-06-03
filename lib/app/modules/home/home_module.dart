import 'package:flutter_modular/flutter_modular.dart';
import 'package:nubank_teste/app/modules/home/view/comprovante_page.dart';
import 'package:nubank_teste/app/modules/home/view/pagamento_page.dart';
import 'controller/home_store.dart'; 

import 'view/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => HomeStore()),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
   ChildRoute('/pagamento', child: (_, args) => PagamentoPage()),
   ChildRoute('/comprovante', child: (_, args) => ComprovantePage()),
 ];
}