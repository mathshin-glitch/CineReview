package com.nerd.cinema.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Filme {
    
    //Atributos
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    private String titulo;
    private String sinopse;
    private String genero;
    private Integer lancamento;
    
    //Construtor
    public Filme(Integer id, String titulo, String sinopse, String genero, Integer lancamento){
        this.id = id;
        this.titulo = titulo;
        this.sinopse = sinopse;
        this.genero = genero;
        this.lancamento = lancamento;
    }
    
    //Construtor sem o ID.
    public Filme(String titulo, String sinopse, String genero, Integer lancamento) {
    this.titulo = titulo;
    this.sinopse = sinopse;
    this.genero = genero;
    this.lancamento = lancamento;
    }
    
    //Construto vazio
    public Filme(){
        
    }
    
    //Get e Set
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Integer getLancamento() {
        return lancamento;
    }

    public void setLancamento(Integer lancamento) {
        this.lancamento = lancamento;
    }

}
