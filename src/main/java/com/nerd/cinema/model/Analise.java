package com.nerd.cinema.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Analise {

    //Atributos
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @ManyToOne
    private Filme filme;
    
    private String analise;
    private Double nota;
    
    //Construtor
    public Analise (Integer id, Filme filme, String analise, Double nota){
        this.id = id;
        this.filme = filme;
        this.analise = analise;
        this.nota = nota;
    }

    //Construtor sem o ID.
    public Analise (Filme filme, String analise, Double nota){
        this.filme = filme;
        this.analise = analise;
        this.nota = nota;
    }
    
    //Construtor vazio
    public Analise(){
        
    }
    
    //Get e Set
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Filme getFilme() {
        return filme;
    }

    public void setFilme(Filme filme) {
        this.filme = filme;
    }

    public String getAnalise() {
        return analise;
    }

    public void setAnalise(String analise) {
        this.analise = analise;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }
    
}
