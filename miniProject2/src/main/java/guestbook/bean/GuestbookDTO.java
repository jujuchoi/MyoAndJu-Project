package guestbook.bean;

import java.util.Date;

import lombok.Data;

@Data
public class GuestbookDTO {
	private int seq;
	private String name;
	private String email;
	private String homepage;
	private String subject;
	private String content;
	private Date logtime;

}
