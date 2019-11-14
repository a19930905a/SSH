package ssh.entity;

import java.text.DecimalFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Table(name = "detail")
public class Detail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "訂單ID")
	private Integer id;
	
	@Id
	@OneToOne
	@JoinColumn(name = "產品ID")
	private Integer order_id;
	
	@Column(name = "單價")
	private DecimalFormat price;
	
	@Column(name = "數量")
	private Integer amount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public DecimalFormat getPrice() {
		return price;
	}

	public void setPrice(DecimalFormat price) {
		this.price = price;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	
}
