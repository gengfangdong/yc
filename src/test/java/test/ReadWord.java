package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;

public class ReadWord {
	public static void main(String[] args) {
		File file = new File("D:\\1.doc");
		 HWPFDocument doc=null;
		try {
			doc = new HWPFDocument(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	        //通过 Doc对象直接获取Text
	    StringBuilder sb = doc.getText();
	    //System.out.println(sb.toString());
		Range range = doc.getRange();
		//System.out.println(range.text());
		// 遍历range范围内的table。
		TableIterator tableIter = new TableIterator(range);
		while (tableIter.hasNext()) {
			Table table = tableIter.next();
			// 开始位置
			int start = table.getStartOffset();
			// 结束位置
			int end = table.getEndOffset();
			System.out.printf("开始位置%d,结束为止%d\r\n", start, end);

			// 获取行的数目
			int rowNum = table.numRows();
			for (int j = 0; j < rowNum; j++) {
				// 获取每一行
				TableRow row = table.getRow(j);
				int cellNum = row.numCells();
				for (int k = 0; k < cellNum; k++) {
					// 获取每一列
					TableCell cell = row.getCell(k);
					// 输出单元格的文本
					System.out.println(cell.text().trim());
				}
			}
		}
		
	}
}
