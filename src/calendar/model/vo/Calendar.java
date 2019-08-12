package calendar.model.vo;

import java.sql.Date;
import java.time.temporal.TemporalAccessor;

public class Calendar {
	
	private int id;
	private String title;
	private String url;
	private Date date;
	private char status;
	private int code;
	
	public Calendar() {}
	
	

	public Calendar(String title, String url, Date date, char status, int code) {
		super();
		this.title = title;
		this.url = url;
		this.date = date;
		this.status = status;
		this.code = code;
	}

	public Calendar(int id, String title, String url, Date date, char status, int code) {
		super();
		this.id = id;
		this.title = title;
		this.url = url;
		this.date = date;
		this.status = status;
		this.code = code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "Calendar [id=" + id + ", title=" + title + ", url=" + url + ", date=" + date + ", status=" + status
				+ ", code=" + code + "]";
	}
	
}