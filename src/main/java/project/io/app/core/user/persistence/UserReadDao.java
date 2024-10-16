package project.io.app.core.user.persistence;

import org.jooq.DSLContext;
import org.jooq.generated.Tables;
import static org.jooq.generated.Tables.USERS;
import org.springframework.stereotype.Repository;
import project.io.app.core.user.domain.User;
import project.io.app.core.user.domain.UserEntityReadRepository;

import java.util.Optional;

@Repository
public class UserReadDao implements UserEntityReadRepository {

    private final DSLContext dslContext;

    public UserReadDao(DSLContext dslContext) {
        this.dslContext = dslContext;
    }

    public Optional<User> findById(final Long userId) {
        return Optional.ofNullable(dslContext.selectFrom(Tables.USERS)
            .where(USERS.ID.eq(userId))
            .fetchOneInto(User.class));
    }
}
