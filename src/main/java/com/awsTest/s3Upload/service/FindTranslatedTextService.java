package com.awsTest.s3Upload.service;

import java.util.Iterator;

import org.apache.tomcat.util.json.JSONParser;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class FindTranslatedTextService {
	
	//이 아래 Json String 에서 translatedText 를 뽑아와야 한다.
	//{"message":{"@type":"response","@service":"naverservice.nmt.proxy","@version":"1.0.0","result":{"srcLangType":"en","tarLangType":"ko","translatedText":"자연","engineType":"N2MT","pivot":null}}}
	
	public String findTranslatedText(String papagoText) {
	
		String translatedText = null;
		
		//parseString Error
		//Gson 의 Version 2.8.5 -> 2.8.6 으로 해결
		//https://stackoverflow.com/questions/63611414/the-method-parsestringstring-is-undefined-for-the-type-jsonparser
		
		try {
			//JsonParser는 더 이상 사용되지 않습니다.
			//https://stackoverflow.com/questions/60771386/jsonparser-is-deprecated
			
			////jsonString is of type java.lang.String
	        JsonObject jsonObject = JsonParser.parseString(papagoText).getAsJsonObject();
	        
	        // Shows deprecated warning for new JsonParser() and parse(jsonString)
	        //JsonObject jsonObject = new JsonParser().parse(papagoText).getAsJsonObject();
	        
	        System.out.println("jsonObj = "+jsonObject.toString());
	        
	        JsonObject objMessage = jsonObject.get("message").getAsJsonObject(); 
//	        System.out.println("message = "+objMessage); 
	        
	        JsonObject objResult= objMessage.get("result").getAsJsonObject();  
//	        System.out.println("result = "+objResult); 
	        
	        translatedText = objResult.get("translatedText").getAsString(); 
//	        System.out.println("translated = "+translatedText);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			translatedText = null;
		}
		
		
		
		return translatedText;
		
	}

}
