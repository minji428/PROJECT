package ticket;

public class locationDTO {
	private int ticket_number;
	private String ticket_name;
	private String ticket_category;
	private String Y_position;
	private String X_position;
	
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
	public String getY_position() {
		return Y_position;
	}
	public void setY_position(String y_position) {
		Y_position = y_position;
	}
	public String getX_position() {
		return X_position;
	}
	public void setX_position(String x_position) {
		X_position = x_position;
	}

}
