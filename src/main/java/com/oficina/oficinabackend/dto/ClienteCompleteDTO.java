package com.oficina.oficinabackend.dto;

import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.entities.Veiculo;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.List;

public class ClienteCompleteDTO {

    private Long id;

    @Size(min = 3, max = 150)
    @NotEmpty(message = "Campo requerido")
    private String nome;

    @Length(min = 11, max = 11, message = "Requerido 11 caracteres")
    @NotEmpty(message = "Campo requerido")
    private String cpf;

    private String email;
    private String endereco;
    private String telefone;


    private List<VeiculoDTO> veiculos = new ArrayList<>();

    public ClienteCompleteDTO() {
    }

    public ClienteCompleteDTO(Long id, String nome, String cpf, String endereco, String telefone,  String email) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.email = email;
    }

    public ClienteCompleteDTO(Cliente entity) {
        id = entity.getId();
        nome = entity.getNome();
        cpf = entity.getCpf();
        email = entity.getEmail();
        endereco = entity.getEndereco();
        telefone = entity.getTelefone();

        for (Veiculo veiculo : entity.getVeiculos()) {
            veiculos.add(new VeiculoDTO(veiculo));
        }
    }

    public Long getId() {
        return id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<VeiculoDTO> getVeiculo() {
        return veiculos;
    }
}
