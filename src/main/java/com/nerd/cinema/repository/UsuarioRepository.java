package com.nerd.cinema.repository;

import com.nerd.cinema.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

//Classe Repository, para fazer consultas do banco.
public interface UsuarioRepository extends JpaRepository<Usuario,Long>{
    
    //Método para verificar se o usuario existe.
    public boolean existsByEmail(String email);
}
