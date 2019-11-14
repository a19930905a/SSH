package ssh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import ssh.entity.Book;
import ssh.entity.Customer;
import ssh.entity.Employee;
import ssh.entity.Order;
import ssh.entity.Page;
import ssh.entity.Products;
import ssh.entity.Shipping;
import ssh.entity.Detail;
import ssh.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	private OrderService orderService;
	

	@ModelAttribute("customer_list")
	public List<Customer> getCustomerList(){
		return orderService.getCustomers();
	}
	
	@ModelAttribute("employee_list")
	public List<Employee> getEmployeeList(){
		return orderService.getEmployees();
	}
	
	@ModelAttribute("product_list")
	public List<Products> getProductList(){
		return orderService.getProducts();
	}
	
	@ModelAttribute("shipping_list")
	public List<Shipping> getShippingList(){
		return orderService.getShippings();
	}
	@RequestMapping(value = "search",method = RequestMethod.GET)
	public String searchOrder(HttpServletRequest request) {
		String id = request.getParameter("id");
		Order order = orderService.getOrderById(Integer.parseInt(id));
		request.setAttribute("order", order);
		return "search";
	}
	
	@RequestMapping(value = "/newOrder",method = RequestMethod.GET)
	public String newOrder(@ModelAttribute Order order) {
		return "add";
	}
	@RequestMapping(value = "save" ,method = RequestMethod.POST)
	public String save(@ModelAttribute Order order) {
		orderService.saveOrder(order);
		return "redirect:/orders/orderlists";
	}
	@RequestMapping(value = "modifyOrder" , method = RequestMethod.GET)
	public String modiftyOrder(HttpServletRequest request) {
		String id = request.getParameter("id");
		Order order = orderService.getOrderById(Integer.parseInt(id));
		request.setAttribute("order", order);
		return "Edit";
	}

	@RequestMapping(value = "Update" ,method = RequestMethod.POST)
	public String Update(Model model,Order order) {
		model.addAttribute("order",order);
		orderService.update(order);
		return "redirect:/orders/orderlists";
	}

	@RequestMapping(value = "deleteOrder" , method = RequestMethod.GET)
	public String deleteOrder(@RequestParam(value = "id") Integer id) {
		orderService.deleteOrderById(id);
		return "redirect:/orders/orderlists";
	}
	
	@RequestMapping(value = "orderlists",method = RequestMethod.GET)
	public String pagination(HttpServletRequest request,@ModelAttribute Order order) {
		String pageNo = request.getParameter("pageNo");
		if(pageNo == null) {
			pageNo = "1";
		}
		Page page = orderService.getForPage(Integer.valueOf(pageNo), 10);
		request.setAttribute("page", page);
		List<Order> orderlist = page.getList();
		request.setAttribute("orderlist", orderlist);
		return "orderlistpage";
	}
	@RequestMapping(value = "compare",method = RequestMethod.GET)
	public String getMonth(@RequestParam(value = "month1")Integer month1,@RequestParam(value = "month2")Integer month2,Model model) {
		List<Order> order_list1 = orderService.getMonth(month1);
		List<Order> order_list2 = orderService.getMonth(month2);
		model.addAttribute("order_list1",order_list1);
		model.addAttribute("order_list2",order_list2);
		return "report";
	}
	
	@RequestMapping(value = "product",method = RequestMethod.GET)
	public String getProducts(@RequestParam(value = "month")Integer month,Model model) {
		List<Order> order_list = orderService.getMonth(month);
		List<Products> product_list = orderService.getProducts();
		model.addAttribute("order_list",order_list);
		model.addAttribute("product_list",product_list);
		return "products";
	}
	
	@RequestMapping(value = "product2",method = RequestMethod.GET)
	public String getProducts2(@RequestParam(value = "month")Integer month,Model model) {
		HashMap<Integer, Integer> detail_map = orderService.getDetailMap(month);
		Integer total_income = orderService.getDetailSum(month);
		List<Products> product_list = orderService.getProducts();
		model.addAttribute("product_list",product_list);
		model.addAttribute("detail_map",detail_map);
		model.addAttribute("total_income",total_income);
		return "products2";
	}
	
	@RequestMapping(value = "monthDetail",method = RequestMethod.GET)
	public String getMonthDetail(HttpServletRequest request) {
		String month = request.getParameter("month");
		List<Order> order_list = orderService.getMonth(Integer.parseInt(month));
		request.setAttribute("order_list",order_list);
		return "monthDetail";
	}
	
}
