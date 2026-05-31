package com.oficina.oficinabackend.dto;

import com.oficina.oficinabackend.entities.Cliente;

public class ClienteMinDTO {

    private Long id;
    private String nome;
    private String telefone;
    private String email;
    private String cpf;
    private String endereco;

    public ClienteMinDTO() {
    }

    public ClienteMinDTO(Long id, String nome, String telefone, String email, String cpf, String endereco) {
        this.id = id;
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
        this.cpf = cpf;
        this.endereco = endereco;
    }

    public ClienteMinDTO(Cliente entity) {
        id = entity.getId();
        nome = entity.getNome();
        telefone = entity.getTelefone();
        email = entity.getEmail();
        cpf = entity.getCpf();
        endereco = entity.getEndereco();
    }

    public Long getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public String getEmail() {
        return email;
    }

    public String getCpf() {
        return cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
}
