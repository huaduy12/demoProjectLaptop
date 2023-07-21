package Model;

public class Cartdetail {
	
	private int id;
	private int quantity;
	private int cart_id;
	private int product_id;
	private double total_item;
	public Cartdetail(int id, int quantity, int cart_id, int product_id) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.cart_id = cart_id;
		this.product_id = product_id;
	}
	
	
	public Cartdetail( int quantity, int cart_id, int product_id) {
		super();
		this.quantity = quantity;
		this.cart_id = cart_id;
		this.product_id = product_id;
	}
	
	public Cartdetail(int id, int quantity, int cart_id, int product_id,double total_item) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.total_item = total_item;
	}
	public Cartdetail( int quantity, int cart_id, int product_id,double total_item) {
		super();
	
		this.quantity = quantity;
		this.cart_id = cart_id;
		this.product_id = product_id;
		this.total_item = total_item;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getCart_id() {
		return cart_id;
	}


	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}


	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public double getTotal_item() {
		return total_item;
	}


	public void setTotal_item(double total_item) {
		this.total_item = total_item;
	}


	@Override
	public String toString() {
		return "Cartdetail [id=" + id + ", quantity=" + quantity + ", cart_id=" + cart_id + ", product_id=" + product_id
				+ ", total_item=" + total_item + "]";
	}


	
	
}
