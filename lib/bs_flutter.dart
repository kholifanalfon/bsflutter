
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BsFlutter {
  static const MethodChannel _channel =
      const MethodChannel('bs_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

class BreakPoint {

  static const double _widthXxl = 1400.0;
  static const double _widthXl  = 1200.0;
  static const double _widthLg  = 992.0;
  static const double _widthMd  = 768.0;
  static const double _widthSm  = 576.0;

  static const double _containerXxl = 1320.0;
  static const double _containerXl  = 1140.0;
  static const double _containerLg  = 960.0;
  static const double _containerMd  = 720.0;
  static const double _containerSm  = 576.0;

  static const String _stateXxl = 'xxl';
  static const String _stateXl  = 'xl';
  static const String _stateLg  = 'lg';
  static const String _stateMd  = 'md';
  static const String _stateSm  = 'sm';
  static const String _stateXs  = 'xs';

  BreakPoint({
    this.breakpoint,
    this.screenWidth,
    this.containerWidth,
    this.state,
  });

  final double? breakpoint;

  final double? screenWidth;

  final double? containerWidth;

  final String? state;

  factory BreakPoint.of(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    if(screenWidth >= _widthXxl) {
      return BreakPoint(
        breakpoint: _widthXxl,
        containerWidth: _containerXxl,
        screenWidth: screenWidth,
        state: _stateXxl,
      );
    }

    else if(screenWidth >= _widthXl) {
      return BreakPoint(
        breakpoint: _widthXl,
        containerWidth: _containerXl,
        screenWidth: screenWidth,
        state: _stateXl,
      );
    }

    else if(screenWidth >= _widthLg) {
      return BreakPoint(
        breakpoint: _widthLg,
        containerWidth: _containerLg,
        screenWidth: screenWidth,
        state: _stateLg,
      );
    }

    else if(screenWidth >= _widthMd) {
      return BreakPoint(
        breakpoint: _widthMd,
        containerWidth: _containerMd,
        screenWidth: screenWidth,
        state: _stateMd,
      );
    }

    else if(screenWidth >= _widthSm) {
      return BreakPoint(
        breakpoint: _widthSm,
        containerWidth: _containerSm,
        screenWidth: screenWidth,
        state: _stateSm,
      );
    }

    return BreakPoint(
      breakpoint: 0.0,
      containerWidth: screenWidth,
      screenWidth: screenWidth,
      state: _stateXs,
    );
  }
}

class BsColor {

  static const Color color = Color(0xff212529);

  static const Color borderColor = Color(0xffdee2e6);

  static const Color primary = Color(0xff0d6efd);
  static const Color secondary = Colors.grey;
  static const Color danger = Color(0xffdc3545);
  static const Color success = Color(0xff198754);
  static const Color warning = Color(0xffffc107);
  static const Color info = Color(0xff0dcaf0);
  static const Color light = Color(0xfff8f9fa);
  static const Color dark = Color(0xff212529);

  static const Color primaryShadow = Color(0xffc2dbfe);
  static const Color dangerShadow = Color(0xfff0a9b0);

  static const Color textError = Color(0xffdc3545);
}

class BsFluid {

  const BsFluid({
    required this.breakPoints,
  });

  final List<String> breakPoints;

  static const BsFluid none = BsFluid(
    breakPoints: [],
  );

  static const BsFluid sm = BsFluid(
    breakPoints: [BreakPoint._stateXs],
  );

  static const BsFluid md = BsFluid(
    breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm],
  );

  static const BsFluid lg = BsFluid(
      breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm, BreakPoint._stateMd]
  );

  static const BsFluid xl = BsFluid(
      breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm, BreakPoint._stateMd, BreakPoint._stateLg]
  );

  static const BsFluid xxl = BsFluid(
      breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm, BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl]
  );

  static const BsFluid block = BsFluid(
      breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm, BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl]
  );
}

class BsVisibility {
  const BsVisibility({
    required this.breakPoints,
  });

  final List<String> breakPoints;

  static const BsVisibility none = BsVisibility(
      breakPoints: []
  );

  static const BsVisibility block = BsVisibility(
      breakPoints: [BreakPoint._stateXs, BreakPoint._stateSm, BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl]
  );

  static const BsVisibility hiddenSm = BsVisibility(
      breakPoints: [BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl]
  );

  static const BsVisibility hiddenMd = BsVisibility(
      breakPoints: [BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl]
  );

  static const BsVisibility hiddenLg = BsVisibility(
      breakPoints: [BreakPoint._stateXl, BreakPoint._stateXxl]
  );

  static const BsVisibility hiddenXl = BsVisibility(
      breakPoints: [BreakPoint._stateXxl]
  );

  static const BsVisibility hiddenXxl = BsVisibility(
      breakPoints: []
  );
}

class BsContainer extends StatelessWidget {

  const BsContainer({
    Key? key,
    this.fluid = BsFluid.sm,
    this.visibility = BsVisibility.block,
    this.alignment,
    this.constraints,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAligment,
    this.clipBehavior = Clip.none,
    this.child,
  }) : super(key: key);

  final BsFluid fluid;

  final BsVisibility visibility;

  final AlignmentGeometry? alignment;

  final BoxConstraints? constraints;

