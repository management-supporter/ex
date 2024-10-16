package jooq.custom.generator;

import static java.util.Locale.ROOT;
import org.jooq.codegen.DefaultGeneratorStrategy;
import org.jooq.meta.Definition;

public class JooqPrefixGeneratorStrategy extends DefaultGeneratorStrategy {

    @Override
    public String getJavaClassName(
        final Definition definition,
        final Mode mode
    ) {
        if (mode == Mode.DEFAULT) {
            String name = "J" + super.getJavaClassName(definition, mode);
            return name.toLowerCase(ROOT);
        }
        return super.getJavaClassName(definition, mode);
    }
}
