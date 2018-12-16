package service;

import entity.DatatablesViewPage;
import entity.News;
import entity.Notice;

public interface NoticeService {
	public void insertNotice(Notice notice);
	//DataTables 
	public DatatablesViewPage<Notice> GetlistPage(int start,int length);
	//根据id获取新闻详情
	public Notice getNoticeDetailByid(String notice_id);
	//修改新闻
	public void updateNotice(Notice notice);
	//删除新闻
	public void deleteNotice(String notice_id);
}
