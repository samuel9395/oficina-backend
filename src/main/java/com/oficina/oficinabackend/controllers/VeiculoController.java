package com.oficina.oficinabackend.controllers;

import com.oficina.oficinabackend.dto.VeiculoDTO;
import com.oficina.oficinabackend.services.VeiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/veiculos")
public class VeiculoController {

    @Autowired
    private VeiculoService service;

    @GetMapping
    public ResponseEntity<List<VeiculoDTO>> findAll() {
        List<VeiculoDTO> dto = service.findAll();
        return ResponseEntity.ok(dto);
    }

    @GetMapping(value = "/placa")
    public ResponseEntity<List<VeiculoDTO>> findByPlaca(@RequestParam String placa) {
        List<VeiculoDTO> dto = service.findByPlaca(placa);
        return ResponseEntity.ok(dto);
    }
}
