package com.example.test_may_tinh.model;

public class MayTinh {
    public double mayTinh(double num1, double num2, String phepTinh) {
        switch (phepTinh) {
            case("cong"):
                return num1 + num2;
            case ("tru"):
                return num1 - num2;
            case ("nhan"):
                return num1 * num2;
            case ("chia"):
                if (num2 != 0) {
                    return num1 / num2;
                } else {
                    throw new ArithmeticException("Lỗi: Mẫu bằng 0");
                }
            default:
                throw new ArithmeticException("Lỗi: Hoạt động không hợp lệ");
        }
    }
}
