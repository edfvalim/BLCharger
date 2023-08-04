import 'package:flutter/material.dart';
import 'package:blcharger/features/home/home_view.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Pagamento'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeView()),
                    (Route<dynamic> route) => false,
                  );
                },
                label: const Text(
                  '???',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.payment, color: Colors.white),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
