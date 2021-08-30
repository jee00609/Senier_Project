package com.awsTest.s3Upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class S3UploadApplication {

	public static void main(String[] args) {
		//local host : 8080
		SpringApplication.run(S3UploadApplication.class, args);
	}
}