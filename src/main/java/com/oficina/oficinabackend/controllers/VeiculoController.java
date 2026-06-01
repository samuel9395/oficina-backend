package com.oficina.oficinabackend.controllers;

import com.oficina.oficinabackend.dto.ClienteMinDTO;
import com.oficina.oficinabackend.dto.VeiculoDTO;
import com.oficina.oficinabackend.dto.VeiculoMinDTO;
import com.oficina.oficinabackend.services.VeiculoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping(value = "/api/veiculos")
public class VeiculoController {

    @Autowired
    private VeiculoService service;

    @GetMapping
    public ResponseEntity<Page<VeiculoMinDTO>> findAll(Pageable pageable) {
        Page<VeiculoMinDTO> dto = service.findAll(pageable);
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/placa")
    public ResponseEntity<Page<VeiculoDTO>> findByPlaca(@RequestParam String placa, Pageable pageable) {
        Page<VeiculoDTO> dto = service.findByPlaca(placa, pageable);
        return ResponseEntity.ok(dto);
    }

    @PostMapping
    public ResponseEntity<VeiculoDTO> insert(@Valid @RequestBody VeiculoDTO dto) {
        dto = service.insert(dto);
        URI uri =  ServletUriComponentsBuilder
                .fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
}
