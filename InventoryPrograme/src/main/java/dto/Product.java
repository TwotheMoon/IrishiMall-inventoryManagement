package dto;

public class Product {

	private String pID;			// 상품 시리얼 넘버 기본키
	private String pName;		// 상품 이름
	private Integer pQuantity;	// 상품 재고
	private Integer pPrice;		// 상품 가격
	private String pImg;		// 상품 이미지
	private String pSize;		// 상품 규격
	private Integer activation; // 활성화
	
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
