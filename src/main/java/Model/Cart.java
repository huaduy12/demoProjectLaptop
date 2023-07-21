package Model;

public class Cart {
	
	private int id;
	private double total_money;
	private int user_id;
	
	public Cart(int id, double total_money, int user_id) {
		super();
		this.id = id;
		this.total_money = total_money;
		this.user_id = user_id;
	}
	public Cart( double total_money, int user_id) {
		super();
		this.total_money = total_money;
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getTotal_money() {
		return total_money;
	}
	public void setTotal_money(double total_money) {
		this.total_money = total_money;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", total_money=" + total_money + ", user_id=" + user_id + "]";
	}
	
	
	
}
