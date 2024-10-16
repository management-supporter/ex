package project.io.app.core.user.presentation;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.io.app.core.user.domain.UserEntityReadRepository;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/users")
public class UserSearchApi {

    private final UserEntityReadRepository userReadRepository;

    @GetMapping(path = "/{userId}")
    public void findById(@PathVariable(name = "userId") Long userId) {
        userReadRepository.findById(userId);
    }
}
