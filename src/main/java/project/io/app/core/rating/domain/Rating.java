package project.io.app.core.rating.domain;

import lombok.Getter;
import project.io.app.core.common.BaseEntity;

import java.util.Objects;

@Getter
public class Rating extends BaseEntity {
    private Long id;
    private Long userId;
    private Long productId;
    private double rating;

    private Rating() {
    }

    public Rating(
        final Long id,
        final Long userId,
        final Long productId,
        final double rating
    ) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.rating = rating;
    }

    @Override
    public boolean equals(final Object object) {
        if (this == object) {
            return true;
        }
        if (object == null || getClass() != object.getClass()) {
            return false;
        }
        final Rating rating1 = (Rating) object;
        return Double.compare(rating, rating1.rating) == 0
            && Objects.equals(id, rating1.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, rating);
    }
}
