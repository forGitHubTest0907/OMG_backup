package com.oracle.OMG.service.bkService;

import com.oracle.OMG.dto.Member;

public interface BkMemberService {

	Member login(Member member);

	Member checkNameAndTel(Member member);


}
