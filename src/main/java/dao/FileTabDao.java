package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import entity.FileTab;

@Repository
public interface FileTabDao {
	public void insertFile(FileTab fileTab);
	public void updateFile(FileTab fileTab);
	public void deleteFile(@Param("fileid")String fileid);
	public List<FileTab> getlistByPage(@Param("start")int start,@Param("limit")int limit,@Param("filename")String filename,@Param("fileflag")String fileflag);
	public int getcount(@Param("filename")String filename,@Param("fileflag")String fileflag);
	public List<FileTab> getBynew(@Param("filenew")String filenew);
	public List<FileTab> getbyid(@Param("fileid")String fileid);
}
