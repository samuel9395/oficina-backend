package com.oficina.oficinabackend.dto;

import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.projections.ClienteProjection;

public class ClienteDTO {

    private String nome;
    private String telefone;
    private String placa;
    private String modelo;
    private String marca;

    public ClienteDTO(String nome, String telefone, String placa, String modelo, String marca) {
        this.nome = nome;
        this.telefone = telefone;
        this.placa = placa;
        this.modelo = modelo;
        this.marca = marca;
    }

    public ClienteDTO(ClienteProjection clienteProjection) {
        nome = clienteProjection.getNome();
        telefone = clienteProjection.getTelefone();
        placa = clienteProjection.getPlaca();
        modelo = clienteProjection.getModelo();
        marca = clienteProjection.getMarca();
    }

    public String getNome() {
        return nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getPlaca() {
        return placa;
    }

    public String getModelo() {
        return modelo;
    }

    public String getMarca() {
        return marca;
    }
}
