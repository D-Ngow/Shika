package com.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ShikoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShikoApplication.class, args);
	}

}
