package Model;


// troong mỗi gỏ hàng sẽ có nhiều item, 1 item sẽ có product, số lượng 1 sản phầm trong giỏ hàng, giá thành tiền khi nhân lên
public class Item {

	private Product product;
	private int quantity;
	private double price;
	
	
	public Item(Product product, int quantity, double price) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.price = price;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "Item [product=" + product + ", quantity=" + quantity + ", price=" + price + "]";
	}
	
	
}
