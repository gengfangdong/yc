package util;

import java.math.BigDecimal;

public class test {
	public static void main(String[] args) {
		BigDecimal b = new BigDecimal("19.123456789");
		System.out.println(b.setScale(8, BigDecimal.ROUND_HALF_UP).doubleValue());
	}
}
