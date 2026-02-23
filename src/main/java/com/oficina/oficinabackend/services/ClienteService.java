package com.oficina.oficinabackend.services;

import com.oficina.oficinabackend.dto.ClienteCompleteDTO;
import com.oficina.oficinabackend.dto.ClienteMinDTO;
import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.projections.ClienteProjection;
import com.oficina.oficinabackend.repositories.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteService {

    @Autowired
    private ClienteRepository repository;

    @Transactional(readOnly = true)
    public Page<ClienteMinDTO> findAllClients(String nome, Pageable pageable) {
        Page<ClienteProjection> result = repository.findAllClients(nome, pageable);
        return result.map(ClienteMinDTO::new);
    }

    @Transactional
    public ClienteCompleteDTO insert(ClienteCompleteDTO dto) {
        Cliente entity = new Cliente();
        EntityToDto(dto, entity);
        entity = repository.save(entity);
        return new ClienteCompleteDTO(entity);
    }

    public void EntityToDto(ClienteCompleteDTO dto, Cliente entity) {
        entity.setId(dto.getId());
        entity.setNome(dto.getNome());
        entity.setCpf(dto.getCpf());
        entity.setEndereco(dto.getEndereco());
        entity.setTelefone(dto.getTelefone());
    }
}
