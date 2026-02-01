package com.oficina.oficinabackend.entities;

import com.oficina.oficinabackend.entities.enums.StatusAutorizacao;
import com.oficina.oficinabackend.entities.enums.StatusExecucao;
import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "ordem_servico")
public class OrdemServico {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long numeroOs;
    private LocalDate dataEmissao;
    private LocalDate dataConclusao;

    @Enumerated(EnumType.STRING)
    @Column(name = "status_autorizacao")
    private StatusAutorizacao statusAutorizacao;

    @Enumerated(EnumType.STRING)
    @Column(name = "status_execucao")
    private StatusExecucao statusExecucao;

    private double valorTotal;

    @ManyToOne
    @JoinColumn(name = "veiculo_id")
    private List<Veiculo> veiculo = new ArrayList<>();

    @ManyToMany
    @JoinTable(name = "equipe_mecanica",
            joinColumns = @JoinColumn(name = "numero_os"),
            inverseJoinColumns = @JoinColumn(name = "mecanico_id"))
    private Set<Mecanico> mecanicos = new HashSet<>();

    @ManyToMany
    @JoinTable(name = "os_has_peca",
            joinColumns = @JoinColumn(name = "numero_os"),
            inverseJoinColumns = @JoinColumn(name = "cod_peca"))
    private Set<Peca> pecas = new HashSet<>();

    @ManyToMany
    @JoinTable(name = "os_has_servico",
            joinColumns = @JoinColumn(name = "numero_os"),
            inverseJoinColumns = @JoinColumn(name = "servico_id"))
    private Set<Servico> servicos = new HashSet<>();

    public OrdemServico() {
    }

    public OrdemServico(Long numeroOs, LocalDate dataEmissao, LocalDate dataConclusao, StatusAutorizacao statusAutorizacao,
                        StatusExecucao statusExecucao, double valorTotal, List<Veiculo> veiculo, Set<Mecanico> mecanicos) {
        this.numeroOs = numeroOs;
        this.dataEmissao = dataEmissao;
        this.dataConclusao = dataConclusao;
        this.statusAutorizacao = statusAutorizacao;
        this.statusExecucao = statusExecucao;
        this.valorTotal = valorTotal;
        this.veiculo = veiculo;
        this.mecanicos = mecanicos;
    }

    public Long getNumeroOs() {
        return numeroOs;
    }

    public void setNumeroOs(Long numeroOs) {
        this.numeroOs = numeroOs;
    }

    public LocalDate getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(LocalDate dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public LocalDate getDataConclusao() {
        return dataConclusao;
    }

    public void setDataConclusao(LocalDate dataConclusao) {
        this.dataConclusao = dataConclusao;
    }

    public StatusAutorizacao getStatusAutorizacao() {
        return statusAutorizacao;
    }

    public void setStatusAutorizacao(StatusAutorizacao statusAutorizacao) {
        this.statusAutorizacao = statusAutorizacao;
    }

    public StatusExecucao getStatusExecucao() {
        return statusExecucao;
    }

    public void setStatusExecucao(StatusExecucao statusExecucao) {
        this.statusExecucao = statusExecucao;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public List<Veiculo> getVeiculos() {
        return veiculo;
    }

    public void setVeiculos(List<Veiculo> veiculos) {
        this.veiculo = veiculos;
    }

    public Set<Mecanico> getMecanicos() {
        return mecanicos;
    }

    public void setMecanicos(Set<Mecanico> mecanicos) {
        this.mecanicos = mecanicos;
    }

    public Set<Peca> getPecas() {
        return pecas;
    }

    public void setPecas(Set<Peca> pecas) {
        this.pecas = pecas;
    }
}