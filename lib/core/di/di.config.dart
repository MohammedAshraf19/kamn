// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/sports/data/data_source/sports_remote_data_source.dart'
    as _i575;
import '../../features/sports/data/repositories/sports_repository.dart'
    as _i379;
import '../../features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_cubit.dart'
    as _i137;
import '../../features/sports/presentation/cubits/pick_time_for_reservation/pick_time_for_reservation_view_model.dart'
    as _i282;
import '../../features/sports/presentation/cubits/sports_grounds/sports_ground_cubit.dart'
    as _i1033;
import '../../features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart'
    as _i1047;
import '../../features/sports_service_providers/data/repository/service_providers_repository.dart'
    as _i542;
import '../../features/sports_service_providers/domain/usecase/get_services_from_firebase_usecase.dart'
    as _i786;
import '../../features/sports_service_providers/presentation/cubit/add_service_provider/add_service_provider_cubit.dart'
    as _i252;
import '../../features/sports_service_providers/presentation/cubit/available_dates/available_dates_cubit.dart'
    as _i731;
import '../../features/sports_service_providers/presentation/cubit/edit_service_provider/edit_service_provider_cubit.dart'
    as _i773;
import '../../features/sports_service_providers/presentation/cubit/service_provider_ground_details/service_provider_ground_details_cubit.dart'
    as _i692;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_cubit.dart'
    as _i987;
import '../../features/sports_service_providers/presentation/cubit/service_provider_grounds/service_provider_grounds_view_model.dart'
    as _i1002;
import '../common/class/firebase_storage_services.dart' as _i304;
import '../common/class/firestore_services.dart' as _i158;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1002.ServiceProviderGroundsViewModel>(
        () => _i1002.ServiceProviderGroundsViewModel());
    gh.factory<_i282.PickTimeForReservationViewModel>(
        () => _i282.PickTimeForReservationViewModel());
    gh.lazySingleton<_i304.FirebaseStorageServices>(
        () => _i304.FirebaseStorageServices());
    gh.lazySingleton<_i158.FirestoreService>(() => _i158.FirestoreService());
    gh.factory<_i1047.ServiceProvidersRemoteDataSource>(
        () => _i1047.ServiceProvidersRemoteDataSourceImpl(
              firestoreServices: gh<_i158.FirestoreService>(),
              storageServies: gh<_i304.FirebaseStorageServices>(),
            ));
    gh.factory<_i542.ServiceProvidersRepository>(() =>
        _i542.ServiceProvidersRepositoryImpl(
            dataSource: gh<_i1047.ServiceProvidersRemoteDataSource>()));
    gh.factory<_i575.SportsRemoteDataSource>(() =>
        _i575.SportsRemoteDataSourceImpl(
            firestoreService: gh<_i158.FirestoreService>()));
    gh.factory<_i786.GetServicesFromFirebaseUsecase>(() =>
        _i786.GetServicesFromFirebaseUsecase(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i252.AddServiceProviderCubit>(() =>
        _i252.AddServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i731.AvailableDatesCubit>(() => _i731.AvailableDatesCubit(
        repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i773.EditServiceProviderCubit>(() =>
        _i773.EditServiceProviderCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i692.ServiceProviderGroundDetailsCubit>(() =>
        _i692.ServiceProviderGroundDetailsCubit(
            repository: gh<_i542.ServiceProvidersRepository>()));
    gh.factory<_i379.SportsRepository>(() => _i379.SportsRepositoryImpl(
        remoteDataSource: gh<_i575.SportsRemoteDataSource>()));
    gh.factory<_i987.ServiceProviderGroundsCubit>(
        () => _i987.ServiceProviderGroundsCubit(
              getPlaygroundUsecase: gh<_i786.GetServicesFromFirebaseUsecase>(),
              viewModel: gh<_i1002.ServiceProviderGroundsViewModel>(),
            ));
    gh.factory<_i1033.SportsGroundsCubit>(() => _i1033.SportsGroundsCubit(
        sportsRepository: gh<_i379.SportsRepository>()));
    gh.factory<_i137.PickTimeForReservationCubit>(
        () => _i137.PickTimeForReservationCubit(
              repository: gh<_i379.SportsRepository>(),
              viewModel: gh<_i282.PickTimeForReservationViewModel>(),
            ));
    return this;
  }
}
