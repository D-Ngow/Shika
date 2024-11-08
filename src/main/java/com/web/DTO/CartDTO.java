package com.web.DTO;

import lombok.Data;

@Data
public class CartDTO {
	private int cartId;
	private String productName;
    private String brand;
    private String color;
    private int size;
    private int quantity;
    private double price;
    private String image;
    private double subtotal;
    private Float discount;
}
