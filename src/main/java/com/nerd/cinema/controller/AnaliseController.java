package com.nerd.cinema.controller;

import com.nerd.cinema.model.Analise;
import com.nerd.cinema.model.Filme;
import com.nerd.cinema.repository.AnaliseRepository;
import com.nerd.cinema.repository.FilmeRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Optional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
public class AnaliseController {

    
    //Declarar o Repository Analise
    private final AnaliseRepository analiseRepository;
    //Declarar O Repository Filme
    private final FilmeRepository filmeRepository;
    
    //Construtor que conecta o Controller com o Repository.
    public AnaliseController(AnaliseRepository analiseRepository, FilmeRepository filmeRepository){
        this.analiseRepository = analiseRepository;
        this.filmeRepository = filmeRepository;
    }
    
    //Método get para retorna lista de analise.
    @GetMapping("/analises")
    public List<Analise> listarAnalise(){
        return analiseRepository.findAll();
    }
    
    //Método para cadastrar analise no banco.
    @PostMapping("/analises")
    public Analise cadastrarAnalise(@RequestBody Analise analise){
        
        //Pegando o ID do Postman do filme
        Integer idFilme = analise.getFilme().getId();
        //Pegando o filme do banco pelo ID, Opcional.
        Optional<Filme> filme = filmeRepository.findById(idFilme);
        //Condiçao se o Filme não for Encontrado.
        if(filme.isEmpty()){
            return null;
        }
        //Colotando o Filme do banco.
        Filme filmeEncontrado = filme.get();
        //Adicionando o filme encontrado no banco na analise.
        analise.setFilme(filmeEncontrado);
        //Adicionando analise no banco.
        analiseRepository.save(analise);
        
        return analise;
    }
    
    //Método para encontrar analise pelo ID.
    @GetMapping("/analises/{id}")
    public Analise buscarAnalise(@PathVariable Integer id){
        //Retorna a analise pelo ID do Postman.
        return analiseRepository.findById(id).orElse(null);
    }
    
    //Método para atualizar a analise do banco pela ID.
    @PutMapping("/analises/{id}")
    public Analise atualizarAnalise(@PathVariable Integer id, @RequestBody Analise novaAnalise){
        
        //Buscando analise pelo ID.
        Analise analise = buscarAnalise(id);
        //Condição se a analise não for encontrada.
        if(analise == null){
            return null;
        }
        //Adicionando dados atualizado na analise.
        analise.setAnalise(novaAnalise.getAnalise());
        analise.setNota(novaAnalise.getNota());
        
        //Coletando o id do filme que pertence a analise.
        Integer idFilme = novaAnalise.getFilme().getId();
        //Recebe os dados do filme do banco.
        //Caso queira alterar também o ID do filme que está associado
        Optional<Filme> filme = filmeRepository.findById(idFilme);
        
        //Condição se o filme não for encontrado.
        if(filme.isEmpty()){
            return null;
        }
        
        //Coletando o filme encontrado no banco.
        Filme filmeEncontrado = filme.get();
        //Atualizando o novo filme associado a analise.
        analise.setFilme(filmeEncontrado);
        //Salvando a analise atualizada no banco
        analiseRepository.save(analise);
        return analise;
    }    
    
    //Método para deletar analise do banco.
    @DeleteMapping("/analises/{id}")
    public void deletarAnalise(@PathVariable Integer id){
        
        //Buscando analise pelo ID.
        Analise analise = buscarAnalise(id);
        //Se a analise não for encontrada.
        if(analise == null){
            return;
        }
        //Deleta o filme do banco.
        analiseRepository.deleteById(analise.getId());
    }
}