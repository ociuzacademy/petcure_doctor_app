import 'package:flutter_test/flutter_test.dart';
import 'package:petcure_doctor_app/core/helpers/validators.dart';

void main() {
  group('Validators - required', () {
    test('should return error message for null or empty value', () {
      expect(Validators.required(null, 'Name'), 'Please enter Name');
      expect(Validators.required('', 'Name'), 'Please enter Name');
      expect(Validators.required('  ', 'Name'), 'Please enter Name');
    });

    test('should return null for non-empty value', () {
      expect(Validators.required('John', 'Name'), null);
    });
  });

  group('Validators - email', () {
    test('should return error for invalid email', () {
      expect(Validators.email(null), 'Please enter your email');
      expect(Validators.email(''), 'Please enter your email');
      expect(Validators.email('plainaddress'), 'Please enter a valid email');
      expect(Validators.email('attest.com'), 'Please enter a valid email');
      expect(Validators.email('test@com'), 'Please enter a valid email');
    });

    test('should return null for valid email', () {
      expect(Validators.email('test@example.com'), null);
      expect(Validators.email('user.name+tag@domain.co.id'), null);
    });
  });

  group('Validators - password', () {
    test('should return error for invalid password', () {
      expect(Validators.password(null), 'Please enter password');
      expect(
        Validators.password('123'),
        'Password must be at least 8 characters',
      );
      expect(
        Validators.password('password'),
        'Password must contain at least one uppercase letter',
      );
      expect(
        Validators.password('PASSWORD'),
        'Password must contain at least one lowercase letter',
      );
      expect(
        Validators.password('Password'),
        'Password must contain at least one number',
      );
      expect(
        Validators.password('Password123'),
        'Password must contain at least one special character',
      );
    });

    test('should return null for valid password', () {
      expect(Validators.password('P@ssword123'), null);
    });
  });

  group('Validators - phone', () {
    test('should return error for invalid phone', () {
      expect(Validators.phone(null), 'Please enter phone number');
      expect(Validators.phone('123'), 'Please enter a valid phone number');
      expect(
        Validators.phone('abc1234567'),
        'Please enter a valid phone number',
      );
    });

    test('should return null for valid phone', () {
      expect(Validators.phone('1234567890'), null);
      expect(Validators.phone('+911234567890'), null);
      expect(Validators.phone('+1234567890123'), null);
    });
  });

  group('Validators - name', () {
    test('should return error for invalid name', () {
      expect(Validators.name(null, 'Full Name'), 'Please enter Full Name');
      expect(
        Validators.name('A', 'Full Name'),
        'Full Name must be at least 2 characters',
      );
      expect(
        Validators.name('John123', 'Full Name'),
        'Please enter a valid Full Name (only letters)',
      );
    });

    test('should return null for valid name', () {
      expect(Validators.name('John Doe', 'Full Name'), null);
      expect(Validators.name("O'Connor", 'Full Name'), null);
    });
  });
}
