import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/screens/orders/components/order_card.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/option_button.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isArchiveSelected = false; //to toggle option buttons color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Orders in progress',
        onBackPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        onMenuPressed: () {},
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultHorizontalPadding,
              ),
              child: StaggeredGridView.countBuilder(
                mainAxisSpacing: kDefaultVerticalPadding,
                crossAxisSpacing: ScreenUtil().setWidth(20),
                crossAxisCount: 2,
                itemCount: worksList.length,
                itemBuilder: (context, index) => OrderCard(
                  work: worksList[index],
                  onItemPressed: (item) {
                    //Go to the Specific Job
                    Navigator.pushNamed(
                      context,
                      '/selected',
                      arguments: {kActivityTitleKey: item.name},
                    );
                  },
                ),
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, -20), // changes position of shadow
              ),
            ]),
            padding: EdgeInsets.only(
              left: kDefaultHorizontalPadding,
              right: kDefaultHorizontalPadding,
              bottom: kDefaultVerticalPadding,
            ),
            child: Row(
              children: [
                OptionButton(
                  onPressed: () {
                    setState(() {
                      isArchiveSelected = true;
                    });
                  },
                  text: 'Archive',
                  color: isArchiveSelected ? kPrimaryColor : Colors.white,
                ),
                SizedBox(width: kDefaultHorizontalPadding / 2),
                OptionButton(
                  onPressed: () {
                    setState(() {
                      isArchiveSelected = false;
                    });
                  },
                  text: 'In work',
                  color: !isArchiveSelected ? kPrimaryColor : Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
