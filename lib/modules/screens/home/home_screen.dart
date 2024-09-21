import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/widgets/bg_widget/custom_bg.dart';
import 'package:news_app/core/widgets/custom/custom_container.dart';
import 'package:news_app/models/categories_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Custom_Bg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "News App",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                    child: Text(
                      "News App!",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
                title: const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.black,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Pick your Category\n of interest",
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: CategoriesData.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 176 / 210),
                  itemBuilder: (context, index) {
                    return CustomContainerCategories(
                      categorie: CategoriesData.categories[index],
                      isRight: index % 2 == 0,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
