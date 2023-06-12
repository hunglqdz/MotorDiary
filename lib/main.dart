import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (_) => MyTextFieldValue(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
        widget: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0,
          color: background,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 90,
              ),
              child:
                  Image.asset('assets/illustration.jpg', color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Manage your private vehicle',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    )),
    PageModel(
        widget: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0,
          color: background,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 90,
              ),
              child:
                  Image.asset('assets/illustration.jpg', color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change the oil just in time',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    )),
    PageModel(
        widget: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0,
          color: background,
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 90,
              ),
              child:
                  Image.asset('assets/illustration.jpg', color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Extend the lifespan of your vehicle',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    )),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _setupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Set up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motor Diary',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding: const EdgeInsets.all(45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                          netDragPercent: dragDistance,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.line(
                              lineDesign: LineDesign(
                                lineType: DesignType.line_nonuniform,
                              ),
                            ),
                          ),
                          pagesLength: pagesLength),
                      index == pagesLength - 1
                          ? _setupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTextFieldValue extends ChangeNotifier {
  String _text = '';

  String get text => _text;

  void setText(String newText) {
    _text = newText;
    notifyListeners();
  }
}
