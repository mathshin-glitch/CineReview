package com.nerd.cinema.controller;

//Importando.
import org.springframework.stereotype.Controller;
//Importando Model
import org.springframework.ui.Model;
//Impotando Anotação GetMapping
import org.springframework.web.bind.annotation.GetMapping;
//Importando Anotação PutMapping
import org.springframework.web.bind.annotation.PostMapping;
//Importando Anotação PathVariable
import org.springframework.web.bind.annotation.PathVariable;
//Importando Model Attribute
import org.springframework.web.bind.annotation.ModelAttribute;
//Importando Classe
import com.nerd.cinema.model.Filme;
import com.nerd.cinema.model.Analise;

//Importando ArrayList<>
import java.util.ArrayList;

//Dizendo para o Spring que essa é uma classe de Controle.
@Controller
public class HomeController {
    
    //Método para abrir pagina cadastro.
    @GetMapping("/cadastro")
    public String cadastro() {
        return "cadastro";
    }

    //Método para abrir pagina de resultado.
    @GetMapping("/resultado")
    public String resultado() {
        return "resultado";
    }

    //Método para abrir detalhes do filme pelo id URL.
    @GetMapping("/filme/{id}")
    public String detalhes(@PathVariable Integer id) {
        return "detalhes";
    }
}