  final Color? color;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAligment;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);

    return !visibility.breakPoints.contains(breakPoint.state) ? Container(width: 0)
        : Row(
      children: [
        Expanded(child: Column(
          children: [
            Container(
              color: color,
              constraints: constraints,
              alignment: alignment,
              height: height,
              width: fluid.breakPoints.contains(breakPoint.state)
                  ? double.infinity
                  : breakPoint.containerWidth,
              padding: padding,
              margin: margin,
              decoration: decoration,
              foregroundDecoration: foregroundDecoration,
              transform: transform,
              transformAlignment: transformAligment,
              clipBehavior: clipBehavior,
              child: child,
            )
          ],
        ))
      ],
    );
  }
}

class _BsCol extends StatelessWidget {

  const _BsCol(this.index, this.col);

  final int index;

  final BsCol col;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: col
        )
      ],
    );
  }

}

class BsRow extends StatelessWidget {

  const BsRow({
    Key? key,
    this.visibility = BsVisibility.block,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.gutter,
    this.constraints,
    this.height,
    this.alignment,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.children = const [],
  }) : super(key: key);

  final BsVisibility visibility;

  final EdgeInsetsGeometry? gutter;

  final BoxConstraints? constraints;

  final double? height;

  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip clipBehavior;

  final WrapCrossAlignment crossAxisAlignment;

  final List<BsCol> children;

