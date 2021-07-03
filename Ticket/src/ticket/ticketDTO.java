package ticket;

public class ticketDTO {
	private int ticket_number;			
	private String ticket_category;		
	private String ticket_name;	
	private int ticket_price;			
	private int ticket_stock;		
	private String ticket_image;		
	private String ticket_info;
	private int discount_rate;		
	private String reg_date;	
	private int sold;
	public int getTicket_number() {
		return ticket_number;
	}
	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
	}
	public String getTicket_category() {
		return ticket_category;
	}
	public void setTicket_category(String ticket_category) {
		this.ticket_category = ticket_category;
	}
	public String getTicket_name() {
		return ticket_name;
	}
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	public int getTicket_price() {
		return ticket_price;
	}
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	public int getTicket_stock() {
		return ticket_stock;
	}
	public void setTicket_stock(int ticket_stock) {
		this.ticket_stock = ticket_stock;
	}
	public String getTicket_image() {
		return ticket_image;
	}
	public void setTicket_image(String ticket_image) {
		this.ticket_image = ticket_image;
	}
	public String getTicket_info() {
		return ticket_info;
	}
	public void setTicket_info(String ticket_info) {
		this.ticket_info = ticket_info;
	}
	public int getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	
}
