import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bs_flutter/bs_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('bs_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await BsFlutter.platformVersion, '42');
  });

  test('allComponents', () async {
    BsFlutterTest();
  });
}

class BsFlutterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BsContainer(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Scrollbar(child: SingleChildScrollView(
            child: Column(
                children: [
                  BsRow(
                    children: [
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        child: Wrap(
                          children: [
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              prefixIcon: Icons.block,
                              label: Text('Primary'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              prefixIcon: Icons.block,
                              label: Text('Secondary'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.success,
                              prefixIcon: Icons.block,
                              label: Text('Success'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.danger,
                              prefixIcon: Icons.block,
                              label: Text('Danger'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.warning,
                              prefixIcon: Icons.block,
                              label: Text('Warning'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.info,
                              prefixIcon: Icons.block,
                              label: Text('Info'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.light,
                              prefixIcon: Icons.block,
                              label: Text('Light'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.dark,
                              prefixIcon: Icons.block,
                              label: Text('Dark'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(bottom: 10.0),
                              onPressed: () {},
                              size: BsButtonSize.btnIconMd,
                              prefixIcon: Icons.check,
                            )
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        child: Wrap(
                          children: [
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlinePrimary,
                              label: Text('Outline Primary'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineSecondary,
                              label: Text('Outline Secondary'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineSuccess,
                              label: Text('Outline Success'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineDanger,
                              label: Text('Outline Danger'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineInfo,
                              label: Text('Outline Info'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineLight,
                              label: Text('Outline Light'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.outlineDark,
                              label: Text('Outline Dark'),
                            ),
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        child: Wrap(
                          children: [
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnSm,
                              label: Text('Small'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              label: Text('Medium'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnLg,
                              label: Text('Large'),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnIconSm,
                              prefixIcon: Icons.check,
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnIconMd,
                              prefixIcon: Icons.check,
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnIconLg,
                              prefixIcon: Icons.check,
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnSm,
                              label: Text('Small'),
                              prefixIcon: Icons.calendar_today,
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              label: Text('Medium'),
                              prefixIcon: Icons.calendar_today,
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnLg,
                              label: Text('Large'),
                              prefixIcon: Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        padding: EdgeInsets.only(left: 10.0),
                        child: Wrap(
                          children: [
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnSm,
                              label: Text('Small'),
                              prefixIcon: Icons.edit,
                              badge: BsBadge(
                                style: BsBadgeStyle.info,
                                size: BsBadgeSize.small,
                                child: Text('4'),
                              ),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnMd,
                              label: Text('Notification'),
                              prefixIcon: Icons.calendar_today,
                              badge: BsBadge(
                                style: BsBadgeStyle.warning,
                                child: Text('4'),
                              ),
                            ),
                            BsButton(
                              margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                              onPressed: () {},
                              style: BsButtonStyle.primary,
                              size: BsButtonSize.btnLg,
                              label: Text('Notification'),
                              prefixIcon: Icons.calendar_today,
                              badge: BsBadge(
                                style: BsBadgeStyle.success,
                                size: BsBadgeSize.large,
                                child: Text('4'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        child: Wrap(
                          children: [
                            BsBadge(
                              style: BsBadgeStyle.primary,
                              size: BsBadgeSize.rounded,
                              child: Text('Primary'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.secondary,
                              size: BsBadgeSize.rounded,
                              child: Text('Secondary'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.success,
                              size: BsBadgeSize.rounded,
                              child: Text('Success'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.warning,
                              size: BsBadgeSize.rounded,
                              child: Text('Warning'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.danger,
                              size: BsBadgeSize.rounded,
                              child: Text('Danger'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.info,
                              size: BsBadgeSize.rounded,
                              child: Text('Info'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.light,
                              size: BsBadgeSize.rounded,
                              child: Text('Light'),
                            ),
                            BsBadge(
                              style: BsBadgeStyle.dark,
                              size: BsBadgeSize.rounded,
                              child: Text('Dark'),
                            )
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize.all(Col.col_12),
                        child: BsRow(
                          gutter: EdgeInsets.only(left: 10.0, right: 10.0),
                          children: [
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                child: Text('Alert Primary'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.secondary,
                                child: Text('Alert Secondary'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.success,
                                child: Text('Alert Success'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.danger,
                                child: Text('Alert Danger'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.warning,
                                child: Text('Alert Warning'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.info,
                                child: Text('Alert Info'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.light,
                                child: Text('Alert Light'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize(md: Col.col_4),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.dark,
                                child: Text('Alert Dark'),
                              ),
                            ),
                            BsCol(
                              margin: EdgeInsets.only(bottom: 10.0),
                              sizes: ColSize.all(Col.col_12),
                              child: BsAlert(
                                closeButton: true,
                                margin: EdgeInsets.only(bottom: 10.0),
                                style: BsAlertStyle.success,
                                heading: Text('Hello World'),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Alert Dark'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  BsRow(
                    children: [
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Wrap(
                          children: [
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Small Modal'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  size: BsModalSize.sm,
                                  child: BsModalContent(
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Default Modal'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  child: BsModalContent(
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Large Modal'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  size: BsModalSize.lg,
                                  child: BsModalContent(
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Extra Large Modal'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  size: BsModalSize.xl,
                                  child: BsModalContent(
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Extra extra Large Modal'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  size: BsModalSize.xxl,
                                  child: BsModalContent(
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            BsButton(
                              style: BsButtonStyle.primary,
                              margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
                              label: Text('Centered Small Modal with No Radius'),
                              onPressed: () => showDialog(context: context, builder: (context) => BsModal(
                                context: context,
                                dialog: BsModalDialog(
                                  size: BsModalSize.sm,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  child: BsModalContent(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    children: [
                                      BsModalContainer(title: Text('Content'), closeButton: true),
                                      BsModalContainer(
                                        child: Column(
                                            children: [
                                              Text('Content')
                                            ]
                                        ),
                                      ),
                                      BsModalContainer(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        actions: [
                                          BsButton(
                                            style: BsButtonStyle.danger,
                                            label: Text('Close Modal'),
                                            prefixIcon: Icons.close,
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BsRow(
                    gutter: EdgeInsets.only(left: 10.0, right: 10.0),
                    children: [
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          size: BsInputSize.sm,
                          hintText: 'Small input',
                          controller: TextEditingController(),
                          validators: [
                            BsValidator.required
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          size: BsInputSize.md,
                          hintTextLabel: 'Medium input',
                          controller: TextEditingController(),
                          validators: [
                            BsValidator.required
                          ],
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          size: BsInputSize.lg,
                          obscureText: true,
                          hintTextLabel: 'Large input',
                          controller: TextEditingController(),
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          style: BsInputStyle.outlineBottom,
                          size: BsInputSize.outlineBottomSm,
                          hintTextLabel: 'Small input',
                          controller: TextEditingController(),
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          style: BsInputStyle.outlineBottom,
                          size: BsInputSize.outlineBottomMd,
                          hintTextLabel: 'Medium input',
                          controller: TextEditingController(),
                        ),
                      ),
                      BsCol(
                        margin: EdgeInsets.only(bottom: 10.0),
                        sizes: ColSize(md: Col.col_2),
                        child: BsInput(
                          style: BsInputStyle.outlineBottom,
                          size: BsInputSize.outlineBottomLg,
                          hintTextLabel: 'Large input',
                          maxLines: 5,
                          controller: TextEditingController(),
                          validators: [
                            BsValidator.required
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
            ),
          )),
        ),
      ),
    );
  }

}
