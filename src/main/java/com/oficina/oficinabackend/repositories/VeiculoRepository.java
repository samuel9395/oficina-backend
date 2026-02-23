package com.oficina.oficinabackend.repositories;

import com.oficina.oficinabackend.dto.VeiculoDTO;
import com.oficina.oficinabackend.entities.Veiculo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VeiculoRepository extends JpaRepository<Veiculo, Long> {


    @Query(nativeQuery = true, value = """
            SELECT * FROM VEICULO WHERE PLACA = :placa;
            """)
    List<Veiculo> findByPlaca(@Param("placa") String placa);
}
