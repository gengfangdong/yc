package service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.FileTabDao;
import entity.FileTab;
import entity.LayuiDataTable;
import service.FileTabService;
@Service
@Transactional
public class FileTabServiceImpl implements FileTabService {
	
	@Autowired
	private FileTabDao fileTabDao;
	@Override
	public FileTab insertFile(FileTab fileTab) {
		// TODO Auto-generated method stub
		if(fileTabDao!=null)
			fileTabDao.insertFile(fileTab);
		return fileTab;
	}

	@Override
	public void deleteFile(String fileid) {
		// TODO Auto-generated method stub
		fileTabDao.deleteFile(fileid);
	}

	@Override
	public LayuiDataTable<FileTab> getlistByPage(int start, int limit, String filename, String fileflag) {
		// TODO Auto-generated method stub
		int count = 0;
		LayuiDataTable<FileTab> fDataTable = new LayuiDataTable<>();
		List<FileTab> fileTabs = new ArrayList<>();
		fileTabs = fileTabDao.getlistByPage((start-1)*limit, start*limit, filename, fileflag);
		if(fileTabs!=null&&fileTabs.size()>0){
			fDataTable.setData(fileTabs);
			count = fileTabDao.getcount(filename, fileflag);
			//fDataTable.setCount(count);
		}
		fDataTable.setCount(count);
		return fDataTable;
	}

	@Override
	public FileTab getBynew(String filenew) {
		// TODO Auto-generated method stub
		List<FileTab> fileTabs = new ArrayList<>();
		fileTabs = fileTabDao.getBynew(filenew);
		if(fileTabs!=null&&fileTabs.size()>0){
			return fileTabs.get(0);
		}
		return null;
	}

	@Override
	public FileTab getbyid(String fileid) {
		// TODO Auto-generated method stub
		List<FileTab> fileTabs = new ArrayList<>();
		fileTabs = fileTabDao.getbyid(fileid);
		if(fileTabs!=null&&fileTabs.size()>0){
			return fileTabs.get(0);
		}
		return null;
	}

	@Override
	public void updateFile(FileTab fileTab) {
		// TODO Auto-generated method stub
		fileTabDao.updateFile(fileTab);
	}

	

}
