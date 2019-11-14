package ssh.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ssh.dao.OrderDao;
import ssh.entity.Book;
import ssh.entity.Customer;
import ssh.entity.Employee;
import ssh.entity.Order;
import ssh.entity.Page;
import ssh.entity.Products;
import ssh.entity.Shipping;
import ssh.entity.Detail;

@Service

public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void saveOrder(Order order) {
		orderDao.saveOrder(order);	
	}
	
	

	@Override
	public void saveDetail(Detail detail) {
		orderDao.saveDetail(detail);
		
	}

	@Override
	public List<Order> getOrders() {
	
		return orderDao.getOrders();
	}

	@Override
	public List<Customer> getCustomers() {
		return orderDao.getCustomers();
	}

	@Override
	public List<Employee> getEmployees() {
		return orderDao.getEmployees();
	}

	@Override
	public List<Shipping> getShippings() {
		return orderDao.getShippings();
	}

	@Override
	public List<Detail> getDetails(Integer id) {
		
		return orderDao.getDetails(id);
	}

	@Override
	public List<Products> getProducts() {
		
		return orderDao.getProducts();
	}
	
	
	@Override
	public Order getOrderById(int id) {
		
		return orderDao.getOrderById(id);
	}

	@Override
	public void deleteOrderById(int id) {
		orderDao.deleteOrderById(id);

	}

	@Override
	public void update(Order order) {
		orderDao.update(order);
		
	}
	@Override
	public Long getAllRecord() {
		return orderDao.getAllRecord();
	}

	@Override
	public List<Order> getMonth(Integer month) {
		
		return orderDao.getMonth(month);
	}
	


	/**
	 * 分頁功能
	 */
	public Page getForPage(int currentPage,int pageSize) {
		Page page = new Page();
		
		int AllRecord = orderDao.getAllRecord().intValue();
		int offset = page.countOffset(currentPage, pageSize);
		
		List<Order> list = orderDao.getPagelist(offset, pageSize);
		page.setList(list);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecord(AllRecord);
		
		return page;
	}
	/**
	 * 	返回該月的總營額
	 * */
	@Override
	public Integer getDetailSum(Integer month) {
		int sum = 0;
		List<Integer> order_list = orderDao.getMonthID(month);
		for(int i = 0 ; i<order_list.size() ; i++) {
			sum += orderDao.getDetailSum(order_list.get(i));
		}
		return sum;
	}
	/*
	@Override
	public List<Integer> getOrderDate(String year,String month) {
		return orderDao.getOrderDate(year,month);
	}
*/
	/**
	 * 	由月份返回一個由 detail.product.id , detail.amount 組成的 HashMap
	 * */
	@Override
	public HashMap<Integer,Integer> getDetailMap(Integer month) {
		HashMap<Integer,Integer> list = new HashMap<Integer,Integer>();
		List<Map<Integer,Integer>> detail = orderDao.getDetailMap(month);
		for(int i = 0 ; i<detail.size() ; i++) {
			Map<Integer,Integer> temp = detail.get(i);
			if(!list.containsKey(temp.get("id"))) {
				list.put(temp.get("id"),temp.get("amount"));
			}else {
				list.replace(temp.get("id"), list.get(temp.get("id")) + temp.get("amount"));
			}
		}
		return list;
	}
	
}