  @override
  Widget build(BuildContext context) {
    Col.gutter = gutter;
    BreakPoint breakPoint = BreakPoint.of(context);

    List<_BsCol> _children = List<_BsCol>.generate(children.length, (index) => _BsCol(index + 1, children[index]));

    _children.sort((_BsCol a, _BsCol b) {
      BreakPoint breakPoint = BreakPoint.of(context);
      if(breakPoint.state == BreakPoint._stateXxl)
        if(b.col.order.xxl != null) {
          return a.index >= b.col.order.xxl!.toInt() ? 1 : 0;
        }

      if(breakPoint.state == BreakPoint._stateXl)
        if(b.col.order.xl != null)
          return a.index >= b.col.order.xl!.toInt() ? 1 : 0;

      if(breakPoint.state == BreakPoint._stateLg)
        if(b.col.order.lg != null)
          return a.index >= b.col.order.lg!.toInt() ? 1 : 0;

      if(breakPoint.state == BreakPoint._stateMd)
        if(b.col.order.md != null)
          return a.index >= b.col.order.md!.toInt() ? 1 : 0;

      if(breakPoint.state == BreakPoint._stateSm)
        if(b.col.order.sm != null)
          return a.index >= b.col.order.sm!.toInt() ? 1 : 0;

      return a.index > b.index ? 1 : 0;
    });

    return !visibility.breakPoints.contains(breakPoint.state) ? Container(width: 0)
        : Row(
      children: [
        Expanded(child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: constraints,
              height: height,
              width: constraints.maxWidth,
              alignment: alignment,
              padding: padding,
              margin: margin,
              decoration: decoration,
              foregroundDecoration: foregroundDecoration,
              transform: transform,
              transformAlignment: transformAlignment,
              clipBehavior: clipBehavior,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: crossAxisAlignment,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: _children,
                  )
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}

class Col {

  static EdgeInsetsGeometry? gutter;

  const Col({
    required this.width,
  });

  final double width;

  static const Col zero = Col(width: 0.0);

  static const Col col_12 = Col(width: 100.0);

  static const Col col_11 = Col(width: 91.666666);

  static const Col col_10 = Col(width: 83.333333);

  static const Col col_9 = Col(width: 75.0);

  static const Col col_8 = Col(width: 66.666667);

  static const Col col_7 = Col(width: 58.333333);

  static const Col col_6 = Col(width: 50.0);

  static const Col col_5 = Col(width: 41.666666);

  static const Col col_4 = Col(width: 33.333333);

  static const Col col_3 = Col(width: 25.0);

  static const Col col_2 = Col(width: 16.666666);

  static const Col col_1 = Col(width: 8.333333);
}

class ColSize {

  const ColSize({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  final Col? xs;

  final Col? sm;

  final Col? md;

  final Col? lg;

  final Col? xl;

  final Col? xxl;

  factory ColSize.all(Col size) {
    return ColSize(sm: size);
  }

  factory ColSize.onlyMobile(Col size) {
    return ColSize(sm: size, md: Col.col_12);
  }

  factory ColSize.onlyTable(Col size) {
    return ColSize(md: size, lg: Col.col_12);
  }

  factory ColSize.onlyDesktop(Col size) {
    return ColSize(lg: size);
  }

  factory ColSize.inDevice({Col? mobile, Col? tablet, Col? desktop}) {
    return ColSize(sm: mobile, md: tablet, lg: desktop);
  }
}

class ColOrder {

  const ColOrder({
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  final int? xs;

  final int? sm;

  final int? md;

  final int? lg;

  final int? xl;

  final int? xxl;
}

class _ColCalc {

  const _ColCalc(this.context, this.sizes, this.offset);

  final BuildContext context;

  final ColSize sizes;

  final ColSize offset;

  Col? get width {
    BreakPoint state = BreakPoint.of(context);

    if(state.state == BreakPoint._stateXxl) {

      if(sizes.xxl != null)
        return sizes.xxl;
      else if(sizes.xl != null)
        return sizes.xl;
      else if(sizes.lg != null)
        return sizes.lg;
      else if(sizes.md != null)
        return sizes.md;
      else if(sizes.sm != null)
        return sizes.sm;

      return Col.col_12;
    }

    else if(state.state == BreakPoint._stateXl) {
      if(sizes.xl != null)
        return sizes.xl;
      else if(sizes.lg != null)
        return sizes.lg;
      else if(sizes.md != null)
        return sizes.md;
      else if(sizes.sm != null)
        return sizes.sm;

      return Col.col_12;
    }

    else if(state.state == BreakPoint._stateLg) {
      if(sizes.lg != null)
        return sizes.lg;
      else if(sizes.md != null)
        return sizes.md;
      else if(sizes.sm != null)
        return sizes.sm;

      return Col.col_12;
    }

    else if(state.state == BreakPoint._stateMd) {
      if(sizes.md != null)
        return sizes.md;
      else if(sizes.sm != null)
        return sizes.sm;

      return Col.col_12;
    }

    else if(state.state == BreakPoint._stateSm) {
      if(sizes.sm != null)
        return sizes.sm;

      return Col.col_12;
    }

    return Col.col_12;
  }

  Col? get widthOffset {
    BreakPoint state = BreakPoint.of(context);

    if(state.state == BreakPoint._stateXxl) {

      if(offset.xxl != null)
        return offset.xxl;
      else if(offset.xl != null)
        return offset.xl;
      else if(offset.lg != null)
        return offset.lg;
      else if(offset.md != null)
        return offset.md;
      else if(offset.sm != null)
        return offset.sm;

      return Col.zero;
    }

    else if(state.state == BreakPoint._stateXl) {
      if(offset.xl != null)
        return offset.xl;
      else if(offset.lg != null)
        return offset.lg;
      else if(offset.md != null)
        return offset.md;
      else if(offset.sm != null)
        return offset.sm;

      return Col.zero;
    }

    else if(state.state == BreakPoint._stateLg) {
      if(offset.lg != null)
        return offset.lg;
      else if(offset.md != null)
        return offset.md;
      else if(offset.sm != null)
        return offset.sm;

      return Col.zero;
    }

    else if(state.state == BreakPoint._stateMd) {
      if(offset.md != null)
        return offset.md;
      else if(offset.sm != null)
        return offset.sm;

      return Col.zero;
    }

    else if(state.state == BreakPoint._stateSm) {
      if(offset.sm != null)
        return offset.sm;

      return Col.zero;
    }

    return Col.zero;
  }
}

class BsCol extends StatelessWidget {

  const BsCol({
    Key? key,
    this.visibility = BsVisibility.block,
    this.sizes = const ColSize(),
    this.order = const ColOrder(),
    this.offset = const ColSize(),
    this.color,
    this.height,
    this.constraints,
    this.padding,
    this.margin,
    this.alignment,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.child,
  }) : super(key: key);

  final BsVisibility visibility;

  final ColSize sizes;

  final ColOrder order;

  final ColSize offset;

  final Color? color;

  final BoxConstraints? constraints;

  final AlignmentGeometry? alignment;

  final double? height;

  final EdgeInsetsGeometry? padding;

  final EdgeInsets? margin;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);

    return !visibility.breakPoints.contains(breakPoint.state) ? Container(width: 0)
        : LayoutBuilder(
      builder: (context, constraints) {
        _ColCalc calc = _ColCalc(context, sizes, offset);
        return Container(
            alignment: alignment,
            width: calc.width!.width/100.0 * constraints.maxWidth,
            height: height,
            padding: padding == null ? Col.gutter : padding,
            margin: EdgeInsets.only(
              left: calc.widthOffset != null
                  ? calc.widthOffset!.width/100.0 * constraints.maxWidth
                  : margin != null ? margin!.left : 0.0,
              right: margin != null ? margin!.right : 0.0,
              top: margin != null ? margin!.top : 0.0,
              bottom: margin != null ? margin!.bottom : 0.0,
            ),
            color: color,
            constraints: constraints,
            decoration: decoration,
            foregroundDecoration: foregroundDecoration,
            transform: transform,
            transformAlignment: transformAlignment,
            clipBehavior: clipBehavior,
            child: Container(child: child)
        );
      },
    );
  }
}

class BsButtonStyle {

  const BsButtonStyle({
    this.color,
    this.borderColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
  });

  final Color? color;

  final Color borderColor;

  final BorderRadiusGeometry borderRadius;

  final Color? backgroundColor;

  static const BsButtonStyle primary = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.primary,
      backgroundColor: BsColor.primary,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle secondary = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.secondary,
      backgroundColor: BsColor.secondary,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle danger = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.danger,
      backgroundColor: BsColor.danger,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle success = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.success,
      backgroundColor: BsColor.success,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle warning = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.warning,
      backgroundColor: BsColor.warning,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle info = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.info,
      backgroundColor: BsColor.info,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle light = BsButtonStyle(
      color: Colors.black,
      borderColor: BsColor.light,
      backgroundColor: BsColor.light,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle dark = BsButtonStyle(
      color: Colors.white,
      borderColor: BsColor.dark,
      backgroundColor: BsColor.dark,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlinePrimary = BsButtonStyle(
      color: BsColor.primary,
      borderColor: BsColor.primary,
      backgroundColor: Colors.transparent,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineSecondary = BsButtonStyle(
      color: BsColor.secondary,
      borderColor: BsColor.secondary,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineSuccess = BsButtonStyle(
      color: BsColor.success,
      borderColor: BsColor.success,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineDanger = BsButtonStyle(
      color: BsColor.danger,
      borderColor: BsColor.danger,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineWarning = BsButtonStyle(
      color: BsColor.warning,
      borderColor: BsColor.warning,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineInfo = BsButtonStyle(
      color: BsColor.info,
      borderColor: BsColor.info,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineLight = BsButtonStyle(
      color: BsColor.light,
      borderColor: BsColor.light,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );

  static const BsButtonStyle outlineDark = BsButtonStyle(
      color: BsColor.dark,
      borderColor: BsColor.dark,
      backgroundColor: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3.0))
  );
}

class BsButtonSize {

  const BsButtonSize({
    this.padding,
    this.fontSize,
    this.iconSize,
    this.spaceLabelIcon = 5.0,
    this.minimumSize
  });

  final EdgeInsets? padding;

  final double? fontSize;

  final double? iconSize;

  final double spaceLabelIcon;

  final Size? minimumSize;

  static const BsButtonSize btnIconSm = BsButtonSize(
    iconSize: 12.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    minimumSize: Size(30.0, 30.0),
  );

  static const BsButtonSize btnIconMd = BsButtonSize(
    iconSize: 18.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    minimumSize: Size(40.0, 40.0),
  );

  static const BsButtonSize btnIconLg = BsButtonSize(
    iconSize: 22.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    minimumSize: Size(50.0, 50.0),
  );

  static const BsButtonSize btnSm = BsButtonSize(
    iconSize: 10.0,
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
    minimumSize: Size(30.0, 30.0),
  );

  static const BsButtonSize btnMd = BsButtonSize(
    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
    fontSize: 12.0,
    iconSize: 12.0,
    minimumSize: Size(40.0, 40.0),
  );

  static const BsButtonSize btnLg = BsButtonSize(
      iconSize: 18.0,
      fontSize: 18.0,
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
      minimumSize: Size(50.0, 50.0),
      spaceLabelIcon: 10.0
  );
}

class BsButton extends StatelessWidget {

  const BsButton({
    Key? key,
    required this.onPressed,
    this.width,
    this.margin,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.badge,
    this.onLongPressed,
    this.style = BsButtonStyle.secondary,
    this.size = BsButtonSize.btnMd,
    this.autofocus = false,
    this.disabled = false,
    this.focusNode,
    this.clipBehavior = Clip.none,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final double? width;

  final VoidCallback onPressed;

  final Widget? label;

  final IconData? prefixIcon;

  final IconData? suffixIcon;

  final Widget? badge;

  final VoidCallback? onLongPressed;

  final BsButtonStyle? style;

  final BsButtonSize? size;

  final EdgeInsetsGeometry? margin;

  final bool autofocus;

  final bool disabled;

  final FocusNode? focusNode;

  final Clip clipBehavior;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Container(
          width: width,
          margin: margin,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: disabled && style!.backgroundColor != Colors.transparent
                    ? style!.backgroundColor!.withOpacity(0.5)
                    : style!.backgroundColor,
                padding: size!.padding,
                minimumSize: size!.minimumSize,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: !disabled ? style!.borderColor : style!.borderColor.withOpacity(0.5),
                  ),
                  borderRadius: style!.borderRadius,
                ),
              ),
              onPressed: () => !disabled ? onPressed() : {},
              onLongPress: onLongPressed,
              focusNode: focusNode,
              clipBehavior: clipBehavior,
              autofocus: autofocus,
              child: DefaultTextStyle(
                style: TextStyle(
                  color: !disabled ? style!.color : style!.color!.withOpacity(0.5),
                  fontSize: size!.fontSize,
                  fontWeight: FontWeight.w100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    prefixIcon == null ? Container(width: 0)
                        : Container(
                      margin: label != null ? EdgeInsets.only(right: size!.spaceLabelIcon) : EdgeInsets.zero,
                      child: Icon(prefixIcon, size: size!.iconSize, color: !disabled ? style!.color : style!.color!.withOpacity(0.5)),
                    ),
                    label == null ? Container(width: 0)
                        : Container(child: label),
                    badge == null ? Container(width: 0)
                        : Container(margin: EdgeInsets.only(left: size!.spaceLabelIcon, right: suffixIcon == null ? size!.spaceLabelIcon : 0.0),child: badge),
                    suffixIcon == null ? Container(width: 0)
                        : Container(
                      margin: label != null ? EdgeInsets.only(left: size!.spaceLabelIcon) : EdgeInsets.zero,
                      child: Icon(suffixIcon, size: size!.iconSize, color: !disabled ? style!.color : style!.color!.withOpacity(0.5)),
                    ),
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}

class BsBadgeStyle {

  const BsBadgeStyle({
    this.color,
    this.backgroundColor,
  });

  final Color? color;

  final Color? backgroundColor;

  static const BsBadgeStyle primary = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.primary,
  );

  static const BsBadgeStyle secondary = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.secondary,
  );

  static const BsBadgeStyle danger = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.danger,
  );

  static const BsBadgeStyle success = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.success,
  );

  static const BsBadgeStyle warning = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.warning,
  );

  static const BsBadgeStyle info = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.info,
  );

  static const BsBadgeStyle light = BsBadgeStyle(
    color: Colors.black,
    backgroundColor: BsColor.light,
  );

  static const BsBadgeStyle dark = BsBadgeStyle(
    color: Colors.white,
    backgroundColor: BsColor.dark,
  );
}

class BsBadgeSize {

  const BsBadgeSize({
    this.padding,
    this.margin,
    this.fontSize,
    this.borderRadius,
  });

  final double? fontSize;

  final EdgeInsets? padding;

  final EdgeInsets? margin;

  final BorderRadiusGeometry? borderRadius;

  static const BsBadgeSize rounded = BsBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      fontSize: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(100.0))
  );

  static const BsBadgeSize small = BsBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 3.0, right: 3.0, top: 2.0, bottom: 2.0),
      fontSize: 9.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0))
  );

  static const BsBadgeSize medium = BsBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
      fontSize: 10.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0))
  );

  static const BsBadgeSize large = BsBadgeSize(
      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
      padding: EdgeInsets.only(left: 7.0, right: 7.0, top: 5.0, bottom: 5.0),
      fontSize: 14.0,
      borderRadius: BorderRadius.all(Radius.circular(50.0))
  );
}

