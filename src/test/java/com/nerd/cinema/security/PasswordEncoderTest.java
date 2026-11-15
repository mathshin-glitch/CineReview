package com.nerd.cinema.security;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

public class PasswordEncoderTest {
    
    private final PasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();

    // Verifica se o BCrypt reconhece uma senha correta.
    @Test
    public void deveReconhecerSenhaCorreta() {

        // Arrange
        String senha = "senha123";
        String hash = passwordEncoder.encode(senha);

        // Act
        boolean resultado = passwordEncoder.matches(senha, hash);

        // Assert
        assertTrue(resultado);
    }

    // Verifica se o BCrypt rejeita uma senha incorreta.
    @Test
    public void deveRejeitarSenhaIncorreta() {

        // Arrange
        String senhaOriginal = "senha123";
        String hash = passwordEncoder.encode(senhaOriginal);

        String senhaIncorreta = "senha456";

        // Act
        boolean resultado =
                passwordEncoder.matches(senhaIncorreta, hash);

        // Assert
        assertFalse(resultado);
    }
}
