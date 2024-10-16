package project.io.app.core.user.application.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import project.io.app.core.user.application.UserReadUseCase;
import project.io.app.core.user.domain.User;
import project.io.app.core.user.domain.UserEntityReadRepository;

@Service
@RequiredArgsConstructor
public class UserReadService implements UserReadUseCase {

    private final UserEntityReadRepository userReadRepository;

    @Override
    public User findById(Long userId) {
        return userReadRepository.findById(userId)
            .orElseThrow();
    }
}
