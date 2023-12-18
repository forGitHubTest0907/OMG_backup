package com.oracle.OMG.dao.bkDao;

import com.oracle.OMG.dto.Item;
import com.oracle.OMG.dto.Member;

public interface BkMemberDao {

	Member login(Member member);

	Member checkNameAndTel(Member member);
}
