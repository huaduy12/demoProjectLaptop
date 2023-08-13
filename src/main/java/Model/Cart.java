package Model;

import java.util.ArrayList;

import java.util.List;

public class Cart {

	private List<Item> items;

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	private Item getItemById(int id) {
		for (Item item : items) {
			if (item.getProduct().getId() == id) {
				return item;
			}
		}
		return null;
	}

	public int getQuantityById(int id) {
		return getItemById(id).getQuantity();
	}

	public void addItem(Item t) {
		if (getItemById(t.getProduct().getId()) != null) {
			Item m = getItemById(t.getProduct().getId());
			m.setQuantity(m.getQuantity() + t.getQuantity());
		} else {
			items.add(t);
		}
	}

	public void removeItem(int id) {
		if (getItemById(id) != null) {
			items.remove(getItemById(id));
		}
	}

	public double getTotalMoney() {
		double t = 0;

		for (Item item : items) {
			t += item.getQuantity() * item.getPrice();
		}
		return t;
	}
	
	public Product getProductById(int id, List<Product> list) {
		for (Product product : list ) {
			if(product.getId() == id) {
				return product;
			}
		}
		
		return null;
	}
	
	public Cart(String txt,List<Product> list) {
		items = new ArrayList<>();
		try {
			if(txt != null && txt.length() != 0) {
				String[] strings = txt.split("/");
				for (String string : strings) {
					String[] s = string.split(":");
					int id = Integer.parseInt(s[0]);
					int quantity = Integer.parseInt(s[1]);
					Product product  = getProductById(id, list);
					Item t = new Item(product, quantity,product.getDiscount());
					addItem(t);
				}
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
