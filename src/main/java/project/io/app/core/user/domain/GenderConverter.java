package project.io.app.core.user.domain;

import org.jooq.Converter;

public class GenderConverter implements Converter<String, Gender> {

    @Override
    public Gender from(String databaseObject) {
        if (databaseObject == null) {
            return null;
        }
        return Gender.valueOf(databaseObject.toUpperCase());
    }

    @Override
    public String to(Gender userObject) {
        if (userObject == null) {
            return null;
        }
        return userObject.name();
    }

    @Override
    public Class<String> fromType() {
        return String.class;
    }

    @Override
    public Class<Gender> toType() {
        return Gender.class;
    }
}
