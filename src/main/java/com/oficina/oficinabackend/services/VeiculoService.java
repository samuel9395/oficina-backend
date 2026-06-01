package com.oficina.oficinabackend.services;

import com.oficina.oficinabackend.dto.VeiculoDTO;
import com.oficina.oficinabackend.dto.VeiculoMinDTO;
import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.entities.Veiculo;
import com.oficina.oficinabackend.repositories.ClienteRepository;
import com.oficina.oficinabackend.repositories.VeiculoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VeiculoService {

    @Autowired
    private VeiculoRepository repository;

    @Autowired
    private ClienteRepository clienteRepository;

    @Transactional(readOnly = true)
    public Page<VeiculoMinDTO> findAll(Pageable pageable) {
        Page<Veiculo> result = repository.findAll(pageable);
        return result.map(VeiculoMinDTO::new);
    }

    @Transactional(readOnly = true)
    public Page<VeiculoDTO> findByPlaca(String placa, Pageable pageable) {
        Page<Veiculo> result = repository.findByPlaca(placa, pageable);
        return result.map(VeiculoDTO::new);
    }

    @Transactional
    public VeiculoDTO insert(VeiculoDTO dto) {
        Veiculo entity = new Veiculo();
        EntityToDto(dto, entity);
        entity = repository.save(entity);
        return new VeiculoDTO(entity);
    }

    private void EntityToDto(VeiculoDTO dto, Veiculo entity) {
        entity.setMarca(dto.getMarca());
        entity.setModelo(dto.getModelo());
        entity.setCor(dto.getCor());
        entity.setPlaca(dto.getPlaca());
        entity.setAnoFabricacao(dto.getAnoFabricacao());
        entity.setKilometragem(dto.getKilometragem());

        Cliente cliente = clienteRepository.getReferenceById(dto.getClienteId());
        entity.setCliente(cliente);
    }

}
