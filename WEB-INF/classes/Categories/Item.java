package Categories;
import java.io.Serializable;


public class Item implements Serializable{
	
	//private static final long serialVersionUID = 1L;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String name;
	public String desc;
	public double price;
	public String phoneNo;
	public String type;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	public String mailId;
	public String imgLink;
	
}
