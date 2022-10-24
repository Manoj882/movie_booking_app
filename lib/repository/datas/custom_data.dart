import 'package:movie_booking_app/repository/models/ad_slider_model.dart';
import 'package:movie_booking_app/repository/models/menu_model.dart';

import '../../constants/constant.dart';
import '../models/movie_model.dart';

List<String> cities = [
  'Kathmandu',
  'Bhaktapur',
  'Lalitpur',
  'Pokhara',
  'Biratnagar',
  'Butwal',
];

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: "${Constants.baseAssetpath}/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "${Constants.baseAssetpath}/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "${Constants.baseAssetpath}/slider_banner.png",
      redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: 'Movies', asset: 'assets/images/menus/film.svg'),
  MenuModel(name: 'Events', asset: 'assets/images/menus/spotlights.svg'),
  MenuModel(name: 'Plays', asset: 'assets/images/menus/theater_masks.svg'),
  MenuModel(name: 'Sports', asset: 'assets/images/menus/running.svg'),
  MenuModel(name: 'Activity', asset: 'assets/images/menus/flag.svg'),
  MenuModel(name: 'Monum', asset: 'assets/images/menus/pyramid.svg'),
];

List<MovieModel> movies = [
  MovieModel(
    title: 'Prem Geet 3',
    description: 'description',
    actors: ['actor1','actor2'],
    like: 1000,
    bannerUrl: 'assets/images/movies/Prem_Geet_3.jpg',
  ),
  MovieModel(
    title: 'Chhakka Panja 3',
    description: 'description',
    actors: ['actor1','actor2'],
    like: 5000,
    bannerUrl: 'assets/images/movies/chakka_panja_3.jpg',
  ),
  MovieModel(
    title: 'kabbadi kabbadi 4',
    description: 'description',
    actors: ['actor1','actor2'],
    like: 8000,
    bannerUrl: 'assets/images/movies/kabbadi_kabbadi_4.jpg',
  ),
  MovieModel(
    title: 'A Mero Hajur 4',
    description: 'description',
    actors: ['actor1','actor2'],
    like: 1200,
    bannerUrl: 'assets/images/movies/a_mero_hajur_4.jpg',
  ),
];