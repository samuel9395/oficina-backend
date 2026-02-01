package com.oficina.oficinabackend.entities;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "servico")
public class Servico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT", name = "tipo_servico")
    private String descricao;
    private Double valorServico;

    @ManyToMany(mappedBy = "servicos")
    private Set<OrdemServico> ordemServico = new HashSet<>();

    public Servico() {}

    public Servico(Long id, String descricao, Double valorServico, Set<OrdemServico> ordemServico) {
        this.id = id;
        this.descricao = descricao;
        this.valorServico = valorServico;
        this.ordemServico = ordemServico;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getValorServico() {
        return valorServico;
    }

    public void setValorServico(Double valorServico) {
        this.valorServico = valorServico;
    }

    public Set<OrdemServico> getOrdemServico() {
        return ordemServico;
    }

    public void setOrdemServico(Set<OrdemServico> ordemServico) {
        this.ordemServico = ordemServico;
    }
}
