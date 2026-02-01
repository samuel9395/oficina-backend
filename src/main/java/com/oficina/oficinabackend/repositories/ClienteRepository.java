package com.oficina.oficinabackend.repositories;

import com.oficina.oficinabackend.entities.Cliente;
import com.oficina.oficinabackend.projections.ClienteProjection;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    @Query(nativeQuery = true, value = """
            SELECT
                c.nome       AS nome,
                c.telefone   AS telefone,
                v.id         AS veiculoId,
                v.placa      AS placa,
                v.modelo     AS modelo,
                v.marca      AS marca
            FROM cliente c
            LEFT JOIN veiculo v ON c.id = v.cliente_id
            WHERE UPPER(c.nome) LIKE UPPER(CONCAT(:nome, '%'))
            ORDER BY c.nome
            """)
    Page<ClienteProjection> findAllClients(@Param("nome") String nome, Pageable pageable);
}

