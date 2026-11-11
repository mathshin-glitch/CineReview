package com.nerd.cinema.service;

import com.nerd.cinema.model.Usuario;
import org.springframework.stereotype.Service;
import com.nerd.cinema.repository.UsuarioRepository;

@Service
public class UsuarioService {
    
    //Declarando Repository
    private final UsuarioRepository usuarioRepository;
    
    //Construtor
    public UsuarioService(UsuarioRepository usuarioRepository){
        this.usuarioRepository = usuarioRepository;
    }
    
    //Método de Cadastro que verifica o Email.
    public boolean cadastrarUsuario(Usuario usuario){
        
        //Condição if, para verificar se o email existe.
        if(usuarioRepository.existsByEmail(usuario.getEmail())){
            return false;
        }
        
        //Salvando o usuario no banco.
        usuarioRepository.save(usuario);
        return true;
    }
}
