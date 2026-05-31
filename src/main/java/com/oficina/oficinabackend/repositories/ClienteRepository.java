package com.oficina.oficinabackend.repositories;

import com.oficina.oficinabackend.entities.Cliente;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    @Query("SELECT obj FROM Cliente obj " +
            "WHERE UPPER(obj.nome) LIKE UPPER(CONCAT('%', :nome, '%')) ")
    Page<Cliente> findAll(String nome, Pageable pageable);
}