class BsBadge extends StatelessWidget {

  const BsBadge({
    Key? key,
    this.style = BsBadgeStyle.secondary,
    this.size = BsBadgeSize.medium,
    this.child,
  }) : super(key: key);

  final BsBadgeStyle style;

  final BsBadgeSize size;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: size.padding,
      margin: size.margin,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: size.borderRadius,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: style.color,
          fontSize: size.fontSize,
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }

}

class BsAlertColor {

  const BsAlertColor({
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  });

  final Color color;

  final Color backgroundColor;

  final Color borderColor;

  static const BsAlertColor primary = BsAlertColor(
    color: Color(0xff084298),
    backgroundColor: Color(0xffcfe2ff),
    borderColor: Color(0xffb6d4fe),
  );

  static const BsAlertColor secondary = BsAlertColor(
    color: Color(0xff41464b),
    backgroundColor: Color(0xffe2e3e5),
    borderColor: Color(0xffd3d6d8),
  );

  static const BsAlertColor success = BsAlertColor(
    color: Color(0xff0f5132),
    backgroundColor: Color(0xffd1e7dd),
    borderColor: Color(0xffbadbcc),
  );

  static const BsAlertColor danger = BsAlertColor(
    color: Color(0xff842029),
    backgroundColor: Color(0xfff8d7da),
    borderColor: Color(0xfff5c2c7),
  );

