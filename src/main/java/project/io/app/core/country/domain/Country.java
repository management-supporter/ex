package project.io.app.core.country.domain;

import lombok.Getter;
import project.io.app.core.common.BaseEntity;

import java.util.Objects;

@Getter
public class Country extends BaseEntity {
    private Long id;
    private String code;
    private String enName;
    private String krName;

    private Country() {
    }

    public Country(
        final Long id,
        final String code,
        final String enName,
        final String krName
    ) {
        this.id = id;
        this.code = code;
        this.enName = enName;
        this.krName = krName;
    }

    @Override
    public boolean equals(final Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final Country country = (Country) o;
        return Objects.equals(id, country.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
