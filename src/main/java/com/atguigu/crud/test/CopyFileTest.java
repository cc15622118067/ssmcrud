package com.atguigu.crud.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

public class CopyFileTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(copyFile("G:\\copyTest1\\3 - 副本.txt", "G:\\copyTest2\\3.txt", true));
	}

	/**
	 * 部门：软件开发事业部 功能：复制文件操作 描述：略 作成者：王晓宇
	 */
	public static Map<String, Object> copyFile(String srcFileName,
			String destFileName, boolean overlay) {
		Map<String, Object> result = new HashMap<String, Object>();
		File srcFile = new File(srcFileName);

		// 判断源文件是否存在
		if (!srcFile.exists()) {
			result.put("trfa", false);
			result.put("msg", "找不到目标源文件");
			return result;
		} else if (!srcFile.isFile()) {
			result.put("trfa", false);
			result.put("msg", "目标源文件不是一个文件");
			return result;
		}

		// 判断目标文件是否存在
		File destFile = new File(destFileName);
		if (destFile.exists()) {
			// 如果目标文件存在并允许覆盖
			if (overlay) {
				// 删除已经存在的目标文件，无论目标文件是目录还是单个文件
				new File(destFileName).delete();
			}
		} else {
			// 如果目标文件所在目录不存在，则创建目录
			if (!destFile.getParentFile().exists()) {
				// 目标文件所在目录不存在
				if (!destFile.getParentFile().mkdirs()) {
					// 复制文件失败：创建目标文件所在目录失败
					result.put("trfa", false);
					result.put("msg", "创建目标文件所在目录失败");
					return result;
				}
			}
		}

		// 复制文件
		int byteread = 0; // 读取的字节数
		InputStream in = null;
		OutputStream out = null;

		try {
			in = new FileInputStream(srcFile);
			out = new FileOutputStream(destFile);
			byte[] buffer = new byte[1024];

			while ((byteread = in.read(buffer)) != -1) {
				out.write(buffer, 0, byteread);
			}
			result.put("trfa", true);
			result.put("msg", "复制文件成功");
			return result;
		} catch (FileNotFoundException e) {
			result.put("trfa", false);
			result.put("msg", "复制文件失败");
			return result;
		} catch (IOException e) {
			result.put("trfa", false);
			result.put("msg", "复制文件失败");
			return result;
		} finally {
			try {
				if(out != null) {
					out.close();
				}
				if(in != null) {
					in.close();
				}
				if(srcFile.exists()){
					//srcFile.delete();
					System.out.println(txt2String(destFile).substring(2900000,2910000));
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	 public static String txt2String(File file){
	        StringBuilder result = new StringBuilder();
	        try{
	            BufferedReader br = new BufferedReader(new FileReader(file));//构造一个BufferedReader类来读取文件
	            String s = null;
	            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
	                result.append(System.lineSeparator()+s);
	            }
	            br.close();    
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return result.toString();
	    }

	
}
