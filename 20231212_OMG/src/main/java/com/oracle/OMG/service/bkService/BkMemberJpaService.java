package com.oracle.OMG.service.bkService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.OMG.repository.BkMemberJpaRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class BkMemberJpaService {
	
	private final BkMemberJpaRepository bMemberJpaR;
	
	

}
