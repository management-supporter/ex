package project.io.app.core.user.domain;

import java.util.Optional;

public interface UserEntityReadRepository {
    Optional<User> findById(Long userId);
}
