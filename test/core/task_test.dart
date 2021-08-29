import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/core/errors/failures.dart';
import 'package:flutter_weather_app/core/task.dart';

void main() {
  final tTaskSuccess = Task.success('test');
  final tTaskFailed = Task.error(ServerFailure(statusCode: 400));
  group('fold', () {
    test('should return a value when task completed success', () {
      tTaskSuccess.fold(onSuccess: (v) {
        expect(tTaskSuccess.data, v);
      });
    });

    test('should return a failure when task failed', () {
      tTaskFailed.fold(
          onSuccess: (v) {},
          onError: (f) {
            expect(tTaskFailed.failure, f);
          });
    });
  });
}
