package com.t09ether.home.dto;

import java.util.List;

public class OrderDTO {

   private int ord_no;
   private int pro_code;
   private String userid;
   private int ord_count; //내가주문한상품수
   private int status;
   private int pd_status; //product_detail 상태
   private String pd_userid;

	
	private int on_no;
	private String writedate;
	private String orderdate;
//////////////////////////////////
	//만들어낸 변수
	private int on_count;//상품총주문개수
	private int rest_count; //남은상품개수
	private int ord_amount; // 배달비 + 개당*수량
	private String shareaddr;
	private String sharedetail;
	
	////상품 
	private int pro_total;
	private String pro_name;
	private int pro_price;
	private String pro_stock;
	private String image;
	private String detailed;
	
	
	//회원
	private String userpwd;
	private String username;
	
	private String tel;
	
	private String email;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String rank;
	
	
	private List<Integer> on_noList;
	private List<Integer> statusList;
	
	public String getPd_userid() {
		return pd_userid;
	}
	public void setPd_userid(String pd_userid) {
		this.pd_userid = pd_userid;
	}
	public int getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(int ord_no) {
		this.ord_no = ord_no;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOrd_count() {
		return ord_count;
	}
	public void setOrd_count(int ord_count) {
		this.ord_count = ord_count;
		
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPd_status() {
		return pd_status;
	}
	public void setPd_status(int pd_status) {
		this.pd_status = pd_status;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getOn_count() {
		return on_count;
	}
	public void setOn_count(int on_count) {
		this.on_count = on_count;
		
	}
	
	public int getOn_no() {
		return on_no;
	}

	public void setOn_no(int on_no) {
		this.on_no = on_no;
	}

	public int getRest_count() {
		return rest_count;
	}
	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
		
	}

	
	public int getOrd_amount() {
		return ord_amount;
	}

	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}

	public String getShareaddr() {
		return shareaddr;
	}

	public void setShareaddr(String shareaddr) {
		this.shareaddr = shareaddr;
	}

	public String getSharedetail() {
		return sharedetail;
	}

	public void setSharedetail(String sharedetail) {
		this.sharedetail = sharedetail;
	}

	public int getPro_total() {
		return pro_total;
	}
	public void setPro_total(int pro_total) {
		this.pro_total = pro_total;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(String pro_stock) {
		this.pro_stock = pro_stock;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public List<Integer> getOn_noList() {
		return on_noList;
	}
	public void setOn_noList(List<Integer> on_noList) {
		this.on_noList = on_noList;
	}
	public List<Integer> getStatusList() {
		return statusList;
	}
	public void setStatusList(List<Integer> statusList) {
		this.statusList = statusList;
	}   
	
}


