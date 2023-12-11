import 'package:codwise/constants.dart';
import 'package:flutter/material.dart';

enum AboutStep {
  first(
      title: "Keep",
      description:
          "Keep it always open in one of your tabs or save in your bookmarks to have an easy everyday access.",
      bgColor: AppColors.aboutStep1Background,
      bgAccentColor: AppColors.aboutStep1BackgroundAccent,
      titleTextColor: AppColors.aboutStep1Text,
      emoji: "☝"),
  second(
      title: "Share",
      description:
          "Share it with your colleagues on daily stand-ups before you start sharing other stuff like boards, tickets and tasks.",
      bgColor: AppColors.aboutStep2Background,
      bgAccentColor: AppColors.aboutStep2BackgroundAccent,
      titleTextColor: AppColors.aboutStep2Text,
      emoji: "✌"),
  third(
      title: "Discuss",
      description:
          "Have a small talk discussing a quote. What do you think about it? Do you agree? Anything you can adopt?",
      bgColor: AppColors.aboutStep3Background,
      bgAccentColor: AppColors.aboutStep3BackgroundAccent,
      titleTextColor: AppColors.aboutStep3Text,
      emoji: "👍");

  const AboutStep({
    required this.title,
    required this.description,
    required this.bgColor,
    required this.bgAccentColor,
    required this.titleTextColor,
    required this.emoji,
  });

  final String title;
  final String description;
  final Color bgColor;
  final Color bgAccentColor;
  final Color titleTextColor;
  final String emoji;
}
