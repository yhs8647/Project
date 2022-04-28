package com.tisproject.view.userView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tisproject.biz.title.TitleVO;
import com.tisproject.biz.user.DTO.Criteria;
import com.tisproject.biz.user.DTO.PageDTO;
import com.tisproject.biz.user.DTO.UserVO;
import com.tisproject.biz.user.Service.UserService;
import com.tisproject.biz.user.mail.MailSendService;

@Controller
@SessionAttributes({"manager", "nickname"})
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MailSendService mss;
	
	UserVO userVO = new UserVO();
	
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String,String>();
		conditionMap.put("아이디","USERID");
		conditionMap.put("닉네임","NICKNAME");
		return conditionMap;
	}

	//메인페이지
	@RequestMapping(value = "/index.do")
	public String indexDo() {
		return "login";
	}

	
	//로그인
	@RequestMapping(value = "/login.do")
	public String loginDo(HttpServletRequest request, Model model) throws Exception {
		userVO.setUserid(request.getParameter("userid"));
		userVO.setPassword(request.getParameter("password"));
		
		UserVO manager = userService.manager(userVO);
		// 매니저 값 가져와 session에 넣음
		model.addAttribute("manager", manager.getManager());
		
		// 로그인한 유저들의 닉네임을 session에 넣음
		model.addAttribute("nickname", manager.getNickname());
		System.out.println("aaaaaaaaaa"+manager);
		  
//		System.out.println(userVO.getUserid());
//		System.out.println(userVO.getPassword()); 
		userVO = userService.loginDo(userVO); 
		System.out.println(userVO.getBirthday());
		return "redirect:home.do";
	}


		
	//개인정보수정
	@RequestMapping(value = "/profile.do")
	public String seleteOneDo(Model model, HttpServletRequest request) throws Exception {		
        userVO = userService.selectOne(userVO.getUserid());
        
        model.addAttribute("vo", userVO);
        
        return "profile";
	}

	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
	//개인정보수정완료
	@RequestMapping(value = "/profileupdate.do")
	public String profileupdateDo(HttpServletRequest request) throws Exception {
		userVO.setUserid(userVO.getUserid());
		int[] test = new int[3];
		String[] arr = new String[3];
		arr = request.getParameterValues("Favorite_Genre");
		
		for(int i = 0; i<=2;i++) {
			test[i] = Integer.parseInt(arr[i]);
			System.out.println(test[i]);
		}

		userVO.setEmail(request.getParameter("email"));
		userVO.setNickname(request.getParameter("nickname"));
		userVO.setPassword(request.getParameter("password"));
		userVO.setFavorite_genre(test); 
		userService.profileupdate(userVO);
		 
		return "redirect:profile.do?userid=" + userVO.getUserid();
	}

		
		
	//내 영화목록
	@RequestMapping(value = "/mymovie.do")
	public String mymovieDo(Model model) throws Exception {
		List<TitleVO> titleVO = userService.mymovielist(userVO);
		List<UserVO> userVO2 = userService.mymovielist2(userVO);
		System.out.println(titleVO);
		model.addAttribute("TitleVO", titleVO);
		model.addAttribute("TitleVO2", userVO2);
		model.addAttribute("vo", userVO);

		return "mymovie";
	}
		
		

	//결제완료
	@RequestMapping(value = "/Rankup.do")
	public String rankupDo(Model model) throws Exception {
			if (userVO.getRank() != 1) {
				UserVO vo = userService.loginDo(userVO);
			userService.rankupDo(vo);
				return "redirect:mymovie.do";
			} else {
			model.addAttribute("returl", "redirct:mymovie.do");
				return "redirect:mymovie.do";
		}
	}

	@RequestMapping(value = "/logout.do")
	public String logout() {
			userVO = new UserVO();
		return "redirect:index.do";
	}
		
		
	//회원탈퇴
	@RequestMapping(value = "/leave.do")
	public void leaveDo(Model model) throws Exception {
		
        //임의의 authKey 생성 & 이메일 발송
		System.out.println("ㅇㅇ:"+userVO.getEmail());
        mss.sendAuthMail(userVO.getEmail());
	}
		
	//회원탈퇴 2번
	@RequestMapping(value="/leaveDo.do", method=RequestMethod.GET)
	public void leaveUp(String email) {
		
		System.out.println(email);
		userService.userleave(userVO);
	}
	
	
	//회원탈퇴완료
	@RequestMapping(value="/leavepop.do")
	public String leavepop() {
		return "leavepop";
	}
		//회원가입창으로 이동(이름 임시)
	@RequestMapping(value="/sign_up.do")
	public String Userd() {
		return "sign_up";
	}
		
