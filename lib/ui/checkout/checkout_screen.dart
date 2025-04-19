import 'package:flutter/material.dart';
import 'package:imersao_flutter/model/dish.dart';
import 'package:imersao_flutter/ui/_core/app_colors.dart';
import 'package:imersao_flutter/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalEntrega = 6.00;
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text("Limpar"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Pedidos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return Card(
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/dishes/default.png',
                          width: 50.0,
                          height: 48,
                        ),
                        title: Text(dish.name),
                        subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                bagProvider.removeDishFromBag(dish);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              bagProvider.getMapByAmount()[dish].toString(),
                              style: TextStyle(fontSize: 18.0),
                            ),
                            IconButton(
                              onPressed: () {
                                bagProvider.addAllDishesToBag([dish]);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (bagProvider.dishesOnBag.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pagamento",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/others/visa.png',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Visa Classic'),
                                Text('****-0976'),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              color: AppColors.mainColor,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Entregar no endereço:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          spacing: 12.0,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.pin_drop_rounded),
                            Column(
                              children: [
                                Text(
                                  'Rua das Acácias, 28',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text('Casa 10'),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              color: AppColors.mainColor,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          spacing: 10.0,
                          children: [
                            Row(
                              children: [
                                Text('Pedido: '),
                                Spacer(),
                                Text(
                                  "R\$${bagProvider.getTotalPrice().toStringAsFixed(2)}",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Entrega: '),
                                Spacer(),
                                Text("R\$${totalEntrega.toStringAsFixed(2)}"),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Total: '),
                                Spacer(),
                                Text(
                                  "R\$${(bagProvider.getTotalPrice() + totalEntrega).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  spacing: 8.0,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    Text(
                                      'Pedir',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
