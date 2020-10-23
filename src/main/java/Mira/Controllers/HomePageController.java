package Mira.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
	@RequestMapping(value={"/", "/mira"})
	public String getEntityPage() {
		return "mira";
	}
}