  static const BsAlertColor warning = BsAlertColor(
    color: Color(0xff664d03),
    backgroundColor: Color(0xfffff3cd),
    borderColor: Color(0xffffecb5),
  );

  static const BsAlertColor info = BsAlertColor(
    color: Color(0xff055160),
    backgroundColor: Color(0xffcff4fc),
    borderColor: Color(0xffb6effb),
  );

  static const BsAlertColor light = BsAlertColor(
    color: Color(0xff636464),
    backgroundColor: Color(0xfffefefe),
    borderColor: Color(0xfffdfdfe),
  );

  static const BsAlertColor dark = BsAlertColor(
      color: Color(0xff141619),
      backgroundColor: Color(0xffd3d3d4),
      borderColor: Color(0xffbcbebf)
  );
}

class BsAlertStyle {

  const BsAlertStyle({
    this.color,
    this.borderRadius,
  });

  final BsAlertColor? color;

  final BorderRadiusGeometry? borderRadius;

  static const BsAlertStyle primary = BsAlertStyle(
    color: BsAlertColor.primary,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle secondary = BsAlertStyle(
    color: BsAlertColor.secondary,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle success = BsAlertStyle(
    color: BsAlertColor.success,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle danger = BsAlertStyle(
    color: BsAlertColor.danger,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle warning = BsAlertStyle(
    color: BsAlertColor.warning,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle info = BsAlertStyle(
    color: BsAlertColor.info,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle light = BsAlertStyle(
    color: BsAlertColor.light,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );

  static const BsAlertStyle dark = BsAlertStyle(
    color: BsAlertColor.dark,
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );
}

class BsAlert extends StatefulWidget {
  const BsAlert({
    Key? key,
    this.visibility = BsVisibility.block,
    this.closeButton = false,
    this.heading,
    this.style = BsAlertStyle.primary,
    this.textStyle,
    this.headingTextStyle,
    this.margin,
    this.padding,
    this.child,
    this.onClose,
  }) : super(key: key);

  final BsVisibility visibility;

  final Widget? heading;

  final bool closeButton;

  final BsAlertStyle style;

  final TextStyle? textStyle;

  final TextStyle? headingTextStyle;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onClose;

  final Widget? child;

  @override
  State<StatefulWidget> createState() {
    return _BsAlertState();
  }

}

class _BsAlertState extends State<BsAlert> {

  bool _visibility = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 500), () {
      BreakPoint breakPoint = BreakPoint.of(context);
      _visibility = widget.visibility.breakPoints.contains(breakPoint.state);
    });
  }

  @override
  Widget build(BuildContext context) {

    return !_visibility ? Container()
        : Container(
      margin: widget.margin,
      padding: widget.padding == null ? EdgeInsets.all(15.0) : widget.padding,
      decoration: BoxDecoration(
          color: widget.style.color!.backgroundColor,
          borderRadius: widget.style.borderRadius,
          border: Border.all(color: widget.style.color!.borderColor, width: 0.5)
      ),
      child: DefaultTextStyle(
        style: TextStyle(
            color: widget.style.color!.color,
            fontSize: 14.0
        ).merge(widget.textStyle),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.heading == null ? Container() : DefaultTextStyle(
                  style: TextStyle(
                      color: widget.style.color!.color,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: widget.heading,
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Container(child: widget.child)),
                  ],
                )
              ],
            )),
            !widget.closeButton ? Container(width: 0) : Container(
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(20.0, 20.0),
                ),
                onPressed: () => _closeAlert(),
                child: Icon(Icons.close, size: 14.0, color: widget.style.color!.color),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _closeAlert() {
    setState(() {
      _visibility = false;
      if(widget.onClose != null)
        widget.onClose!();
    });
  }

}

class BsModalSize {

  static const double widthSm   = 300.0;
  static const double widthMd   = 500.0;
  static const double widthLg   = 800.0;
  static const double widthXl   = 1140.0;
  static const double widthXxl  = 1350.0;

  const BsModalSize({
    required this.breakPoints,
    required this.width,
  });

  final List<String> breakPoints;

  final double width;

  static const BsModalSize sm = BsModalSize(
    width: widthSm,
    breakPoints: [BreakPoint._stateSm, BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl],
  );

  static const BsModalSize md = BsModalSize(
    width: widthMd,
    breakPoints: [BreakPoint._stateMd, BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl],
  );

  static const BsModalSize lg = BsModalSize(
    width: widthLg,
    breakPoints: [BreakPoint._stateLg, BreakPoint._stateXl, BreakPoint._stateXxl],
  );

  static const BsModalSize xl = BsModalSize(
    width: widthXl,
    breakPoints: [BreakPoint._stateXl, BreakPoint._stateXl, BreakPoint._stateXxl],
  );

  static const BsModalSize xxl = BsModalSize(
    width: widthXxl,
    breakPoints: [BreakPoint._stateXxl],
  );
}

class BsModal extends StatelessWidget {

  const BsModal({
    Key? key,
    required this.context,
    required this.dialog,
  }) : super(key: key);

  final BuildContext context;

  final BsModalDialog dialog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: dialog)
      ],
    );
  }

}

