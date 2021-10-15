package com.awsTest.s3Upload.service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.awsTest.s3Upload.exception.InvalidFileFormatException;
import com.awsTest.s3Upload.exception.InvalidFileSizeException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

@Service
public class UploadService {

    @Value("${app.aws.iam.accesskey}")
    private String acessKey;

    @Value("${app.aws.iam.secretkey}")
    private String secretKey;

    @Value("${app.aws.s3.clientregion}")
    private String clientRegion;

    @Value("${app.aws.s3.bucketnameImage}")
    private String bucketNameImage;
    
    @Value("${app.aws.s3.bucketnameAudio}")
    private String bucketNameAudio;

    @Value("${spring.servlet.multipart.max-file-size}")
    private Integer maxFileSize;


    public String uploadImage(MultipartFile file) throws IOException, InvalidFileFormatException, InvalidFileSizeException, AmazonServiceException, SdkClientException{
        byte[] bytes = file.getBytes();

        
        // 선택한 이미지 이름을 변경
        // Example 2021-08-22 11:59:40.645
        SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");   
        String fileObjKeyName = sDate.format(Calendar.getInstance().getTime());

//      String fileObjKeyName = file.getOriginalFilename();

        
        if (!file.getContentType().contains("image/")) {
            throw new InvalidFileFormatException();
        }else if(file.getSize() > maxFileSize){
            throw new InvalidFileSizeException();
        } else {

            BasicAWSCredentials awsCreds = new BasicAWSCredentials(acessKey, secretKey);
            AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(clientRegion).withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();


            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(file.getContentType());
//            metadata.addUserMetadata("x-amz-meta-title", "someTitle");
            metadata.setContentLength(file.getSize());


            InputStream inputStream = new ByteArrayInputStream(bytes);
            PutObjectRequest request = new PutObjectRequest(bucketNameImage, fileObjKeyName, inputStream, metadata);

            s3Client.putObject(request);


            return "https://s3."+clientRegion+".amazonaws.com/"+bucketNameImage+"/"+fileObjKeyName;
        }
    }
    
    
    public String uploadAudio(MultipartFile file) throws IOException, InvalidFileFormatException, InvalidFileSizeException, AmazonServiceException, SdkClientException{
        byte[] bytes = file.getBytes();
        String fileObjKeyName = file.getOriginalFilename();

        if (!file.getContentType().contains("audio/")) {
            throw new InvalidFileFormatException();
        }else if(file.getSize() > maxFileSize){
            throw new InvalidFileSizeException();
        } else {

            BasicAWSCredentials awsCreds = new BasicAWSCredentials(acessKey, secretKey);
            AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withRegion(clientRegion).withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();


            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(file.getContentType());
//            metadata.addUserMetadata("x-amz-meta-title", "someTitle");
            metadata.setContentLength(file.getSize());


            InputStream inputStream = new ByteArrayInputStream(bytes);
            PutObjectRequest request = new PutObjectRequest(bucketNameAudio, fileObjKeyName, inputStream, metadata);

            s3Client.putObject(request);


            return "https://s3."+clientRegion+".amazonaws.com/"+bucketNameAudio+"/"+fileObjKeyName;
        }
    }
    
    public String uploadAudioAsset(HttpServletRequest request,MultipartFile file) throws IOException, InvalidFileFormatException, InvalidFileSizeException, AmazonServiceException, SdkClientException{
//        String fileName = file.getOriginalFilename();
    	String fileName = "inputAudio.wav";

        if (!file.getContentType().contains("audio/")) {
            throw new InvalidFileFormatException();
        }else if(file.getSize() > maxFileSize){
            throw new InvalidFileSizeException();
        } else {
        	
        	try {
				String uploadDir = "/audio/";
				String realPathUpload = request.getServletContext().getRealPath(uploadDir);

				String filePath = realPathUpload + fileName;

				File files = new File(filePath);
				file.transferTo(files);

			} catch (Exception ex) {
				ex.printStackTrace();
			}


            return fileName;
        }
    }

}
