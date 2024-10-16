package project.io.app.core.user.domain;

public interface UserEntityWriteRepository {
    void insertUser(User user);

    void update(Long userId, String nickname);

    void updateWithActiveRecord(Long userId, String nickname);
}