class BsModalDialog extends StatelessWidget {

  const BsModalDialog({
    Key? key,
    this.size = BsModalSize.md,
    this.child,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final BsModalSize size;

  final Widget? child;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    BreakPoint breakPoint = BreakPoint.of(context);

    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Color(0x00000000),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Scrollbar(child: SingleChildScrollView(
                  child: Container(
                    width: size.breakPoints.contains(breakPoint.state)
                        ? size.width
                        : BsModalSize.widthMd,
                    child: child,
                  ),
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }

}

class BsModalContent extends StatelessWidget {

  const BsModalContent({
    Key? key,
    this.decoration,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.children = const [],
  }) : super(key: key);

  final Decoration? decoration;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisAlignment mainAxisAlignment;

  final List<BsModalContainer> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          decoration: decoration != null ? decoration : BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          ),
        ))
      ],
    );
  }

}

class BsModalContainer extends StatelessWidget {

  const BsModalContainer({
    Key? key,
    this.title,
    this.titleStyle,
    this.padding,
    this.child,
    this.actions = const [],
    this.closeButton = false,
    this.onClose,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final Widget? title;

  final TextStyle? titleStyle;

  final bool closeButton;

  final EdgeInsets? padding;

  final Widget? child;

  final List<Widget> actions;

  final VoidCallback? onClose;

  final CrossAxisAlignment crossAxisAlignment;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Row(
            children: [
              title == null ? Container() : DefaultTextStyle(
                style: TextStyle(
                  fontSize: 16.0,
                  color: BsColor.color,
                  fontWeight: FontWeight.bold,
                ).merge(titleStyle),
                child: Expanded(child: Container(
                    padding: padding != null
                        ? padding
                        : EdgeInsets.all(15.0),
                    child: title
                )),
              ),
              !closeButton ? Container(width: 0) : Container(
                margin: EdgeInsets.only(right: padding != null ? padding!.right : 15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(20.0, 20.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    if(onClose != null)
                      onClose!();
                  },
                  child: Icon(Icons.close, size: 14.0, color: BsColor.color),
                ),
              )
            ],
          ),
          child == null ? Container() : Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: BsColor.borderColor)
                )
            ),
          ),
          child == null ? Container() : Container(
            padding: padding == null ? EdgeInsets.all(15.0) : padding,
            child: child,
          ),
          actions.length == 0 ? Container() : Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: BsColor.borderColor)
                )
            ),
          ),
          actions.length == 0 ? Container() : Container(
            padding: padding == null ? EdgeInsets.all(15.0) : padding,
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: actions,
            ),
          )
        ],
      ),
    );
  }

}

class BsHr extends StatelessWidget {

  const BsHr({
    this.width = 0.2,
    this.color,
  });

  final double width;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
              border: Border.all(color: color == null ? BsColor.color : color!, width: width)
          ),
        )),
      ],
    );
  }

}

class BsInputStyle {

  const BsInputStyle({
    this.color = BsColor.primary,
    this.backgroundColor = Colors.transparent,
    this.border,
    this.borderRadius,
    this.boxShadowFocused = const [],
  });

  final Color? color;

  final Color? backgroundColor;

  final BoxBorder? border;

  final BorderRadiusGeometry? borderRadius;

  final List<BoxShadow> boxShadowFocused;

