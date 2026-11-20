package com.nerd.cinema.service;

import com.nerd.cinema.model.Usuario;
import com.nerd.cinema.model.Perfil;
import org.springframework.stereotype.Service;
import com.nerd.cinema.repository.UsuarioRepository;
import org.springframework.security.crypto.password.PasswordEncoder;

@Service
public class UsuarioService {
    
    //Declarando Repository
    private final UsuarioRepository usuarioRepository;
    //Declatando Hash BCrypy
    private final PasswordEncoder passwordEncoder;
   
    //Construtor
    public UsuarioService(UsuarioRepository usuarioRepository , PasswordEncoder passwordEncoder){
        this.usuarioRepository = usuarioRepository;
        this.passwordEncoder = passwordEncoder;
    }
    
    //Método de Cadastro que verifica o Email.
    public boolean cadastrarUsuario(Usuario usuario){
        
        //Condição if, para verificar se o email existe.
        if(usuarioRepository.existsByEmail(usuario.getEmail())){
            return false;
        }
        
        //Definindo o perfil padrão para novos cadastros.
        usuario.setPerfil(Perfil.USER);
        
        //Linha responsavel pela geração da Hash.
        String senhaHash = passwordEncoder.encode(usuario.getSenha());
        
        //Editando o usuario com a senha Hash.
        usuario.setSenha(senhaHash);
        
        //Salvando o usuario no banco.
        usuarioRepository.save(usuario);
        return true;
        
    }
}
