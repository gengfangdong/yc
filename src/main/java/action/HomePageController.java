package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomePageController {
	
	@RequestMapping("/show/dist")
	public ModelAndView index(ModelAndView mv){
		mv.setViewName("/show/dist/index");
		return mv;
	}
	
	@RequestMapping("/Logout")
	public ModelAndView Logout(HttpServletRequest request,HttpServletResponse response,ModelAndView mv){
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		mv.setViewName("redirect:/show/dist");
		return mv;
	}
}
