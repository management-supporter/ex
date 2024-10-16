package project.io.app.core.category.domain;

import lombok.Getter;
import project.io.app.core.common.BaseEntity;

import java.util.Objects;

@Getter
public class Category extends BaseEntity {
    private Long id;
    private String name;
    private Long parentId;

    private Category() {
    }

    public Category(
        final Long id,
        final String name,
        final Long parentId
    ) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }

    @Override
    public boolean equals(final Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final Category category = (Category) o;
        return Objects.equals(id, category.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
