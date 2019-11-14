package ssh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ssh.entity.Book;
import ssh.entity.Customer;
import ssh.entity.Employee;
import ssh.entity.Order;
import ssh.entity.Products;
import ssh.entity.Shipping;
import ssh.entity.Detail;

public interface OrderDao {

	public void saveOrder(Order order);

	public void saveDetail(Detail detail);
	
	public List<Order> getOrders();

	public Order getOrderById(int id);

	public void deleteOrderById(int id);

	public void update(Order order);
	
	public List<Order> getPagelist(int offset,int size);
	
	public Long getAllRecord();
	
	public List<Customer> getCustomers();
	
	public List<Products> getProducts();

	public List<Employee> getEmployees();
	
	public List<Shipping> getShippings();
	
	public List<Detail> getDetails(Integer id);
	
	public List<Order> getMonth(Integer month);
	
	public List<Integer> getMonthID(Integer month);
	
	public List<Map<Integer,Integer>> getDetailMap(Integer id);
	
	public Integer getDetailSum(Integer id);
	/*	
	public List<Integer> getOrderDate(String year,String month);
	*/
}
