package ssh.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ssh.entity.Book;
import ssh.entity.Customer;
import ssh.entity.Employee;
import ssh.entity.Order;
import ssh.entity.Page;
import ssh.entity.Products;
import ssh.entity.Shipping;
import ssh.entity.Detail;

public interface OrderService {
	public void saveOrder(Order order);
	
	public void saveDetail(Detail detail);

	public List<Order> getOrders();

	public Order getOrderById(int id);

	public void deleteOrderById(int id);

	public void update(Order order);

	public Page getForPage(int currentPage,int pageSize);
	
	public Long getAllRecord();
	
	public List<Customer> getCustomers();
	
	public List<Employee> getEmployees();
	
	public List<Shipping> getShippings();
	
	public List<Detail> getDetails(Integer id);
	
	public List<Products> getProducts();
	
	public List<Order> getMonth(Integer month);
	
	public HashMap<Integer,Integer> getDetailMap(Integer month);
	
	public Integer getDetailSum(Integer month);
/*	
	public List<Integer> getOrderDate(String year,String month);
*/
}
