package Model;

public class SalesStatistics {

	
	private int orderMonth;
    private int totalSold;
    
    
    
    
	public SalesStatistics(int orderMonth, int totalSold) {
		super();
		this.orderMonth = orderMonth;
		this.totalSold = totalSold;
	}
	
	
	public int getOrderMonth() {
		return orderMonth;
	}
	public void setOrderMonth(int orderMonth) {
		this.orderMonth = orderMonth;
	}
	public int getTotalSold() {
		return totalSold;
	}
	public void setTotalSold(int totalSold) {
		this.totalSold = totalSold;
	}
    
    
    
}
