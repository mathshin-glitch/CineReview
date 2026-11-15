package com.nerd.cinema.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

//Anotação que Informa que essa classe contem configurações do BCrypt.
@Configuration
public class PasswordConfig {
    
    // Informa ao Spring que esse método disponibiliza um objeto
    // que será criado e gerenciado pelo Spring Container.
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
