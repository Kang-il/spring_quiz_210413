package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson02Quiz02Controller {

	//JSON 출력 (List, Map)
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz0201(){
		List<Map<String,Object>> list= new ArrayList<>();
		
		Map<String,Object> map=new HashMap<String,Object>(){
			{
			 put("rate",15);
			 put("director","봉준호");
			 put("time",131);
			 put("title","기생충");
			}
		};
		list.add(map);
		
		map=new HashMap<String,Object>(){
			{
			 put("rate",0);
			 put("director","로베르토 베니니");
			 put("time",116);
			 put("title","인생은 아름다워");
			}
		};
		list.add(map);
		
		map = new HashMap<>() {
			{
			  put("rate",12);
			  put("director","크리스토퍼 놀란");
			  put("time",147);
			  put("title","인셉션");
			}
		};
		list.add(map);
		
		map = new HashMap<>() {
			{
			  put("rate",19);
			  put("director","윤종빈");
			  put("time",133);
			  put("title","범죄와의 전쟁 : 나쁜놈들 전성시대");
			}
		};
		list.add(map);
		
		map = new HashMap<>() {
			{
			  put("rate",15);
			  put("director","프란시스 로렌스");
			  put("time",137);
			  put("title","헝거게임");
			}
		};
		list.add(map);
		
		return list;
	}
	
	@RequestMapping("/2")
	public List<Lesson02Quiz02Data> quiz0202(){
		List<Lesson02Quiz02Data> list=new ArrayList<>();
		Lesson02Quiz02Data data= new Lesson02Quiz02Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		list.add(data);
		
		data=new Lesson02Quiz02Data();
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘 목요일이었어... 금요일인줄");
		list.add(data);
		
		data=new Lesson02Quiz02Data();
		data.setTitle("오늘 데이트 한 썰 푼다");
		data.setUser("dulumary");
		data.setContent("하리수 - 템테이션");
		list.add(data);
		
		return list;
	}
	
	
	@RequestMapping("/3")
	public ResponseEntity<Lesson02Quiz02Data> quiz0203(){
		Lesson02Quiz02Data data = new Lesson02Quiz02Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<>(data,HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
