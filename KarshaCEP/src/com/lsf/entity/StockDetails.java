package com.lsf.entity;

// default package
// Generated May 31, 2016 3:23:31 PM by Hibernate Tools 4.0.0

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * StockDetails generated by hbm2java
 */
@Entity
public class StockDetails implements java.io.Serializable {

	private int permno;
	private String comnam;
	private String tsymbol;
	private int naics;
	private int naicsCode;
	private String naicsName;
	
	@Id
	public int getPermno() {
		return permno;
	}
	public void setPermno(int permno) {
		this.permno = permno;
	}
	public String getComnam() {
		return comnam;
	}
	public void setComnam(String comnam) {
		this.comnam = comnam;
	}
	public String getTsymbol() {
		return tsymbol;
	}
	public void setTsymbol(String tsymbol) {
		this.tsymbol = tsymbol;
	}
	public int getNaics() {
		return naics;
	}
	public void setNaics(int naics) {
		this.naics = naics;
	}
	public int getNaicsCode() {
		return naicsCode;
	}
	public void setNaicsCode(int naicsCode) {
		this.naicsCode = naicsCode;
	}
	public String getNaicsName() {
		return naicsName;
	}
	public void setNaicsName(String naicsName) {
		this.naicsName = naicsName;
	}
	
}
