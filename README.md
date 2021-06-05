# bs_flutter

Simple flutter widget from Bootstrap v5 component, including responsive grid layout with bootstrap grid system

## Getting Started

![Alt text](Screenshot_1.png?raw=true "Screenshot Example")
The best way to make responsive and catchy layout.

## Responsive Layout

```dart
BsContainer(
  child: BsRow(
    gutter: EdgeInsets.only(left: 10.0, right: 10.0),
    children: [
      BsCol(
        // ...
        sizes: ColSize.all(Col.col_12),
        child: Container()
      ),
      BsCol(
        // ...
        sizes: ColSize.all(Col.col_12),
        child: Container()
      )
    ]
  )
);
```

## Buttons, Buttons with Icon, Buttons with Badge

```dart
// ...
BsCol(
    margin: EdgeInsets.only(bottom: 10.0),
    padding: EdgeInsets.only(left: 10.0),
    sizes: ColSize.all(Col.col_12),
    child: Wrap(
      children: [
        BsButton(
          // ...
          onPressed: () {},
          style: BsButtonStyle.primary,
          size: BsButtonSize.btnSm,
          label: Text('Small'),
        ),
        BsButton(
          // ...
          onPressed: () {},
          style: BsButtonStyle.outlinePrimary,
          label: Text('Outline Primary'),
        ),
        BsButton(
          // ...
          onPressed: () {},
          style: BsButtonStyle.primary,
          size: BsButtonSize.btnIconSm,
          prefixIcon: Icons.check,
        ),
        BsButton(
          // ...
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
      ],
    ),
  ),
//...
```

## Modals

```dart
BsButton(
  style: BsButtonStyle.primary,
  margin: EdgeInsets.only(right: 5.0, bottom: 10.0),
  label: Text('Default Modal'),
  onPressed: () => showDialog(context: context, builder: (context) => BsModal(
    context: context,
    dialog: BsModalDialog(
      size: BsModalSize.md,
      child: BsModalContent(
        children: <BsModalContainer>[
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
);
```

## Inputs
```dart
// ...
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
//...
```

```dart
//...
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
//...
```

