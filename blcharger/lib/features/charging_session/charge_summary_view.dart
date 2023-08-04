import 'package:flutter/material.dart';
import 'package:blcharger/features/payment/payment_view.dart';

class ChargeSummaryView extends StatelessWidget {
  final Duration elapsedTime;
  final double instantPower;
  final double consumedPower;
  final double instantPrice;

  const ChargeSummaryView({
    super.key,
    required this.elapsedTime,
    required this.instantPower,
    required this.consumedPower,
    required this.instantPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Resumo da Sessão de Carregamento'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Resumo da Sessão',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24.0),
            _buildSummaryItem(
              label: 'Tempo Decorrido:',
              value: elapsedTime.toString().split('.')[0],
            ),
            _buildSummaryItem(
              label: 'Energia Consumida:',
              value: '${consumedPower.toStringAsFixed(2)} kWh',
            ),
            _buildSummaryItem(
              label: 'Potência Final:',
              value: '${instantPower.toStringAsFixed(2)} kW',
            ),
            _buildSummaryItem(
              label: 'Valor Total:',
              value: 'R\$ ${instantPrice.toStringAsFixed(2)}',
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const PaymentView()),
            (Route<dynamic> route) => false,
          );
        },
        label: const Text(
          'Realizar pagamento',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(Icons.payment, color: Colors.white),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSummaryItem({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
