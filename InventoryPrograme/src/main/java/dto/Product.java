package dto;

public class Product {

	private String pID;			// ��ǰ �ø��� �ѹ� �⺻Ű
	private String pName;		// ��ǰ �̸�
	private Integer pQuantity;	// ��ǰ ���
	private Integer pPrice;		// ��ǰ ����
	private String pImg;		// ��ǰ �̹���
	private String pSize;		// ��ǰ �԰�
	private Integer activation; // Ȱ��ȭ
	
	public String getpID() {
		return pID;
	}
	public void setpID(String pID) {
		this.pID = pID;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public Integer getpQuantity() {
		return pQuantity;
	}
	public void setpQuantity(Integer pQuantity) {
		this.pQuantity = pQuantity;
	}
	public Integer getpPrice() {
		return pPrice;
	}
	public void setpPrice(Integer pPrice) {
		this.pPrice = pPrice;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public Integer getactivation() {
		return activation;
	}
	public void setactivation(Integer activation) {
		this.activation = activation;
	}
	
	
	
}
