package com.dag.productmanagementservice.dao;

import com.dag.productmanagementservice.models.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SessionRepository extends JpaRepository<Session, Long> {

    @Query("select s FROM Session s where s.token = :token and s.user.id = :userId")
    Optional<Session> findByTokenAndUserId(String token, Long userId);
}
