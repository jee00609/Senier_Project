package com.awsTest.s3Upload.service;

import java.io.File;

import org.springframework.stereotype.Service;

@Service
public class deleteFileService {
	
	public void deleteFiles(){
		File path = new File("src/main/webapp/audio/");
        
        if(path.exists()){
        	try {

                File[] fileList = path.listFiles();

                for(int i=0; i<fileList .length; i++){

                    System.out.println(i + "번째파일 : "+fileList[i]);
                    
                	if(fileList[i].delete()) {
                		System.out.println("삭제성공");
                	}
                	else {
                		System.out.println("삭제실패");
                	}

                }
        	}
        	catch (Exception e) {
        		System.out.println("wav 삭제 실패");
			}
        }
	}

}
