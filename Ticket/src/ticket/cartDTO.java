package ticket;

public class cartDTO {
	private int cart_number;
	private String buyer;
	private String ticket_name;
	private int buy_price;
	private int buy_count;
	private String ticket_image;
	
	public int getCart_number() {
		return cart_number;
	}
	public void setCart_number(int cart_number) {
		this.cart_number = cart_number;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getTicket_name() {
		return ticket_name;
	}
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	public int getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}
	public int getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}
	public String getTicket_image() {
		return ticket_image;
	}
	public void setTicket_image(String ticket_image) {
		this.ticket_image = ticket_image;
	}
}
