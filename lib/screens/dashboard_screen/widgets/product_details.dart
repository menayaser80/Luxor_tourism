import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/namewidget.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip%20provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/heartbtn.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';


class ProductDetailsScreen extends StatefulWidget {
  static const routName = "/ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider = Provider.of<HomeProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productId!);
    final cartProvider = Provider.of<TripProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        // automaticallyImplyLeading: false,
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: getCurrProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrProduct.PlaceImage,
              height: size.height * 0.38,
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                        "Title:${getCurrProduct.PlaceTitle}",
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeartButtonWidget(
                          bkgColor: Colors.blue.shade100,
                          productId: getCurrProduct.PlaceId,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    30.0,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (cartProvider.isProdinCart(
                                    productId:
                                    getCurrProduct.PlaceId)) {
                                  return;
                                }
                                try {
                                  await cartProvider.addToCartFirebase(
                                      productId: getCurrProduct.PlaceId,
                                      qty: 1,
                                      context: context);
                                } catch (e) {
                                  await MyAppFunctions
                                      .showErrorOrWarningDialog(
                                    context: context,
                                    subtitle: e.toString(),
                                    fct: () {},
                                  );
                                }
                              },
                              icon: Icon(
                                cartProvider.isProdinCart(
                                    productId:
                                    getCurrProduct.PlaceId)
                                    ? Icons.check
                                    : Icons.add_shopping_cart_outlined,
                              ),
                              label: Text(cartProvider.isProdinCart(
                                  productId: getCurrProduct.PlaceId)
                                  ? "In trip"
                                  : "Add to MyTrip"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SubtitleTextWidget(
                    label: "Ticket for student:${getCurrProduct.TicketforStudent}\$",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubtitleTextWidget(
                    label: "Ticket for Adult:${getCurrProduct.Ticketforadult}\$",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(

                    children: [
                      const TitlesTextWidget(label: "category:"),
                      SubtitleTextWidget(
                          label: "In ${getCurrProduct.PlaceCategory}"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const TitlesTextWidget(label:"Description:"),
                      SubtitleTextWidget(
                          label: "${getCurrProduct.PlaceDescription}"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}