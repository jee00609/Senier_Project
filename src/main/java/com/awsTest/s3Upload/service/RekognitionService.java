package com.awsTest.s3Upload.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.services.rekognition.AmazonRekognition;
import com.amazonaws.services.rekognition.AmazonRekognitionClientBuilder;
import com.amazonaws.services.rekognition.model.AmazonRekognitionException;
import com.amazonaws.services.rekognition.model.DetectLabelsRequest;
import com.amazonaws.services.rekognition.model.DetectLabelsResult;
import com.amazonaws.services.rekognition.model.Image;
import com.amazonaws.services.rekognition.model.Label;
import com.amazonaws.services.rekognition.model.S3Object;
import java.util.List;


@Service
public class RekognitionService  {
	
	@Value("${app.aws.iam.accesskey}")
    private String acessKey;

    @Value("${app.aws.iam.secretkey}")
    private String secretKey;

    @Value("${app.aws.s3.clientregion}")
    private String clientRegion;

    @Value("${app.aws.s3.bucketnameImage}")
    private String bucketNameImage;
    
    
    public List<Label> rekognitionImage(String urlImage){
    	
    	String inputUrl = urlImage;
    	String[] splitWord=inputUrl.split(("/"));
    	String photo = null;
    	List <Label> labels=null;
    	
    	for(String s:splitWord){
    		photo = s;
    	}
    	
//    	System.out.println("photo is"+photo);
//    	
//    	System.out.println("bucketNameImage is"+bucketNameImage);
    	
    	AmazonRekognition rekognitionClient = AmazonRekognitionClientBuilder.standard().withRegion(clientRegion).build();
    	

    	DetectLabelsRequest request = new DetectLabelsRequest()
   	         .withImage(new Image()
   	         .withS3Object(new S3Object()
   	         .withName(photo).withBucket(bucketNameImage)))
   	         .withMaxLabels(10)
   	         .withMinConfidence(75F);

   	    try {
//   	    	System.out.println("Hey");
   	    	DetectLabelsResult result = rekognitionClient.detectLabels(request);
   	        labels = result.getLabels();

   	        System.out.println("Detected labels for " + photo);
   	        for (Label label: labels) {
   	           System.out.println(label.getName() + ": " + label.getConfidence().toString());
   	        }
   	       
   	        return labels;
   	    } catch(AmazonRekognitionException e) {
   	       e.printStackTrace();
   	    }
   	    return labels;

    	
    }

}
