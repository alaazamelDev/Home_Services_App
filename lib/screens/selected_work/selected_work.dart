import 'package:flutter/material.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/models/work.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/selected_work/components/work_card.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/option_button.dart';
import 'package:store_app/widgets/search_field.dart';

class SelectedWork extends StatefulWidget {
  const SelectedWork({Key? key}) : super(key: key);

  @override
  State<SelectedWork> createState() => _SelectedWorkState();
}

class _SelectedWorkState extends State<SelectedWork> {
  List<Work> selectedWorks = [];
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: ScreenAppBar(
        title: data[kActivityTitleKey],
        onBackPressed: () {
          Navigator.pop(context);
        },
        onMenuPressed: () {},
      ),
      body: AnimatedContainer(
        duration: const Duration(
          milliseconds: 250,
        ),
        decoration: activityBoxDecoration.copyWith(color: Colors.white),
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: kDefaultVerticalPadding / 2,
              bottom: kDefaultVerticalPadding,
              left: kDefaultHorizontalPadding,
              right: kDefaultHorizontalPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchField(
                  onChanged: (value) {},
                ),
                const Spacer(),
                SizedBox(
                  height: Responsive.getScreenHeight(context: context) * 0.65,
                  child: ListView.builder(
                    itemCount: worksList.length,
                    itemBuilder: (context, index) => WorkCard(
                      work: worksList[index],
                      onItemSelected: (item) {
                        setState(() {
                          item.isSelected = !item.isSelected;
                          if (item.isSelected &&
                              !selectedWorks.contains(item)) {
                            selectedWorks.add(item);
                          } else if (!item.isSelected &&
                              selectedWorks.contains(item)) {
                            selectedWorks.remove(item);
                          }
                        });
                      },
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    OptionButton(
                      onPressed: () {},
                      text: 'Skip',
                      color: Colors.white,
                    ),
                    SizedBox(width: kDefaultHorizontalPadding),
                    OptionButton(
                      onPressed: () {
                        //get the selected elemnt and pass it to payment screen
                        Navigator.pushNamed(context, '/payment',
                            arguments: selectedWorks);
                      },
                      text: 'Done',
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
