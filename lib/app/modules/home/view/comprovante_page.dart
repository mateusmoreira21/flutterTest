import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:nubank_teste/app/modules/home/controller/home_store.dart';

class ComprovantePage extends StatefulWidget {
  final String title;
  const ComprovantePage({Key? key, this.title = 'ComprovantePage'})
      : super(key: key);
  @override
  ComprovantePageState createState() => ComprovantePageState();
}

class ComprovantePageState extends State<ComprovantePage> {
  final controller = Modular.get<HomeStore>();
  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Comprovante de \nagendamento',
                  style: TextStyle(fontSize: 28)),
              Text(
                  DateFormat("dd " + 'LLL'.toUpperCase() + " yyyy - hh:mm:ss",
                          "pt_BR")
                      .format(DateTime.parse(date.toString())),
                  style: TextStyle(fontSize: 17, color: Colors.grey)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Valor',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('R\$ 49,52',
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Agendado para',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(DateFormat("dd/MM/yyyy", "pt_BR")
                                .format(DateTime.parse(
                                    controller.selectedDate.toString())),
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pagador',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('Tadeu Caixeta Sousa',
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Agência',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('0001',
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Conta',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('57079839-1',
                    style: TextStyle(fontSize: 14, color: Colors.grey))
                  ],
                ),
              Divider(thickness: 1),
              ListTile(
                leading: Icon(Icons.document_scanner),
                title: Text('Documento',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Divider(thickness: 1),
              ListTile(
                leading: Text('Favorecido',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                trailing: Text('ALGAR TELECOM',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Linha Digitável',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Container(
                      width: 90,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Text(controller.codigoBarras,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 15, right: 15),
          color: Colors.grey[400],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Nu Pagamentos S.A.', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Text('CNPJ 18.236.120/0001-58', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            SizedBox(height: 10),
            Text('ID da transação: 60b6b233-52a7-47c1-baea-ba34d8f9v354', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Text('Estamos aqui para ajudar se você tiver alguma dúvida.', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          ],),
        ),
      ),
    );
  }
}
