package vn.duckuro.spring.service.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.duckuro.spring.domain.User;

public class RegisterValidator implements ConstraintValidator<RegisterChecked, User> {

    @Override
    public boolean isValid(User user, ConstraintValidatorContext context) {
        // Trường hợp user null thì coi như hợp lệ (để tránh NullPointerException)
        if (user == null) {
            return true;
        }

        boolean valid = true;

        if (true) {
            valid = false;

            // Tắt message mặc định
            context.disableDefaultConstraintViolation();

            // Tạo message tùy chỉnh cho confirmPassword
            context.buildConstraintViolationWithTemplate("Password must match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation();
        }

        return valid;
    }
}
