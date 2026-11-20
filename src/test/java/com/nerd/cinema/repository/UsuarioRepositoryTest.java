package com.nerd.cinema.repository;

import com.nerd.cinema.model.Perfil;
import com.nerd.cinema.model.Usuario;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
public class UsuarioRepositoryTest {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Test
    public void deveSalvarUsuarioNoBancoDeDados() {

        // Arrange: preparando o usuário.
        Usuario usuario = new Usuario(
                null,
                "Matheus",
                "teste@gmail.com",
                "hash-teste",
                Perfil.USER
        );

        // Act: salvando no banco H2.
        Usuario usuarioSalvo = usuarioRepository.save(usuario);

        // Assert: verificando se foi persistido.
        assertNotNull(usuarioSalvo.getId());

        Usuario usuarioEncontrado = usuarioRepository
                .findById(usuarioSalvo.getId())
                .orElse(null);

        assertNotNull(usuarioEncontrado);
        assertEquals("Matheus", usuarioEncontrado.getNome());
        assertEquals("teste@gmail.com", usuarioEncontrado.getEmail());
        assertEquals(Perfil.USER, usuarioEncontrado.getPerfil());
    }
}