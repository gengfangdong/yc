package service;



import entity.FileTab;
import entity.LayuiDataTable;

public interface FileTabService {
	public FileTab insertFile(FileTab fileTab);
	public void deleteFile(String fileid);
	public LayuiDataTable<FileTab> getlistByPage(int start,int limit,String filename,String fileflag);
	public FileTab getBynew(String filenew);
	public FileTab getbyid(String fileid);
	public void updateFile(FileTab fileTab);
}