//		@PostMapping("/signUp")
//		public String signUp(UserVO userVO) {
//			System.out.println("회원가입신호");
//			userService.signUp(userVO);
//			return "redirect:/";
//		}
		
	//회원가입완료
	@RequestMapping(value = "/signUp.do")
	public String signUp(UserVO userVO,HttpServletRequest request) throws Exception {
		
		//내용은 다 바꼈습니다. 
		//insert를 다 채울 데이터가 넘어가지 못해서 ORA-00001 무결성 제약조건 위배 에러 나올겁니다 
		System.out.println("JSP에서 모두 작성하였을때, 아래 문구들이 null값이 아니라면 정상적으로 넘어옴");
		System.out.println(userVO.getUserid());
		char gender = request.getParameter("gender").charAt(0);
		userVO.setGender(gender);
		System.out.println("비밀번호: "+userVO.getPassword());
		System.out.println("성별 출력: "+userVO.getGender());
		System.out.println("이메일: "+userVO.getEmail());
		System.out.println("생년월일: "+userVO.getBirthday());
		/* 1. 학원에서 수정해야하는 내용
		 * System.out.println("장르1:"+userVO.getFavorite_genre1());
		 * System.out.println("장르2:"+userVO.getFavorite_genre2());
		 * System.out.println("장르3:"+userVO.getFavorite_genre3());
		 */
	    System.out.println("회원가입신호");
		userService.SignUp(userVO); 
	    return "login";
	}
	
		
	// 이름 중복 체크
	@ResponseBody
	@RequestMapping(value="/nameCheck.do",
		produces = "application/json",
		method = RequestMethod.POST)
	public Map<String, Integer> nameCheck(@RequestBody UserVO userVO) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		System.out.println(userVO);
		Integer result = userService.nameCheck(userVO);
		
		System.out.println(result);
		map.put("result", result);
		return map;
	}
		
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idCheck.do",
		produces = "application/json",
		method = RequestMethod.POST)
	public Map<String, Integer> idCheck(@RequestBody UserVO userVO) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		System.out.println(userVO);
		
		Integer result = userService.idCheck(userVO);
		
	 System.out.println(result);
		map.put("result", result);
		return map;
	}
	
	
	// userList
//	@RequestMapping(value = "/getUserList.do")
//	public String userList(Model model) throws Exception {
//		System.out.println("userList");
//		
//		List<UserVO> list = userService.userList(userVO);
//		System.out.println("userController: "+userVO);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", userVO);
//
//		return "getUserList";
//	}
	
	@RequestMapping(value = "/getUserList.do")
	public String userList(Criteria cri, Model model, HttpServletRequest request) throws Exception {
		List<UserVO> list = userService.userList(cri);
		model.addAttribute("list", list);
		
		System.out.println(userVO.getGender());
		
		UserVO manager = userService.manager(userVO);
		model.addAttribute("gender", manager.getGender());
		System.out.println(manager);
		
		model.addAttribute("vo", userVO);
		model.addAttribute("pageMaker", new PageDTO(cri, userService.getTotal(cri)));
		
		return "getUserList";
	}
	
	@RequestMapping(value="/reason.do")
	public String reasonDo(HttpServletRequest request) throws Exception{
		String reason = request.getParameter("reason");
		System.out.println(reason);
		userService.reasonDo(reason);
		return null;
	}
	
	
		
		
	
	//내 영화목록
//		@RequestMapping(value = "/mymovie.do")
//		public String mymovieDo(Model model) throws Exception {
//			List<TitleVO> titleVO = userService.mymovielist(userVO);
//			List<UserVO> userVO2 = userService.mymovielist2(userVO);
//			System.out.println(titleVO);
//			model.addAttribute("TitleVO", titleVO);
//			model.addAttribute("TitleVO2", userVO2);
//			model.addAttribute("vo", userVO);
//
//			return "mymovie";
//		}
}
