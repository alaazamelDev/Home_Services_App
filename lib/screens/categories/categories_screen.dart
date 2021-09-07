import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/categories/components/category_card.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/option_button.dart';
import 'package:store_app/widgets/search_field.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, this.onBackPressed}) : super(key: key);
  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ScreenAppBar(
        title: 'Categories',
        onBackPressed: () {
          onBackPressed!();
        },
        onMenuPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: kDefaultVerticalPadding / 2,
              horizontal: kDefaultHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchField(
                onChanged: (value) {},
              ),
              SizedBox(height: kDefaultVerticalPadding),
              Column(
                children: List.generate(
                  categoriesList.length,
                  (index) => CategoryCard(
                    category: categoriesList[index],
                  ),
                ),
              ),
              SizedBox(height: kDefaultVerticalPadding),
              Row(
                children: [
                  OptionButton(
                    text: 'Back',
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(width: kDefaultHorizontalPadding),
                  OptionButton(
                    text: 'Next',
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/orders_screen');
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