  static const BsInputStyle outline = BsInputStyle(
      backgroundColor: Colors.white,
      border: Border(
        top: BorderSide(color: BsColor.borderColor),
        bottom: BorderSide(color: BsColor.borderColor),
        left: BorderSide(color: BsColor.borderColor),
        right: BorderSide(color: BsColor.borderColor),
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadowFocused: [
        BoxShadow(
          color: BsColor.primaryShadow,
          offset: Offset(0, 0),
          spreadRadius: 2.5,
        )
      ]
  );

  static const BsInputStyle outlineBottom = BsInputStyle(
      border: Border(
          bottom: BorderSide(color: BsColor.borderColor)
      )
  );
}

class BsInputSize {

  const BsInputSize({
    this.padding,
    this.fontSize,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.transitionMarginLeft = 0,
    this.transitionMarginTop = 0,
    this.transisionFontSize = 2.0,
    this.notEmptyMarginTop = 2.0,
  });

  final EdgeInsetsGeometry? padding;

  final double? marginTop;

  final double? marginLeft;

  final double? transitionMarginLeft;

  final double? transitionMarginTop;

  final double? transisionFontSize;

  final double? notEmptyMarginTop;

  final double? fontSize;

  static const BsInputSize sm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    marginTop: 11.0,
    marginLeft: 10.0,
    transitionMarginTop: 4.0,
    transitionMarginLeft: -5.0,
  );

  static const BsInputSize md = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0, bottom: 14.0),
    marginTop: 12.0,
    marginLeft: 10.0,
    transitionMarginTop: 7.0,
    transitionMarginLeft: -5.0,
  );

  static const BsInputSize lg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0, bottom: 18.0),
    marginTop: 15.0,
    marginLeft: 18.0,
    transitionMarginTop: 10.0,
    transitionMarginLeft: -5.0,
  );

  static const BsInputSize outlineBottomSm = BsInputSize(
    fontSize: 10.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
    marginTop: 10.0,
    marginLeft: 5.0,
    transitionMarginTop: 5.0,
  );

  static const BsInputSize outlineBottomMd = BsInputSize(
    fontSize: 14.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginTop: 14.0,
    marginLeft: 5.0,
    transitionMarginTop: 10.0,
  );

  static const BsInputSize outlineBottomLg = BsInputSize(
    fontSize: 18.0,
    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
    marginTop: 10.0,
    marginLeft: 5.0,
    transitionMarginTop: 10.0,
    transisionFontSize: 5.0,
  );
}

typedef BsValidatorValue<String> = String? Function(String value);

class BsValidator {

  const BsValidator({
    required this.validator,
  });

  final BsValidatorValue<String> validator;

  static BsValidator get required => BsValidator(
    validator: (value) {
      String valueValidate = value.toString().trim();
      if(valueValidate.isEmpty) return "Field tidak boleh kosong";

      return null;
    },
  );

  static BsValidator maxLength(int length) {
    return BsValidator(
        validator: (value) {
          if(value.toString().length > length) return "Value tidak boleh lebih dari $length";
          return null;
        }
    );
  }

  static BsValidator minLength(int length) {
    return BsValidator(
        validator: (value) {
          if(value.toString().length < length) return "Value harus boleh lebih dari $length";
          return null;
        }
    );
  }
}

class BsInput extends StatefulWidget {

  const BsInput({
    Key? key,
    this.style = BsInputStyle.outline,
    this.size = BsInputSize.md,
    this.hintText,
    this.hintTextLabel,
    this.focusNode,
    this.width,
    this.disabled = false,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines = 1,
    required this.controller,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = false,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.textInputAction,
    this.onTap,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.showCursor,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.scrollController,
    this.scrollPhysics,
    this.validators = const [],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BsInputState();
  }

  final BsInputStyle style;

  final BsInputSize size;

  final double? width;

  final bool disabled;

  final bool readOnly;

  final String? hintText;

  final String? hintTextLabel;

  final int? maxLines;

  final int? minLines;

  final FocusNode? focusNode;

  final TextEditingController controller;

  final bool obscureText;

  final bool autofocus;

  final bool autocorrect;

  final TextInputType? keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final TextAlign textAlign;

  final TextAlignVertical? textAlignVertical;

  final TextCapitalization textCapitalization;

  final TextDirection? textDirection;

  final TextInputAction? textInputAction;

  final GestureTapCallback? onTap;

  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onChange;

  final FormFieldSetter<String>? onFieldSubmitted;

  final FormFieldSetter<String>? onSaved;

  final bool? showCursor;

  final double cursorWidth;

  final double? cursorHeight;

  final Radius? cursorRadius;

  final Color? cursorColor;

  final EdgeInsets scrollPadding;

  final ScrollPhysics? scrollPhysics;

  final ScrollController? scrollController;

  final List<BsValidator> validators;
}

class _BsInputState extends State<BsInput> with SingleTickerProviderStateMixin {

  FocusNode? focusNode;
  FormFieldState? formFieldState;

  Duration duration = Duration(milliseconds: 100);
  AnimationController? animated;

  String? get hintText {
    if(widget.hintText == null)
      return '';

    return widget.hintText;
  }

  bool get valid => (formFieldState != null && formFieldState!.validate()) || (_errorText == null);

  String? _errorText;
  TextEditingController get controller => widget.controller;
  String get initialValue => controller.text;
  bool get isEmpty => controller.text == '';

