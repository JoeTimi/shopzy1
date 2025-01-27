import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  const OrderConfirmation({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => OrderConfirmation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset(
                    'assets/svgs/garlands.svg',
                    height: 100,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Your order is complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Massimo,',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Thank you for purchasing on Zero To Unicorn.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ORDER CODE: #k321-ekd3',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  Text(
                    'ORDER DETAILS',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ProductCard.summary(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                      ProductCard.summary(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
