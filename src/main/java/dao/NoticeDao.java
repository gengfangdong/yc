package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.News;
import entity.Notice;

@Repository
public interface NoticeDao {
	public void insertNotice(Notice notice);
	public int getNoticeCount();
	public List<Notice> getNoticeAllBypage(@Param("start")int start,@Param("length")int length);
	public Notice getNoticeDetailByid(@Param("notice_id")String notice_id);
	public void updateNotice(Notice notice);
	public void deleteNotice(@Param("notice_id")String notice_id);
}
