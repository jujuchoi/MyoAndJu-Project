package board.bean;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private int seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	
	private int hit;
	private Date logtime;
}
