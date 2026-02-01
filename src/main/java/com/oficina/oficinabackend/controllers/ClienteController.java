package com.oficina.oficinabackend.controllers;

import com.oficina.oficinabackend.dto.ClienteDTO;
import com.oficina.oficinabackend.services.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api/clientes")
public class ClienteController {

    @Autowired
    private ClienteService service;

    @GetMapping
    public ResponseEntity<Page<ClienteDTO>> findAllClients(@RequestParam(name = "nome", defaultValue = "")String nome, Pageable pageable) {
        Page<ClienteDTO> dto = service.findAllClients(nome, pageable);
        return ResponseEntity.ok(dto);
    }
}
