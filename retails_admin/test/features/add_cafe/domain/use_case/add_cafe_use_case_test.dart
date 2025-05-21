import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retails_admin/features/add_cafe/domain/models/cafe_data.dart';
import 'package:retails_admin/features/add_cafe/domain/repo/add_cafe_repo.dart';
import 'package:retails_admin/features/add_cafe/domain/use_case/add_cafe_use_case.dart';

// Create a mock class for AddCafeRepo
class MockAddCafeRepo extends Mock implements AddCafeRepo {}

void main() {
  late AddCafeUseCase addCafeUseCase;
  late MockAddCafeRepo mockAddCafeRepo;

  setUp(() {
    mockAddCafeRepo = MockAddCafeRepo();
    addCafeUseCase = AddCafeUseCase(mockAddCafeRepo);
  });

  // Create a dummy CafeData instance for testing
  final tCafeData = CafeData(); // Assuming CafeData has a default constructor or you'll fill in required fields

  test('should call addCafe on the repository with correct data', () async {
    // Arrange
    // No specific arrangement needed for a void future, but if it returned a value:
    // when(mockAddCafeRepo.addCafe(any)).thenAnswer((_) async => /* some success value */);
    when(mockAddCafeRepo.addCafe(any)).thenAnswer((_) async {});


    // Act
    await addCafeUseCase.addCafe(tCafeData);

    // Assert
    verify(mockAddCafeRepo.addCafe(tCafeData)).called(1);
    verifyNoMoreInteractions(mockAddCafeRepo);
  });

  test('should rethrow the exception when repository throws an error', () async {
    // Arrange
    final tException = Exception('Test Exception');
    when(mockAddCafeRepo.addCafe(any)).thenThrow(tException);

    // Act
    final call = addCafeUseCase.addCafe;

    // Assert
    expect(() => call(tCafeData), throwsA(isA<Exception>()));
    verify(mockAddCafeRepo.addCafe(tCafeData)).called(1);
    verifyNoMoreInteractions(mockAddCafeRepo);
  });
}
