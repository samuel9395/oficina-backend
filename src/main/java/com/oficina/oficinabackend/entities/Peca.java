package com.oficina.oficinabackend.entities;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "peca")
public class Peca {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codPeca;
    private String nomePeca;
    private Double valorPeca;

    @ManyToMany(mappedBy = "pecas")
    private Set<OrdemServico>  ordemServicos =  new HashSet<>();

    public Peca() {}

    public Peca(Long codPeca, String nomePeca, Double valorPeca, Set<OrdemServico> ordemServicos) {
        this.codPeca = codPeca;
        this.nomePeca = nomePeca;
        this.valorPeca = valorPeca;
        this.ordemServicos = ordemServicos;
    }

    public Long getCodPeca() {
        return codPeca;
    }

    public void setCodPeca(Long codPeca) {
        this.codPeca = codPeca;
    }

    public String getNomePeca() {
        return nomePeca;
    }

    public void setNomePeca(String nomePeca) {
        this.nomePeca = nomePeca;
    }

    public Double getValorPeca() {
        return valorPeca;
    }

    public void setValorPeca(Double valorPeca) {
        this.valorPeca = valorPeca;
    }

    public Set<OrdemServico> getOrdemServicos() {
        return ordemServicos;
    }

    public void setOrdemServicos(Set<OrdemServico> ordemServicos) {
        this.ordemServicos = ordemServicos;
    }
}
