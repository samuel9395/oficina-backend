package com.oficina.oficinabackend.dto;

import com.oficina.oficinabackend.entities.Cliente;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.Length;

public class ClienteCompleteDTO {

    private Long id;

    @Size(min = 3, max = 150)
    @NotEmpty(message = "Campo requerido")
    private String nome;

    @Length(min = 11, max = 11, message = "Requerido 11 caracteres")
    @NotEmpty(message = "Campo requerido")
    private String cpf;

    private String endereco;
    private String telefone;

    public ClienteCompleteDTO() {
    }

    public ClienteCompleteDTO(Long id, String nome, String cpf, String endereco, String telefone) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public ClienteCompleteDTO(Cliente entity) {
        id = entity.getId();
        nome = entity.getNome();
        cpf = entity.getCpf();
        endereco = entity.getEndereco();
        telefone = entity.getTelefone();
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

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
