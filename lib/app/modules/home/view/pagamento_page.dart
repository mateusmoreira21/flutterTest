import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:nubank_teste/app/modules/home/controller/home_store.dart';

class PagamentoPage extends StatefulWidget {
  const PagamentoPage({Key? key}) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  final controller = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent[700],
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 50),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              Container(
                child: Column(
                  children: [
                    customText1('Você está pagando'),
                    valorConta('R\$ 74,55'),
                    customText2('Saldo disponível atual: R\$ 2.578,14'),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on_outlined),
                      title: Text('Pagando com',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      trailing: Text('conta',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                    Observer(builder: (_) {
                      return ListTile(
                        leading: Icon(Icons.date_range_outlined),
                        title: Text('Agendamento para',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                        trailing: TextButton(
                            onPressed: () {
                              controller.selectDate(context);
                            },
                            child: Text(DateFormat("dd/MM/yyyy", "pt_BR")
                                .format(DateTime.parse(
                                    controller.selectedDate.toString()))),
                            style: TextButton.styleFrom(
                                primary: Colors.purpleAccent[700],
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700))),
                      );
                    }),
                    Container(
                      color: Colors.grey[200],
                      height: 150,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('Para',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            trailing: Text('CEMIG DISTRIBUIÇÃO',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ),
                          ListTile(
                            minVerticalPadding: 40,
                            leading: Text('Codigo do \nboleto',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            trailing: SizedBox.fromSize(
                              size: Size.fromWidth(150),
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  Expanded(
                                    child: Text(controller.codigoBarras,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Modular.to.pushReplacementNamed('/comprovante');
                  },
                  child: Text('Confirmar Agendamento'),
                  style: TextButton.styleFrom(
                      primary: Colors.purpleAccent[700],
                      textStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700))),
            ],
          ),
        ),
      ),
    );
  }

  firstBox() {
    return Stack(
      children: [
        customText1('Você está pagando'),
        valorConta('R\$ 74,55'),
        customText2('Saldo disponível atual: R\$ 2.578,14'),
      ],
    );
  }

  Padding valorConta(String valor) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(valor,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
    );
  }

  Padding customText1(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(text, style: TextStyle(fontSize: 22)),
    );
  }

  Padding customText2(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(text, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }
}
