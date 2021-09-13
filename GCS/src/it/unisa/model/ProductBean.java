package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int code;
	private String name;
	private String description;
	private double price;
	private int quantity;
	private double sconto;
	private double prezzoScontato;
	private double iva;
	private int cartQuantity;
	private double tot;
	private String thumbnail;
	private String categoria;
	
	public ProductBean() {
		code = -1;
		name = "";
		description = "";
	}

	public String getThumbnail() {
		return thumbnail;
	}
	
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public double getTot() {
		return tot;
	}

	public void setTot(double tot) {
		this.tot = tot;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getCartQuantity() {
		return this.cartQuantity;
	}

	public void setCartQuantity(int quantity) {
		this.cartQuantity = quantity;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + description;
	}

	public double getIva() {
		return iva;
	}
	
	
	public double getPrezzoScontato() {
		return prezzoScontato;
	}
	
	public double getSconto() {
		return sconto;
	}
	
	public void setIva(double iva) {
		this.iva = iva;
	}
	
	
	public void setPrezzoScontato(double prezzoScontato) {
		this.prezzoScontato = prezzoScontato;
	}
	
	public void setSconto(double sconto) {
		this.sconto = sconto;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
}
