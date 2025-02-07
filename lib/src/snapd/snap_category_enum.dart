import 'package:flutter/widgets.dart';
import 'package:snapd/snapd.dart';
import 'package:yaru_icons/yaru_icons.dart';

import '/l10n.dart';

extension SnapCategoryX on SnapCategory {
  SnapCategoryEnum get categoryEnum => name.toSnapCategoryEnum();
}

extension StringX on String {
  SnapCategoryEnum toSnapCategoryEnum() => SnapCategoryEnum.values.byName(
        replaceAllMapped(
          RegExp(r'-(.)'),
          (match) => match[1]!.toUpperCase(),
        ),
      );
}

enum SnapCategoryEnum {
  artAndDesign,
  booksAndReference,
  development,
  devicesAndIot,
  education,
  entertainment,
  featured,
  finance,
  games,
  healthAndFitness,
  musicAndAudio,
  newsAndWeather,
  personalisation,
  photoAndVideo,
  productivity,
  science,
  security,
  serverAndCloud,
  social,
  utilities,
  unknown,
  ubuntuDesktop;

  bool get hidden => [unknown, ubuntuDesktop].contains(this);

  String get categoryName => name.replaceAllMapped(
      RegExp(r'[A-Z]'), (match) => '-${match[0]!.toLowerCase()}');

  List<String>? get featuredSnapNames => switch (this) {
        development => ['code', 'postman', 'phpstorm'],
        games => ['steam', 'discord', 'mc-installer', '0ad'],
        productivity => ['chromium', 'wekan', 'firefox'],
        ubuntuDesktop => [
            'libreoffice',
            'thunderbird',
            'shotwell',
            'transmission',
            'cheese',
            'remmina',
            'gnome-calendar',
            'gnome-mahjongg',
            'gnome-mines',
            'gnome-sudoku',
          ],
        _ => null,
      };

  String localize(AppLocalizations l10n) => switch (this) {
        artAndDesign => l10n.snapCategoryArtAndDesign,
        booksAndReference => l10n.snapCategoryBooksAndReference,
        development => l10n.snapCategoryDevelopment,
        devicesAndIot => l10n.snapCategoryDevicesAndIot,
        education => l10n.snapCategoryEducation,
        entertainment => l10n.snapCategoryEntertainment,
        featured => l10n.snapCategoryFeatured,
        finance => l10n.snapCategoryFinance,
        games => l10n.snapCategoryGames,
        healthAndFitness => l10n.snapCategoryHealthAndFitness,
        musicAndAudio => l10n.snapCategoryMusicAndAudio,
        newsAndWeather => l10n.snapCategoryNewsAndWeather,
        personalisation => l10n.snapCategoryPersonalisation,
        photoAndVideo => l10n.snapCategoryPhotoAndVideo,
        productivity => l10n.snapCategoryProductivity,
        science => l10n.snapCategoryScience,
        security => l10n.snapCategorySecurity,
        serverAndCloud => l10n.snapCategoryServerAndCloud,
        social => l10n.snapCategorySocial,
        ubuntuDesktop => l10n.snapCategoryUbuntuDesktop,
        utilities => l10n.snapCategoryUtilities,
        _ => name
      };

  String slogan(AppLocalizations l10n) => switch (this) {
        development => l10n.snapCategoryDevelopmentSlogan,
        featured => l10n.snapCategoryFeaturedSlogan,
        games => l10n.snapCategoryGamesSlogan,
        productivity => l10n.snapCategoryProductivitySlogan,
        ubuntuDesktop => l10n.snapCategoryUbuntuDesktopSlogan,
        _ => '',
      };

  String buttonLabel(AppLocalizations l10n) => switch (this) {
        productivity => l10n.snapCategoryProductivityButtonLabel,
        _ => l10n.snapCategoryDefaultButtonLabel,
      };

  IconData getIcon(bool selected) => switch (this) {
        artAndDesign =>
          selected ? YaruIcons.rule_and_pen_filled : YaruIcons.rule_and_pen,
        booksAndReference => selected ? YaruIcons.book_filled : YaruIcons.book,
        development => YaruIcons.wrench,
        devicesAndIot => selected ? YaruIcons.chip_filled : YaruIcons.chip,
        education =>
          selected ? YaruIcons.education_filled : YaruIcons.education,
        entertainment =>
          selected ? YaruIcons.television_filled : YaruIcons.television,
        featured => selected ? YaruIcons.star_filled : YaruIcons.star,
        finance => YaruIcons.calculator,
        games => selected ? YaruIcons.games_filled : YaruIcons.games,
        healthAndFitness =>
          selected ? YaruIcons.health_filled : YaruIcons.health,
        musicAndAudio => YaruIcons.headphones,
        newsAndWeather => selected ? YaruIcons.storm_filled : YaruIcons.storm,
        personalisation => selected
            ? YaruIcons.desktop_appearance_filled
            : YaruIcons.desktop_appearance,
        photoAndVideo =>
          selected ? YaruIcons.camera_photo_filed : YaruIcons.camera_photo,
        productivity => selected ? YaruIcons.clock_filled : YaruIcons.clock,
        science => selected ? YaruIcons.beaker_filled : YaruIcons.beaker,
        security => selected ? YaruIcons.shield_filled : YaruIcons.shield,
        serverAndCloud => selected ? YaruIcons.cloud_filled : YaruIcons.cloud,
        social => selected ? YaruIcons.chat_text_filled : YaruIcons.chat_text,
        utilities =>
          selected ? YaruIcons.swiss_knife_filled : YaruIcons.swiss_knife,
        _ => YaruIcons.application,
      };

// TODO: map remaining categories to colors once the design is ready
  List<Color> get bannerColors => switch (this) {
        development => _kBannerColors[9],
        productivity => _kBannerColors[4],
        _ => _kBannerColors[0]
      };
}

const _kBannerColors = [
  [
    Color(0xff320a39),
    Color(0xff0a737e),
  ],
  [
    Color(0xff280684),
    Color(0xff21bdb8),
  ],
  [
    Color(0xff082435),
    Color(0xff297068),
  ],
  [
    Color(0xff271658),
    Color(0xff3be173),
  ],
  [
    Color(0xff12224b),
    Color(0xffd27ed9),
  ],
  [
    Color(0xff000594),
    Color(0xffff9bb3),
  ],
  [
    Color(0xff360050),
    Color(0xffe13b95),
  ],
  [
    Color(0xff30001a),
    Color(0xfff90c71),
  ],
  [
    Color(0xff700045),
    Color(0xffe95420),
  ],
  [
    Color(0xffb41601),
    Color(0xfffeac0c),
  ],
];
