import 'package:ecommerce_flutter_admin/constans/theme_data.dart';
import 'package:ecommerce_flutter_admin/provider/product_provider.dart';
import 'package:ecommerce_flutter_admin/provider/theme_provider.dart';
import 'package:ecommerce_flutter_admin/screens/DashboardScreen.dart';
import 'package:ecommerce_flutter_admin/screens/editorUploadProduct.dart';
import 'package:ecommerce_flutter_admin/screens/search_screen.dart';
import 'package:ecommerce_flutter_admin/widget/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return ThemeProvider();
          }),
          ChangeNotifierProvider(create: (_) {
            return ProductProvider();
          }),
        ],
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eccomerce Ap ',
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),

            //    home:const LoginScreen(),
            home: const DashboardScreen(),
            routes: {
              OrderScreen.routName: (context) => const OrderScreen(),
              SearchScreen.routName: (context) => const SearchScreen(),
              EditorUploadProductScreen.routName: (context) =>
                  const EditorUploadProductScreen(),
            },
          );
        }));
  }
}
