package com.oficina.oficinabackend.repositories;

import com.oficina.oficinabackend.entities.Veiculo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VeiculoRepository extends JpaRepository<Veiculo, Long> {


    @Query(nativeQuery = true, value = """
            SELECT * FROM VEICULO WHERE PLACA = :placa;
            """)
    Page<Veiculo> findByPlaca(@Param("placa") String placa, Pageable pageable);
}
