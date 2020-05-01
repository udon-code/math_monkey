# -*- coding: utf-8 -*-
"""Helper class to handle decimal for column addition
"""

from decimal import getcontext, Decimal


class ColumnDecimal:
    @classmethod
    def SetPrec(cls, prec):
        getcontext().prec = prec

    def __init__(self, num):
        self.Set(num)

    def Set(self, num):
        self.num = Decimal(num) + Decimal(0)
        self.num_tuple = self.num.as_tuple()

    def GetDigit(self, digit):
        pos = self.num_tuple.exponent - digit - 1
        if pos >= 0 or abs(pos) > len(self.num_tuple.digits):
            return 0
        else:
            return self.num_tuple.digits[pos]

    def MaxDigit(self):
        return len(self.num_tuple.digits) + self.num_tuple.exponent

    def MinDigit(self):
        return self.num_tuple.exponent

    def __str__(self):
        return str(self.num)

    def __add__(self, v):
        if isinstance(v, int) or isinstance(v, float):
            v = ColumnDecimal(v)

        return ColumnDecimal(self.num + v.num)

    def __radd__(self, v):
        return self.__add__(v)

    def __sub__(self, v):
        if isinstance(v, int) or isinstance(v, float):
            v = ColumnDecimal(v)

        return ColumnDecimal(self.num - v.num)

    def __rsub__(self, v):
        return self.__sub__(v)

    @classmethod
    def GetCarry(cls, sum_val, *args):
        """Calculate carry flags
        - sum_val (Decimal)         : Sum of addition
        - args    (list of Decimal) : Augends
        """
        carry_flags = [0 for k in sum_val.num_tuple.digits]
        for digit in range(sum_val.MinDigit(), sum_val.MaxDigit()):
            sum_digit = sum_val.GetDigit(digit)
            op_digit_sum = sum([k.GetDigit(digit) for k in args])
            if (op_digit_sum) % 10 != sum_digit:
                carry_flags[digit] = 1

        return carry_flags

    @classmethod
    def GetBorrow(cls, sub_val, *args):
        """Calculate carry flags
        - sub_val (Decimal)         : Subtracted value (assume positive)
        - args    (list of Decimal) : Augends
        """
        max_digits_len = max([len(k.num_tuple.digits) for k in args])

        borrow_flags = [0 for _ in range(max_digits_len)]
        first_val = args[0]

        for digit in range(first_val.MinDigit(), first_val.MaxDigit()):
            sub_digit = sub_val.GetDigit(digit)
            first_digit = first_val.GetDigit(digit)
            other_digit_sum = sum([k.GetDigit(digit) for k in args[1:]])
            l_borrow = borrow_flags[digit-1] if digit > 0 else 0
            if (first_digit - other_digit_sum - l_borrow) != sub_digit:
                borrow_flags[digit] = 1

        return borrow_flags
