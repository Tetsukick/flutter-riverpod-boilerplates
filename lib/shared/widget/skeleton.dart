import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({this.height, this.width, this.color, super.key});

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const defaultPadding = 8.0;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: color ?? Colors.black.withOpacity(0.04),
          borderRadius:
          const BorderRadius.all(Radius.circular(defaultPadding)),),
    );
  }
}

class RoundedSkeleton extends StatelessWidget {
  const RoundedSkeleton({
    required this.height, this.width, this.color, super.key,});

  final double height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const defaultPadding = 8.0;
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: color ?? Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.all(Radius.circular(height / 2)),),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({super.key, this.size = 24});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}
