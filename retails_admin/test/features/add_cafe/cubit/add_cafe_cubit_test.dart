import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart'; // Ensure this dependency exists
import 'package:retails_admin/features/add_cafe/cubit/add_cafe_cubit.dart';
import 'package:retails_admin/features/add_cafe/domain/models/cafe_data.dart';
import 'package:retails_admin/features/add_cafe/domain/use_case/add_cafe_use_case.dart';

// Create a mock class for AddCafeUseCase
class MockAddCafeUseCase extends Mock implements AddCafeUseCase {}

void main() {
  late AddCafeCubit addCafeCubit;
  late MockAddCafeUseCase mockAddCafeUseCase;

  setUp(() {
    mockAddCafeUseCase = MockAddCafeUseCase();
    addCafeCubit = AddCafeCubit(mockAddCafeUseCase);
  });

  tearDown(() {
    addCafeCubit.close();
  });

  final tCafeData = CafeData(); // Dummy data

  test('initial state should be AddCafeInitial', () {
    expect(addCafeCubit.state, const AddCafeInitial());
  });

  blocTest<AddCafeCubit, AddCafeState>(
    'emits [AddCafeLoading, AddCafeSuccess] when addCafe succeeds',
    build: () {
      when(mockAddCafeUseCase.addCafe(any)).thenAnswer((_) async {});
      return addCafeCubit;
    },
    act: (cubit) => cubit.submitAddCafe(tCafeData),
    expect: () => const <AddCafeState>[
      AddCafeLoading(),
      AddCafeSuccess(),
    ],
    verify: (_) {
      verify(mockAddCafeUseCase.addCafe(tCafeData)).called(1);
    },
  );

  blocTest<AddCafeCubit, AddCafeState>(
    'emits [AddCafeLoading, AddCafeFailure] when addCafe throws an error',
    build: () {
      when(mockAddCafeUseCase.addCafe(any)).thenThrow(Exception('Test error'));
      return addCafeCubit;
    },
    act: (cubit) => cubit.submitAddCafe(tCafeData),
    expect: () => const <AddCafeState>[
      AddCafeLoading(),
      AddCafeFailure(message: 'Exception: Test error'),
    ],
    verify: (_) {
      verify(mockAddCafeUseCase.addCafe(tCafeData)).called(1);
    },
  );
}
