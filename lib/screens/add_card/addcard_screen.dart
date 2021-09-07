// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/constantas.dart';
import 'package:store_app/responsive.dart';
import 'package:store_app/screens/sign_up/components/screen_appbar.dart';
import 'package:store_app/widgets/cridetcard_widget.dart';
import 'package:store_app/widgets/default_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  int month = 00;
  int year = 00;
  int lastFourDigits = 3872;

  bool _isObsecured = true;
  void togglePasswordState() {
    setState(() {
      _isObsecured = !_isObsecured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: 'Add payment card',
        onMenuPressed: () {},
        onBackPressed: () {
          if (Navigator.canPop(context)) Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultHorizontalPadding,
            vertical: kDefaultVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CridetCardWidget(
                lastDigits: '3872',
                expDate: '$month' '/' '$year',
                cridet: 25.388,
                height: Responsive.getScreenHeight(context: context) * 0.25,
              ),
              SizedBox(height: kDefaultVerticalPadding * 2),
              Text(
                'Card Number',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kTitleTextColor),
              ),
              SizedBox(height: kDefaultVerticalPadding),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: kDefaultHorizontalPadding,
                    vertical: kDefaultVerticalPadding,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: kLightGreyColor.withOpacity(0.3),
                  hintText: '•••• •••• •••• 3872',
                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: kHintTextColor,
                        letterSpacing: ScreenUtil().setWidth(1.8),
                      ),
                ),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: kBodyTextColor,
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: ScreenUtil().setWidth(1.8),
                    ),
                maxLines: 1,
                maxLength: 16,
              ),
              SizedBox(height: kDefaultVerticalPadding),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Exp. Month',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kTitleTextColor),
                        ),
                        SizedBox(height: kDefaultHorizontalPadding / 2),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              month = int.parse(value as String);
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kLightGreyColor.withOpacity(0.3)),
                              ),
                              filled: true,
                              hintStyle: Theme.of(context).textTheme.bodyText1,
                              fillColor: kLightGreyColor.withOpacity(0.3)),
                          value: '01',
                          items: List<String>.generate(12, (index) {
                            if (index <= 8) {
                              return '0${index + 1}';
                            } else {
                              return '${index + 1}';
                            }
                          })
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: kDefaultHorizontalPadding / 2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exp. Year',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kTitleTextColor),
                        ),
                        SizedBox(height: kDefaultVerticalPadding / 2),
                        DropdownButtonFormField(
                          onChanged: (value) {
                            setState(() {
                              year = int.parse((value as String));
                              year = year % 2000;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kLightGreyColor.withOpacity(0.3)),
                              ),
                              filled: true,
                              hintStyle: Theme.of(context).textTheme.bodyText1,
                              fillColor: kLightGreyColor.withOpacity(0.3)),
                          value: '2022',
                          items: List<String>.generate(
                                  15, (index) => '${index + 2021}')
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: kDefaultHorizontalPadding / 2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: kTitleTextColor),
                        ),
                        SizedBox(height: kDefaultVerticalPadding / 2),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: kDarkGreyColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: kDefaultHorizontalPadding / 2,
                            ),
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.zero,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObsecured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kDarkGreyColor,
                                size: ScreenUtil().setHeight(20),
                              ),
                              splashRadius: ScreenUtil().setHeight(20),
                              onPressed: () {
                                togglePasswordState();
                              },
                            ),
                            filled: true,
                            fillColor: kLightGreyColor.withOpacity(0.3),
                            hintText: '•••',
                            hintStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: kHintTextColor,
                                      letterSpacing: ScreenUtil().setWidth(1.8),
                                    ),
                          ),
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: kBodyTextColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: _isObsecured,
                          maxLines: 1,
                          maxLength: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: Responsive.getScreenHeight(context: context) * 0.13),
              DefaultButton(
                text: 'Save card',
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'Card has been saved',
                    toastLength: Toast.LENGTH_SHORT,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    textColor: Colors.black54,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
