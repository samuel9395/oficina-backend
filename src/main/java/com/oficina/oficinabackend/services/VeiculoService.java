package com.oficina.oficinabackend.services;

import com.oficina.oficinabackend.dto.VeiculoDTO;
import com.oficina.oficinabackend.entities.Veiculo;
import com.oficina.oficinabackend.repositories.VeiculoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class VeiculoService {

    @Autowired
    private VeiculoRepository repository;

    @Transactional(readOnly = true)
    public List<VeiculoDTO> findAll() {
        List<Veiculo> list = repository.findAll();
        List<VeiculoDTO> dto = list.stream().map(x -> new VeiculoDTO(x)).toList();
        return dto;
    }

    @Transactional(readOnly = true)
    public List<VeiculoDTO> findByPlaca(String placa) {
        List<Veiculo> list = repository.findByPlaca(placa);
        return list.stream().map(VeiculoDTO::new).toList();
    }
}