  @override
  void initState() {
    focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode;
    focusNode!.addListener(onFocusNode);

    animated = AnimationController(
        vsync: this,
        duration: duration
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BsInput oldWidget) {
    animated!.duration = duration;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    focusNode!.dispose();
    animated!.dispose();

    super.dispose();
  }

  void onFocusNode() {
    setState(() {
      if(!focusNode!.hasFocus) {
        _errorText = null;
        widget.validators.map((validator) {
          if(_errorText == null) _errorText = validator.validator(controller.text);
        }).toList();
        animated!.reverse();
      } else {
        animated!.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            FormField(
              initialValue: initialValue,
              validator: (value) {
                return _errorText;
              },
              builder: (field) {
                if(formFieldState == null)
                  formFieldState = field;

                BoxBorder? border = widget.style.border;
                if(focusNode!.hasFocus)
                  if(widget.style.boxShadowFocused.length == 0)
                    border = Border(bottom: BorderSide(color: BsColor.primary));
                  else border = Border.all(color: BsColor.primary);

                if(!valid)
                  if(widget.style.boxShadowFocused.length == 0)
                    border = Border(bottom: BorderSide(color: BsColor.danger));
                  else border = Border.all(color: BsColor.danger);

                List<BoxShadow> boxShadow = [];
                if(focusNode!.hasFocus)
                  boxShadow = widget.style.boxShadowFocused;

                if(!valid && widget.style.boxShadowFocused.length != 0)
                  boxShadow = [
                    BoxShadow(
                      color: BsColor.dangerShadow,
                      offset: Offset(0, 0),
                      spreadRadius: 2.5,
                    )
                  ];

                return Container(
                    decoration: BoxDecoration(
                        color: widget.style.backgroundColor,
                        border: border,
                        borderRadius: widget.style.borderRadius,
                        boxShadow: boxShadow
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hintText,
                              contentPadding: widget.size.padding,
                              isDense: true,
                              hintStyle: TextStyle(
                                fontSize: widget.size.fontSize,
                              )
                          ),
                          focusNode: focusNode,
                          enabled: !widget.disabled,
                          readOnly: widget.readOnly,
                          autofocus: widget.autofocus,
                          autocorrect: widget.autocorrect,
                          maxLines: widget.maxLines,
                          minLines: widget.minLines,
                          controller: controller,
                          obscureText: widget.obscureText,
                          keyboardType: widget.keyboardType,
                          inputFormatters: widget.inputFormatters,
                          textAlign: widget.textAlign,
                          textAlignVertical: widget.textAlignVertical,
                          textCapitalization: widget.textCapitalization,
                          textDirection: widget.textDirection,
                          textInputAction: widget.textInputAction,
                          onTap: widget.onTap,
                          onEditingComplete: widget.onEditingComplete,
                          onChanged: (value) {
                            field.didChange(value);
                            if(widget.onChange != null)
                              widget.onChange!(value);
                          },
                          onFieldSubmitted: (value) {
                            field.didChange(value);
                            if(widget.onFieldSubmitted != null)
                              widget.onFieldSubmitted!(value);
                          },
                          onSaved: (value) {
                            field.didChange(value);
                            if(widget.onSaved != null)
                              widget.onSaved!(value);
                          },
                          showCursor: widget.showCursor,
                          cursorColor: widget.cursorColor,
                          cursorHeight: widget.cursorHeight,
                          cursorRadius: widget.cursorRadius,
                          cursorWidth: widget.cursorWidth,
                          scrollPadding: widget.scrollPadding,
                          scrollController: widget.scrollController,
                          scrollPhysics: widget.scrollPhysics,
                        ),
                      ],
                    )
                );
              },
            ),
            valid ? Container() : Container(
              margin: EdgeInsets.only(top: 5.0, left: 2.0),
              alignment: Alignment.centerLeft,
              child: Text(
                _errorText.toString(),
                style: TextStyle(
                    fontSize: 12.0,
                    color: BsColor.textError
                ),
              ),
            )
          ],
        ),
        widget.hintTextLabel == null ? Container(width: 0) : GestureDetector(
          onTap: () => focusNode!.requestFocus(),
          child: widget.hintTextLabel != null ? renderHintTextLabel(valid ? widget.style.color! : BsColor.textError, Colors.grey) : Text(''),
        ),
      ],
    );
  }

  Widget renderHintTextLabel(Color color, Color placeholderColor) {
    return AnimatedBuilder(
      animation: animated!,
      builder: (context, _) {
        double top = isEmpty ? (widget.size.marginTop! + widget.size.transitionMarginTop!) * animated!.value
            : widget.size.transitionMarginTop!;

        double left = isEmpty ? (widget.size.marginLeft! + widget.size.transitionMarginLeft!) * animated!.value : widget.size.transitionMarginLeft!;

        double fontSize = isEmpty ? widget.size.fontSize! - (widget.size.transisionFontSize! * animated!.value).toDouble()
            : widget.size.fontSize! - widget.size.transisionFontSize!;


        Color textColor = color;
        if(animated!.value == 0)
          textColor = placeholderColor;

        if(!isEmpty && animated!.value == 1)
          textColor = color;

        return Transform(
          transform: Matrix4.identity()
            ..translate(-left, -top),
          child: Container(
            padding: EdgeInsets.only(left: 2.0, right: 2.0),
            margin: EdgeInsets.only(left: isEmpty ? widget.size.marginLeft! : 0, top: isEmpty ? widget.size.marginTop! : 0),
            color: widget.style.backgroundColor,
            child: Text(widget.hintTextLabel!, style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ), overflow: TextOverflow.ellipsis),
          ),
        );
      },
    );
  }

}