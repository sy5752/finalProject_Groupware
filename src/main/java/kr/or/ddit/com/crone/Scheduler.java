package kr.or.ddit.com.crone;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled; 
import org.springframework.stereotype.Component;

import kr.or.ddit.groupware.service.VacationServiceI;

@Component
public class Scheduler {
	/** * 1. 오후 05:50:00에 호출이 되는 스케쥴러 */
	
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);

	@Resource(name="vacationService")
	private VacationServiceI vacService;
	
	// 사원의 연차정보를 매시 새벽 00:01:01에 업데이트함.
	@Scheduled(cron = "01 01 01 * * *")
	public void cronTest1() {
		int updateVacCnt = vacService.updateVac();
		logger.debug("updateVacCnt : {}", updateVacCnt);
		System.out.println("연차 업데이트 ㅋㅋ; ");
	}
	

}
