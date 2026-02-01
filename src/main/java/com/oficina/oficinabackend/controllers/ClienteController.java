package com.oficina.oficinabackend.controllers;

import com.oficina.oficinabackend.dto.ClienteCompleteDTO;
import com.oficina.oficinabackend.dto.ClienteDTO;
import com.oficina.oficinabackend.services.ClienteService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/api/clientes")
public class ClienteController {

    @Autowired
    private ClienteService service;

    @GetMapping
    public ResponseEntity<Page<ClienteDTO>> findAllClients(
            @RequestParam(name = "nome", defaultValue = "")String nome, Pageable pageable) {
        Page<ClienteDTO> dto = service.findAllClients(nome, pageable);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    public ResponseEntity<ClienteCompleteDTO> insert(@Valid @RequestBody ClienteCompleteDTO dto) {
        dto = service.insert(dto);
        URI uri =  ServletUriComponentsBuilder.
                fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
}
