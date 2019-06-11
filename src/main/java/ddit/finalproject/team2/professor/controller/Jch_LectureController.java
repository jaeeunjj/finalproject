package ddit.finalproject.team2.professor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_CurriculumService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_LectureWeekVo;
import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;

@Controller
@RequestMapping("/professor")
public class Jch_LectureController {
	
	@Inject
	Jch_CurriculumService service;
	
	@GetMapping("alectureList")
	public ModelAndView lectureList(Authentication au, ModelAndView mv){
		System.out.println( au.getName());
		mv.setViewName("professor/lectureList");
		return mv;
	}
	
	@GetMapping(value="getLectureList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getLectureList(Authentication au){
		Map<String, Object> map = new HashMap<>();
		List<Jch_LectureVo> list = service.getLectureList(au.getName());
		map.put("data", list);
		return map;
	}
    
	
	@PostMapping(value="lectureWeekAdd")
	public String smsGroupAdd(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String view = null;
		String lecture_code = params.get("no");
	    if(lecture_code!=null) {
	    	params.remove("no");
	    }
		    
		List<String> aaa = new ArrayList<String>(params.keySet());
		List<String> list = new ArrayList<String>(params.values());
		List<Jch_LectureWeekVo> lwvList = new ArrayList<>();
		
		Jch_LectureWeekVo lwVo = null;
		for(int i=0; i<params.size(); i++) {
			int a = 0;
			if(aaa.get(i).contains("week")) {
				lwVo = new Jch_LectureWeekVo();
				lwVo.setLecture_code(lecture_code);
				lwVo.setLecture_week(list.get(i));
				continue;
			}
			if(aaa.get(i).contains("class")) {
				lwVo.setLecture_class(list.get(i));
				continue;
			}
			if(aaa.get(i).contains("subname")) {
				lwVo.setLecture_subname(list.get(i));
				lwvList.add(lwVo);
				continue;
			}
		}
			
		System.out.println(lwvList.toString());
		Jch_LectureWeekVo vo = new Jch_LectureWeekVo();
		vo.setLecWeek_list(lwvList);
		
		ServiceResult result = service.insertLectureWeekList(vo);
		if (ServiceResult.OK.equals(result)) {
	    	view = "redirect:alectureList";
		} else {
			view = "professor/lectureList";
		}
		return view;
	}
	
}