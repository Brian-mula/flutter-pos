import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos/providers/product_providers.dart';
import 'package:pos/widgets/cutome_text.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final products = ref.watch(allProducts);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 35,
            )),
        centerTitle: true,
        elevation: 0.0,
        title: CustomeText(
          text: "Products",
          textStyle: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/new-product");
              },
              icon: const Icon(
                Icons.add,
                size: 20,
              ))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: products.when(
              data: (data) {
                if (data.isEmpty) {
                  const CustomeText(text: "You don't have any products");
                } else {
                  ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                leading: Container(
                                  height: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.blue,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://cdn.pixabay.com/photo/2016/03/05/22/21/baked-1239259__340.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                title: CustomeText(text: data[index].title),
                                subtitle: CustomeText(
                                    text: data[index].price.toString()),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black54,
                                  size: 24,
                                ),
                              ),
                            ),
                          ));
                }
                return null;
              },
              error: (error, trace) => CustomeText(text: error.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
