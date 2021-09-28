import 'package:cooking/utils/constants.dart';
import 'package:cooking/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GoalPoll extends StatelessWidget {
  const GoalPoll({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: _pageAppBar(),
        body: _pageBody(),
      );

  Widget _pageBody() => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _question(),
          Constants.normalVerticalSpacer,
          _items(),
          Constants.normalVerticalSpacer,
          _notKnowItem(),
        ],
      );

  PreferredSizeWidget _pageAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'تعیین هدف',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      );

  Widget _question() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'دنبال چه رژیمی هستی؟',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      );

  Widget _items() => Wrap(
        runSpacing: Dimens.normalVerticalSpace,
        spacing: Dimens.normalHorizontalSpace,
        children: [
          _dummyItem(),
          _dummyItem(),
          _dummyItem(),
          _dummyItem(),
        ],
      );

  Widget _dummyItem() => Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.semiRoundBorderRadius),
              border: Border.all(
                color: const Color(0xff0096C7),
                width: 1.0,
              ),
            ),
            child: const Center(
              child: Icon(Icons.email),
            ),
          ),
          // Constants.smallVerticalSpacer,
          const Text(
            'عنوان مورد',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        ],
      );

  Widget _notKnowItem() => Center(
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.rectangleBorderRadius),
            border: Border.all(color: const Color(0xff0077B6), width: 1.0),
            color: const Color(0x88ADE8F4),
          ),
          alignment: Alignment.center,
          child: const Text(
            'نمیدونم؟',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
}
