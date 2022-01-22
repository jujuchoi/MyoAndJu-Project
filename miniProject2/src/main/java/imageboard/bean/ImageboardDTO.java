package imageboard.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ImageboardDTO {
	private int seq;
	private String imageId;
	private String imageName;
	private int imagePrice;
	private int imageQty;
	private String imageContent;
	private String image1;
	private Date logtime;
}
