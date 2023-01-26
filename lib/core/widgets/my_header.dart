import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  final double height;

  const MyHeader({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(context.width / 5, height),
            Offset(context.width / 10 * 5, height - 60),
            Offset(context.width / 5 * 4, height + 20),
            Offset(context.width, height - 18)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.4),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(context.width / 3, height + 20),
            Offset(context.width / 10 * 8, height - 60),
            Offset(context.width / 5 * 4, height - 60),
            Offset(context.width, height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.4),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(context.width / 5, height),
            Offset(context.width / 2, height - 40),
            Offset(context.width / 5 * 4, height - 80),
            Offset(context.width, height - 20)
          ]),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> offset = [];
  ShapeClipper(this.offset);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    path.quadraticBezierTo(
        offset[0].dx, offset[0].dy, offset[1].dx, offset[1].dy);
    path.quadraticBezierTo(
        offset[2].dx, offset[2].dy, offset[3].dx, offset[3].dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
