package com.nerd.cinema.controller;

import com.nerd.cinema.model.Filme;
import org.springframework.web.bind.annotation.RestController;
import com.nerd.cinema.repository.FilmeRepository;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;

@RestController
public class FilmeController {
    
    //Declarando o Filme Repository.
    private final FilmeRepository filmeRepository;
    
    //Construtor para conectar o Controller no Repository
    public FilmeController(FilmeRepository filmeRepository){
        this.filmeRepository = filmeRepository;
    }
    
    //Método get para retornar lista de filmes.
    @GetMapping("/filmes")
    public List<Filme> listarFilmes(){ //Método do tipo List<Filme>
        //Retorna todos os filmes do banco.
        return filmeRepository.findAll();
    }
    
    //Método post para cadastrar filme no banco.
    @PostMapping("/filmes")
    public Filme cadastrarFilme(@RequestBody Filme filme){
        filmeRepository.save(filme);
        return filme;
    }
    
    //Método para encontrar Filme no banco pelo ID.
    @GetMapping("/filmes/{id}")
    public Filme buscarFilme(@PathVariable Integer id){
        
        //Retornando o Filme do banco pelo id do Parametro
       return filmeRepository.findById(id).orElse(null);
    }
    
    //Método para atualizar filme do banco.
    @PutMapping("/filmes/{id}")
    public Filme atualizarFilme(@PathVariable Integer id, @RequestBody Filme novoFilme){
    
    //Chama o Método Encontrar filme pelo ID.
    //E colocar no obj filme. 
    Filme filme = buscarFilme(id);
    //Condição se o filme não for encontrado.
    if(filme == null){
        return null;
    }
    //Colocando os novos dados da url put no objeto.
    //Dados recebido do Postman em json.
    filme.setTitulo(novoFilme.getTitulo());
    filme.setSinopse(novoFilme.getSinopse());
    filme.setGenero(novoFilme.getGenero());
    filme.setLancamento(novoFilme.getLancamento());
    
    filmeRepository.save(filme);
    
    //Retorna o filme com os dados atualizado.
    return filme;
    } 
    
        
    //Método para excluir filme do banco.
    @DeleteMapping("/filmes/{id}")
    public void deletarFilme(@PathVariable Integer id){
        
        //Encontrar filme no banco pelo id.
        Filme filme = buscarFilme(id);
        
        //Condição para verificar se Filme existe no banco.
        if(filme != null){
            //Excluindo filme do banco.
            filmeRepository.deleteById(filme.getId());
        }
    }
}