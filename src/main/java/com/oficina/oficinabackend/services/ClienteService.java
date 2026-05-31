package com.oficina.oficinabackend.services;

import com.oficina.oficinabackend.dto.ClienteCompleteDTO;
import com.oficina.oficinabackend.dto.ClienteMinDTO;
import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.repositories.ClienteRepository;
import com.oficina.oficinabackend.services.exceptions.DatabaseException;
import com.oficina.oficinabackend.services.exceptions.ResourceNotFound;
import jakarta.persistence.EntityNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteService {

    private static final Logger log = LoggerFactory.getLogger(ClienteService.class);

    @Autowired
    private ClienteRepository repository;

    @Transactional(readOnly = true)
    public Page<ClienteCompleteDTO> findAll(String nome, Pageable pageable) {
        Page<Cliente> result = repository.findAll(nome, pageable);
        return result.map(ClienteCompleteDTO::new);
    }

    @Transactional
    public ClienteMinDTO insert(ClienteMinDTO dto) {
        Cliente entity = new Cliente();
        EntityToDto(dto, entity);
        entity = repository.save(entity);
        return new ClienteMinDTO(entity);
    }

    @Transactional
    public ClienteMinDTO update(Long id, ClienteMinDTO dto) {
        try {
            Cliente entity = repository.getReferenceById(id);
            EntityToDto(dto, entity);
            return new ClienteMinDTO(entity);
        } catch (EntityNotFoundException e) {
            throw new ResourceNotFound("Cliente não encontrado");
        }
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public void delete(Long id) throws DatabaseException {
        if (!repository.existsById(id)) {
            throw new ResourceNotFound("Entity not found with id: " + id);
        }
        try {
            repository.deleteById(id);
            log.info("Delete Product with id: " + id);
        } catch (DataIntegrityViolationException e) {
            throw new DatabaseException("Referential integrity failure!");
        }
    }

    public void EntityToDto(ClienteMinDTO dto, Cliente entity) {
        entity.setNome(dto.getNome());
        entity.setTelefone(dto.getTelefone());
        entity.setEmail(dto.getEmail());
        entity.setCpf(dto.getCpf());
        entity.setEndereco(dto.getEndereco());
    }
}
