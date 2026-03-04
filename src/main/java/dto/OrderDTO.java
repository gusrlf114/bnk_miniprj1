package dto;

public class OrderDTO {
	
	private String orderno;
    private String shopno;
    private String orderdate;
    private String pcode;
    private int amount;

    // 기본 생성자
    public OrderDTO() {}

    // Getter와 Setter
    public String getOrderno() { return orderno; }
    public void setOrderno(String orderno) { this.orderno = orderno; }

    public String getShopno() { return shopno; }
    public void setShopno(String shopno) { this.shopno = shopno; }

    public String getOrderdate() { return orderdate; }
    public void setOrderdate(String orderdate) { this.orderdate = orderdate; }

    public String getPcode() { return pcode; }
    public void setPcode(String pcode) { this.pcode = pcode; }

    public int getAmount() { return amount; }
    public void setAmount(int amount) { this.amount = amount; }
}
