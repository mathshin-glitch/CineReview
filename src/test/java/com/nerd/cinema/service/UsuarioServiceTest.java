package com.nerd.cinema.service;

import com.nerd.cinema.repository.UsuarioRepository;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import com.nerd.cinema.model.Usuario;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.when;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.never;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.springframework.security.crypto.password.PasswordEncoder;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.mockito.ArgumentCaptor;

@ExtendWith(MockitoExtension.class)
public class UsuarioServiceTest {

    @Mock
    private UsuarioRepository usuarioRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private UsuarioService usuarioService;

    //Método que verifica se o service impede o cadastro do Usuario 
    //Se o Email já estiver cadastro no banco de dados.    
    @Test
    public void deveImpedirCadastroQuandoEmailJaExiste() {

        // Arrange: preparação do cenário
        Usuario usuario = new Usuario(
                null,
                "Matheus",
                "teste@gmail.com",
                "senha123"
        );

        when(usuarioRepository.existsByEmail(usuario.getEmail()))
                .thenReturn(true);

        // Act: execução do método que queremos testar
        boolean resultado = usuarioService.cadastrarUsuario(usuario);

        // Assert: verificação do resultado
        assertFalse(resultado);

        verify(usuarioRepository, never()).save(usuario);
    }

    //Método para verificar se o Service cadastra o Usuario
    //Se o Email não estiver cadastro no banco de dados.
    @Test
    public void deveCadastrarQuandoEmailNaoExiste() {

        // Arrange: preparação do cenário
        Usuario usuario = new Usuario(
                null,
                "Matheus",
                "teste@gmail.com",
                "senha123"
        );

        when(usuarioRepository.existsByEmail(usuario.getEmail()))
                .thenReturn(false);

        // Simulando o retorno do BCrypt
        when(passwordEncoder.encode("senha123"))
                .thenReturn("hash-gerado");

        // Act: execução do método
        boolean resultado = usuarioService.cadastrarUsuario(usuario);

        // Assert: verificando o resultado
        assertTrue(resultado);

        // Capturando o objeto enviado ao Repository
        ArgumentCaptor<Usuario> captor
                = ArgumentCaptor.forClass(Usuario.class);

        verify(usuarioRepository).save(captor.capture());

        // Verificando se foi salvo o hash, e não a senha original
        assertEquals("hash-gerado", captor.getValue().getSenha());
        
        verify(passwordEncoder, never()).encode(usuario.getSenha());
    }
}
