package project.io.app.common.configuration;

import org.jooq.conf.ExecuteWithoutWhere;
import org.jooq.conf.Settings;
import org.springframework.boot.autoconfigure.jooq.DefaultConfigurationCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JooqConfig {

    @Bean
    public Settings jooqSettings() {
        return new Settings()
            .withRenderSchema(false);
    }

    @Bean
    public DefaultConfigurationCustomizer jooqDefaultConfigurationCustomizer() {
        return c -> c.settings()
            .withExecuteDeleteWithoutWhere(ExecuteWithoutWhere.THROW)
            .withExecuteUpdateWithoutWhere(ExecuteWithoutWhere.THROW)
            .withRenderSchema(false);
    }
}
