import 'package:flutter/material.dart';
import 'package:telas/components/add_voucher_widget.dart';
import 'package:telas/services/shared_preferences.dart';

class Services {

  double flag = SharedPreferencesRepository.getDouble('flag');


  addVoucher(context) async {

    String codDesconto40 = "patraoMaluco";
    String codDesconto15 = "saborzinho";
    String errorMensagem = 'Código Inválido';
    double aux;
    double priceAnterior;
    double priceFinal = SharedPreferencesRepository.getDouble('priceFinal');
    double valorVoucher = SharedPreferencesRepository.getDouble('valorVoucher');

    var text = await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) =>
                Voucher(
                  title: 'Insira um código',
                ),
          );
        });

    if (flag == 1) {
      errorMensagem = 'Código já Cadastrado';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          content: Text(
            errorMensagem,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      );
      return;
    }
    if ((text == codDesconto40 || text == codDesconto15)) {
      SharedPreferencesRepository.putDouble('flag', 1);
      valorVoucher = (priceFinal / 100) * (text == codDesconto40 ? 40 : 15);
      if (valorVoucher == 0) {
        SharedPreferencesRepository.putBool('colorDesconto', false);
      } else {
        valorVoucher = valorVoucher * -1;
        SharedPreferencesRepository.putBool('colorDesconto', true);
      }
      aux = priceFinal;
      priceAnterior = priceFinal;
      aux += valorVoucher;
      SharedPreferencesRepository.putDouble('priceAnterior', priceAnterior);
      SharedPreferencesRepository.putDouble('priceFinal', aux);
      priceFinal = SharedPreferencesRepository.getDouble('priceFinal');

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          content: Text(
            'Código Inválido',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    SharedPreferencesRepository.putDouble('priceFinal', priceFinal);
    SharedPreferencesRepository.putDouble('valorVoucher', valorVoucher);
  }

  RemoveVoucher() {
    if (flag == 1) {
      double priceAnterior = SharedPreferencesRepository.getDouble('priceAnterior');
      SharedPreferencesRepository.putDouble('priceFinal', priceAnterior );
      SharedPreferencesRepository.putDouble('flag', 0);
      SharedPreferencesRepository.putDouble('valorVoucher', 0);
      SharedPreferencesRepository.putBool('colorDesconto', false);
    }
    else{
      SharedPreferencesRepository.putBool('colorDesconto', false);
    }
  }

}
