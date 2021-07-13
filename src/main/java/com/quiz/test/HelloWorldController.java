package com.quiz.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("quiz01/ex01")
public class HelloWorldController {
 
	
	@RequestMapping("/1")
	@ResponseBody
	public String printHelloWorld() {
		return "HelloWorld!!";
	}
}
