import 'package:flutter/material.dart';
import 'package:telas/components/add_voucher_widget.dart';
import 'package:telas/components/button_clear_widget.dart';
import 'package:telas/components/componente_final_widget.dart';
import 'package:telas/components/controller_voucher_button_widget.dart';
import 'package:telas/components/finaliza_widget.dart';
import 'package:telas/services/controla_voucher.dart';
import 'package:telas/services/shared_preferences.dart';
import 'package:telas/services/via_cep.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  String novoCep = 'insira um cep';
  double valorVoucher = 0;
  late double priceFinal;
  Color colorDesconto = Colors.black;
  double flag = 0;

  verifica(){
    bool colorController = SharedPreferencesRepository.getBool('colorDesconto');
    if(colorController){
      colorDesconto = Colors.green;
    }
    else {
      colorDesconto = Colors.black;
    }
  }

  @override
  void initState() {
    SharedPreferencesRepository.init();
    priceFinal = SharedPreferencesRepository.getDouble('priceFinal');
    SharedPreferencesRepository.putDouble('flag', flag);
    SharedPreferencesRepository.putDouble('valorVoucher', valorVoucher);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pagamento',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text(
                'Limpar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
            )
          ],
        ),
        centerTitle: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Endereço de entrega",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), //Endereço para entrega
              Container(
                margin: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Image.asset(
                        'assets/mapa.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              top: BorderSide(color: Colors.grey))),
                      height: 40,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                novoCep,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, setState) =>
                                              Voucher(
                                            title: 'Insira um CEP',
                                          ),
                                        );
                                      }).then((text) {
                                    Future _searchCep() async {
                                      final cep = text;
                                      final response =
                                          await ViaCepService.fetchCep(
                                              cep: cep);
                                      setState(() {
                                        novoCep =
                                            '${response.logradouro}, ${response.bairro}, ${response.localidade} - ${response.uf}';
                                      });
                                    }

                                    _searchCep();
                                  });
                                },
                                icon: Icon(Icons.drive_file_rename_outline,
                                    size: 30),
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              // Mapa
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                width: double.infinity,
                child: Text(
                  "Método de pagamento",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), //Metodo de pagamento
              ClipRRect(
                child: Image.asset('assets/cartao.png'),
                borderRadius: BorderRadius.circular(15),
              ), // Imagem Cartão
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: 50,
                  child: LimpaCompra(
                    icon: Icons.cleaning_services_outlined,
                    title: 'Excluir Voucher',
                    statusColor: Colors.red,
                    press: () async {
                      await Services().RemoveVoucher();
                      setState(() {
                        valorVoucher =
                            SharedPreferencesRepository.getDouble('valorVoucher');
                        priceFinal =
                            SharedPreferencesRepository.getDouble('priceFinal');
                        verifica();
                      });
                    },
                  ),
                ),
              ),
              ControllerVoucher(
                statusColor: Colors.deepOrange,
                icon: Icons.add,
                title: 'Adicionar Voucher',
                func: () async {
                  await Services().addVoucher(context);
                  setState(() {
                    valorVoucher =
                        SharedPreferencesRepository.getDouble('valorVoucher');
                    priceFinal =
                        SharedPreferencesRepository.getDouble('priceFinal');
                    verifica();
                  });
                },
              ),
              FinalPrice(
                statusColor: colorDesconto,
                valor: valorVoucher.toStringAsFixed(2),
                taxa: "Voucher",
                func: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) =>
                              FinalVoucher(),
                        );
                      });
                },
                price: priceFinal,
                buttontitle: 'Confirmar Pedido',
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
