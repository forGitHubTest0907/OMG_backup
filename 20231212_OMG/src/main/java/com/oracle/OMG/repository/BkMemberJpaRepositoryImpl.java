package com.oracle.OMG.repository;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BkMemberJpaRepositoryImpl implements BkMemberJpaRepository {
	
	private final EntityManager em;
	
	

}
