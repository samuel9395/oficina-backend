package com.oficina.oficinabackend.services;

import com.oficina.oficinabackend.dto.ClienteDTO;
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
    public Page<ClienteDTO> findAllClients(String nome, Pageable pageable) {
        Page<ClienteProjection> result = repository.findAllClients(nome, pageable);
        return result.map(ClienteDTO::new);
    }
}
