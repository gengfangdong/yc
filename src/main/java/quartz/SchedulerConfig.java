package quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import service.ConstomService;
import service.FigClassService;
import service.ScheduledshiftService;


public class SchedulerConfig {
	@Autowired
	private ScheduledshiftService scheduledshiftService;
	@Autowired
	private ConstomService constomService;
	@Autowired
	private FigClassService figClassService;
	private static Logger logger = Logger.getLogger(SchedulerConfig.class);
	public void execute() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd hh:dd:ss");
		System.out.println("开始扫描状态!");
		logger.info(simpleDateFormat.format(new Date()).toString()+"开始扫描状态!");
        long start = System.currentTimeMillis();
        scheduledshiftService.startScheduled();
        constomService.startScheduledco();
        figClassService.startScheduledFig();
        long end = System.currentTimeMillis();
        
        System.out.println(end-start+"ms,状态转换成功!");
        logger.info(end-start+"ms,状态转换成功!");
    }
}

