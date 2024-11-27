package com.web.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InvoiceDetailDTO {
	private String img;
	private String name;
	private int soldQuantity;
	private float totalRevenue;
}
