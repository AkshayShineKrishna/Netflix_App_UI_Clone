// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix/Application/downloads/downloads_bloc.dart' as _i22;
import 'package:netflix/Application/home/home_bloc.dart' as _i23;
import 'package:netflix/Application/hot_and_new/hot_and_new_bloc.dart' as _i9;
import 'package:netflix/Application/search/search_bloc.dart' as _i24;
import 'package:netflix/Domain/Downloads/i_downloads_repo.dart' as _i10;
import 'package:netflix/Domain/Home/animation_response_services.dart' as _i3;
import 'package:netflix/Domain/Home/malayalam_movie_response_services.dart'
    as _i12;
import 'package:netflix/Domain/Home/released_past_year_services.dart' as _i14;
import 'package:netflix/Domain/Home/top_rated_services.dart' as _i18;
import 'package:netflix/Domain/Home/top_tv_show_services.dart' as _i20;
import 'package:netflix/Domain/hot_and_new/coming_soon_services.dart' as _i5;
import 'package:netflix/Domain/hot_and_new/everyones_watching_services.dart'
    as _i7;
import 'package:netflix/Domain/search/search_services.dart' as _i16;
import 'package:netflix/Infrastructure/downloads/downloads_repo.dart' as _i11;
import 'package:netflix/Infrastructure/home/animation_resp_impl.dart' as _i4;
import 'package:netflix/Infrastructure/home/malayalam_movie_impl.dart' as _i13;
import 'package:netflix/Infrastructure/home/released_past_impl.dart' as _i15;
import 'package:netflix/Infrastructure/home/top_rated_movies_impl.dart' as _i19;
import 'package:netflix/Infrastructure/home/top_tv_shows_impl.dart' as _i21;
import 'package:netflix/Infrastructure/hot_and_new/coming_soon_impl.dart'
    as _i6;
import 'package:netflix/Infrastructure/hot_and_new/everyones_watching_impl.dart'
    as _i8;
import 'package:netflix/Infrastructure/search/search_impl.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AnimationResponseServices>(
        () => _i4.AnimationResponseImpl());
    gh.lazySingleton<_i5.ComingSoonServices>(() => _i6.ComingSoonImpl());
    gh.lazySingleton<_i7.EveryonesWatchingServices>(
        () => _i8.EveryonesWatchingImpl());
    gh.factory<_i9.HotAndNewBloc>(() => _i9.HotAndNewBloc(
          gh<_i5.ComingSoonServices>(),
          gh<_i7.EveryonesWatchingServices>(),
        ));
    gh.lazySingleton<_i10.IDownloadsRepo>(() => _i11.DownloadsRepository());
    gh.lazySingleton<_i12.MalayalamMovieService>(
        () => _i13.MalayalamMovieImpl());
    gh.lazySingleton<_i14.ReleasedPastYearServices>(
        () => _i15.ReleasedPastYearImpl());
    gh.lazySingleton<_i16.SearchServices>(() => _i17.SearchImpl());
    gh.lazySingleton<_i18.TopRatedServices>(() => _i19.TopRatedMoviesImpl());
    gh.lazySingleton<_i20.TopTvShowsServices>(() => _i21.TopTvShowImpl());
    gh.factory<_i22.DownloadsBloc>(
        () => _i22.DownloadsBloc(gh<_i10.IDownloadsRepo>()));
    gh.factory<_i23.HomeBloc>(() => _i23.HomeBloc(
          gh<_i20.TopTvShowsServices>(),
          gh<_i18.TopRatedServices>(),
          gh<_i14.ReleasedPastYearServices>(),
          gh<_i3.AnimationResponseServices>(),
          gh<_i10.IDownloadsRepo>(),
          gh<_i12.MalayalamMovieService>(),
        ));
    gh.factory<_i24.SearchBloc>(() => _i24.SearchBloc(
          gh<_i10.IDownloadsRepo>(),
          gh<_i16.SearchServices>(),
        ));
    return this;
  }
}
