package com.awsTest.s3Upload.controller;



import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.services.rekognition.model.Label;
import com.awsTest.s3Upload.exception.InvalidFileFormatException;
import com.awsTest.s3Upload.exception.InvalidFileSizeException;
import com.awsTest.s3Upload.service.ETRIapiService;
import com.awsTest.s3Upload.service.EngToKorService;
import com.awsTest.s3Upload.service.FindTranslatedTextService;
import com.awsTest.s3Upload.service.RekognitionService;
import com.awsTest.s3Upload.service.UploadService;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class s3UploadController {

    @Autowired
    private UploadService uploadService;
    @Autowired
    private RekognitionService rekognitionService = new RekognitionService();
    @Autowired
    private ETRIapiService etriapiService = new ETRIapiService();
    @Autowired
    private EngToKorService engToKorServie = new EngToKorService();
    @Autowired
    private FindTranslatedTextService findTranslatedTextService = new FindTranslatedTextService();
    

    @PostMapping("/upload")
    @ResponseBody
    public Map<String, String> upload(@RequestParam("file") MultipartFile file) {

        Map<String, String> response = new HashMap<>();


        boolean isOperationSuccess = false;
        String message = "";
        String imageUrl = "";

        try{
            imageUrl = uploadService.uploadImage(file);
            message = "Image successfully uploaded.";
            isOperationSuccess = true;
            
            
        }catch (IOException e){
            message = "Something wrong with the uploaded file.";
            e.printStackTrace();
        }catch (InvalidFileFormatException e){
            message = "Uploaded file is not an image file.";
            e.printStackTrace();
        }catch (InvalidFileSizeException e){
            message = "Maximum supported image file size is 10MB";
            e.printStackTrace();
        }catch (AmazonServiceException e){
            message = "Something wrong with Amazon S3.";
            e.printStackTrace();
        }catch (SdkClientException e){
            message = "Cannot connect with Amazon S3.";
            e.printStackTrace();
        }
        
        

        response.put("success", String.valueOf(isOperationSuccess));
        response.put("message", message);
        response.put("url", imageUrl);
        
        //성공
        try {
			List <Label> rekognitionLabels = rekognitionService.rekognitionImage(imageUrl);
			int i =0;
			for (Label label: rekognitionLabels) {	
			
        		response.put("object"+i,label.getName());
        		i++;
  	       }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        return response;
    }
    
    
//    @PostMapping("/upload2")
//    @ResponseBody
//    public Map<String, String> upload2(@RequestParam("file") MultipartFile file) {
//
//        Map<String, String> response = new HashMap<>();
//
//        boolean isOperationSuccess = false;
//        String message = null;
//        String audioUrl = null;
//
//        try{
//        	audioUrl = uploadService.uploadAudio(file);
//            message = "Audio successfully uploaded.";
//            isOperationSuccess = true;
//        }catch (IOException e){
//            message = "Something wrong with the uploaded file.";
//            e.printStackTrace();
//        }catch (InvalidFileFormatException e){
//            message = "Uploaded file is not an Audio file.";
//            e.printStackTrace();
//        }catch (InvalidFileSizeException e){
//            message = "Maximum supported Audio file size is 10MB";
//            e.printStackTrace();
//        }catch (AmazonServiceException e){
//            message = "Something wrong with Amazon S3.";
//            e.printStackTrace();
//        }catch (SdkClientException e){
//            message = "Cannot connect with Amazon S3.";
//            e.printStackTrace();
//        }
//
//
//        response.put("success", String.valueOf(isOperationSuccess));
//        response.put("message", message);
//        response.put("url", audioUrl);
//
//        return response;
//    }
    
    @PostMapping("/upload2")
    @ResponseBody
    public Map<String, String> upload2(HttpServletRequest request,@RequestParam("file") MultipartFile file) {

        Map<String, String> response = new HashMap<>();

        boolean isOperationSuccess = false;
        String message = null;
        String audioUrl = null;

        try{
        	audioUrl = uploadService.uploadAudioAsset(request,file);
            message = "Audio successfully uploaded.";
            isOperationSuccess = true;
        }catch (IOException e){
            message = "Something wrong with the uploaded file.";
            e.printStackTrace();
        }catch (InvalidFileFormatException e){
            message = "Uploaded file is not an Audio file.";
            e.printStackTrace();
        }catch (InvalidFileSizeException e){
            message = "Maximum supported Audio file size is 10MB";
            e.printStackTrace();
        }catch (AmazonServiceException e){
            message = "Something wrong with Amazon S3.";
            e.printStackTrace();
        }catch (SdkClientException e){
            message = "Cannot connect with Amazon S3.";
            e.printStackTrace();
        }


        response.put("success", String.valueOf(isOperationSuccess));
        response.put("message", message);
//        response.put("url", audioUrl);
        response.put("audioName", audioUrl);

        return response;
    }
    
    
    
//    @PostMapping(value = "/printScore")
//    public void printScore(Model model, HttpServletResponse response) throws Exception {
//    	Double score = etriapiService.etriApi(); // 점수 받아오기 성공
//
//    	
//    	model.addAttribute("score", score);
//    	
//    	response.sendRedirect("/");
//    }
    
//    @PostMapping("/printScore")
//    @ResponseBody
//    public Map<String, Object> ajax(Model model) {
//
//    	Double score = etriapiService.etriApi();
//    	Map<String, Object> map = new HashMap<String, Object>();
//
//    	System.out.println("socre is "+score);
//    	map.put("score", score);
//
//    	return map;
//    }
    
//    @PostMapping("/printScore")
//    @ResponseBody
//    public String ajax(Model model) {
//
//    	Double score = etriapiService.etriApi();
//
//    	String scoreStr = score.toString();
//
//    	return scoreStr;
//    }
    

// 	@GetMapping("/test")
// 	public String library_introduce() {
// 		return "test";
// 	}
    
    @RequestMapping(value = "/test", method = RequestMethod.GET)
  	public String library_introduce(HttpServletRequest request, HttpServletResponse response, Model model) {
    	
    	String audioName = request.getParameter("audioName");
    	String objName = request.getParameter("objName");
    	
    	String objString = "I can see "+objName.toString();
    	Double score = etriapiService.etriApi(audioName,objString);
    	score = Math.round(score * 100) / 100.0;
    	
    	String scoreStr = score.toString();
    	
    	String papago = engToKorServie.EngToKor(objName);
    	String translateInput = findTranslatedTextService.findTranslatedText(papago);
    	
    	if(translateInput == null) {
    		translateInput = "Oops I don't know this Sorry!";
    	}
    	
    	model.addAttribute("audioName", audioName);
    	model.addAttribute("objName", objName);
    	model.addAttribute("scoreStr", scoreStr);
    	model.addAttribute("translateText", translateInput);
    	
    	return "test";
  	}
    
    @RequestMapping(value = "/test2", method = RequestMethod.GET)
  	public String library_introduce2() {
  		return "test2";
  	}
    
    
}

