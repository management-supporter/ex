package project.io.app.core.user.domain;

import org.jooq.Converter;

public class ByteToBooleanConverter implements Converter<Byte, Boolean> {

    @Override
    public Boolean from(Byte databaseObject) {
        if (databaseObject == null) return null;
        return databaseObject != 0; // 0 이면 false, 그 외 true
    }

    @Override
    public Byte to(Boolean userObject) {
        if (userObject == null) return null;
        return userObject ? (byte) 1 : (byte) 0; // true 이면 1, false 이면 0
    }

    @Override
    public Class<Byte> fromType() {
        return Byte.class;
    }

    @Override
    public Class<Boolean> toType() {
        return Boolean.class;
    }
}
