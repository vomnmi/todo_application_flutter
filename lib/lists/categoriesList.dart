import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../themes/app_colors.dart';

List<CategoryModel> categories = [
  CategoryModel(
    color: AppColors.groceryColor,
    iconPath: 'assets/icons/category_icons/grocery.svg',
    title: 'Grocery',
  ),
  CategoryModel(
    color: AppColors.workColor,
    iconPath: 'assets/icons/category_icons/work.svg',
    title: 'Work',
  ),
  CategoryModel(
    color: AppColors.sportColor,
    iconPath: 'assets/icons/category_icons/sport.svg',
    title: 'Sport',
  ),
  CategoryModel(
    color: AppColors.designColor,
    iconPath: 'assets/icons/category_icons/design.svg',
    title: 'Design',
  ),
  CategoryModel(
    color: AppColors.universityColor,
    iconPath: 'assets/icons/category_icons/university.svg',
    title: 'University',
  ),
  CategoryModel(
    color: AppColors.socialColor,
    iconPath: 'assets/icons/category_icons/social.svg',
    title: 'Social',
  ),
  CategoryModel(
    color: AppColors.musicColor,
    iconPath: 'assets/icons/category_icons/music.svg',
    title: 'Music',
  ),
  CategoryModel(
    color: AppColors.healthColor,
    iconPath: 'assets/icons/category_icons/health.svg',
    title: 'Health',
  ),
  CategoryModel(
    color: AppColors.movieColor,
    iconPath: 'assets/icons/category_icons/movie.svg',
    title: 'Movie',
  ),
  CategoryModel(
    color: AppColors.homeColor,
    iconPath: 'assets/icons/category_icons/home.svg',
    title: 'Home',
  ),
  CategoryModel(
    color: Colors.black,
    iconPath: 'assets/icons/category_icons/other.svg',
    title: 'Other',
  ),
];
