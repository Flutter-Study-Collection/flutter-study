final userDataSourceProvider = Provider<UserDataSource>((ref) => UserDataSource());

final userRepositoryProvider = Provider<UserRepository>(
        (ref) => UserRepositoryImpl(dataSource: ref.watch(userDataSourceProvider)));