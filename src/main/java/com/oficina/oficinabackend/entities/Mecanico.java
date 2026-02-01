package com.oficina.oficinabackend.entities;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "mecanico")
public class Mecanico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nome_mecanico")
    private String nome;
    @Column(name = "end_mecanico")
    private String endereco;
    private String especialidade;
    @Column(name = "tel_mecanico")
    private String telefone;

    @ManyToMany(mappedBy = "mecanicos")
    private Set<OrdemServico>  ordemServicos =  new HashSet<>();

    public Mecanico() {}

    public Mecanico(Long id, String nome, String endereco, String especialidade, String telefone, Set<OrdemServico> ordemServicos) {
        this.id = id;
        this.nome = nome;
        this.endereco = endereco;
        this.especialidade = especialidade;
        this.telefone = telefone;
        this.ordemServicos = ordemServicos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Set<OrdemServico> getOrdemServicos() {
        return ordemServicos;
    }

    public void setOrdemServicos(Set<OrdemServico> ordemServicos) {
        this.ordemServicos = ordemServicos;
    }
}
