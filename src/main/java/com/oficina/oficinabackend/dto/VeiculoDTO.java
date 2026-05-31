package com.oficina.oficinabackend.dto;

import com.oficina.oficinabackend.entities.Veiculo;

import java.time.LocalDate;

public class VeiculoDTO {

    private Long id;
    private String marca;
    private String modelo;
    private String cor;
    private String placa;
    private LocalDate anoFabricacao;
    private String kilometragem;
    private Long clienteId;
    private String clienteName;

    public VeiculoDTO() {}

    public VeiculoDTO(Long id, String marca, String modelo, String cor, String placa, LocalDate anoFabricacao, String kilometragem, String clienteName, Long clienteId) {
        this.id = id;
        this.marca = marca;
        this.modelo = modelo;
        this.cor = cor;
        this.placa = placa;
        this.anoFabricacao = anoFabricacao;
        this.kilometragem = kilometragem;
        this.clienteId = clienteId;
        this.clienteName = clienteName;
    }

    public VeiculoDTO(Veiculo entity) {
        id = entity.getId();
        marca = entity.getMarca();
        modelo = entity.getModelo();
        cor = entity.getCor();
        placa = entity.getPlaca();
        anoFabricacao = entity.getAnoFabricacao();
        kilometragem = entity.getKilometragem();
        clienteName = entity.getCliente().getNome();

        if (entity.getCliente() != null) {
            clienteId = entity.getCliente().getId();
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public LocalDate getAnoFabricacao() {
        return anoFabricacao;
    }

    public void setAnoFabricacao(LocalDate anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }

    public String getKilometragem() {
        return kilometragem;
    }

    public void setKilometragem(String kilometragem) {
        this.kilometragem = kilometragem;
    }

    public Long getClienteId() {
        return clienteId;
    }

    public void setClienteId(Long clienteId) {
        this.clienteId = clienteId;
    }

    public String getClienteName() {
        return clienteName;
    }

    public void setClienteName(String clienteName) {
        this.clienteName = clienteName;
    }
}
