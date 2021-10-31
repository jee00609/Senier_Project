package com.awsTest.s3Upload.service;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.sound.sampled.UnsupportedAudioFileException;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;

@Service
public class ETRIapiService {
	
	
	public static double etriApi(String audioName,String objString) {
//		SpringApplication.run(EtriApiTestApplication.class, args);
		String openApiURL = "http://aiopen.etri.re.kr:8000/WiseASR/Pronunciation"; // 영어
        //String openApiURL = "http://aiopen.etri.re.kr:8000/WiseASR/PronunciationKor";   //한국어  
        String accessKey = "ff3e7deb-1ccf-4ee3-bc0b-292c1ef5bfd5";    // 발급받은 API Key
        String languageCode = "english";     // 언어 코드
        String script = objString;    // 평가 대본
        Double responseScore = 0.0;
        
//        File resourcesDirectory = new File("src/main/resources/static/audio/2021-08-17T09_13_36.386Z.wav");
        
        String fileName = "src/main/webapp/audio/"+audioName;
        File resourcesDirectory2 = new File(fileName);
        
        if(!resourcesDirectory2.exists()) {
        	return 0.0;
        }
        
        System.out.println(fileName);
        
        
        String audioRaw = audioName.toString();
        if(audioRaw.length()==0) {
        	return 0.0;
        }
        
        
        audioRaw = audioRaw.substring(0,audioRaw.length()-4);
        
        WavToRaw wavToRaw = new WavToRaw();
        
        try {
        	wavToRaw.SaveRaw(audioRaw,resourcesDirectory2);
		} catch (UnsupportedAudioFileException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
        
        String fileName2 = "src/main/webapp/audio/"+audioRaw+".raw";
        System.out.println(fileName2);
        File resourcesDirectory = new File(fileName2);
        
        
        String audioFilePath = resourcesDirectory.getAbsolutePath();  // 녹음된 음성 파일 경로
        String audioContents = null;
 
        Gson gson = new Gson();
 
        Map<String, Object> request = new HashMap<>();
        Map<String, String> argument = new HashMap<>();
 
        try {
            Path path = Paths.get(audioFilePath);
            byte[] audioBytes = Files.readAllBytes(path);
            audioContents = Base64.getEncoder().encodeToString(audioBytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
 
        argument.put("language_code", languageCode);
        argument.put("script", script);
        argument.put("audio", audioContents);
 
        request.put("access_key", accessKey);
        request.put("argument", argument);
 
        URL url;
        Integer responseCode = null;
        String responBody = null;
        try {
            url = new URL(openApiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setDoOutput(true);
 
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(gson.toJson(request).getBytes("UTF-8"));
            wr.flush();
            wr.close();
 
            responseCode = con.getResponseCode();
            InputStream is = con.getInputStream();
            byte[] buffer = new byte[is.available()];
            int byteRead = is.read(buffer);
            responBody = new String(buffer);
 
            System.out.println("[responseCode] " + responseCode);
            System.out.println("[responBody]");
            System.out.println(responBody);
 
            String[] list = responBody.split("score\":");
			for (int i =0; i<list.length;i++) {
				System.out.println(list[i]);
			}
			
			String scoreString = list[1].substring(0, list[1].length()-2);
			System.out.println(scoreString);
			
			responseScore = Double.parseDouble(scoreString);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        if(resourcesDirectory.exists()){
        	try {
        		resourcesDirectory.delete();
        	}
        	catch (Exception e) {
        		System.out.println("raw 삭제 실패");
			}
        }
        
        
		return responseScore;
	}
	
	

}
