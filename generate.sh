#!/bin/bash

PYTHON=python

set -e
set -x

GEN_NUMS="10 100 1000"


# �����Z: 2��, ���オ��Ȃ�
for num in ${GEN_NUMS}
do
    outfile=add_hissan_2digit_no_carry_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '���Ȃ܂�' \
  	--title '�����Z (2���A���オ��Ȃ�)'
    ptex2pdf -l ${outfile}
done


# �����Z: 2��, ���オ�肠��
for num in ${GEN_NUMS}
do
    outfile=add_hissan_2digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '���Ȃ܂�' \
  	--title '�����Z (2���A���オ��)'
    ptex2pdf -l ${outfile}
done

# �����Z: 3��, ���オ�肠��
for num in ${GEN_NUMS}
do
    outfile=add_hissan_3digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 3 \
	--min_digits 1 \
    	--name '���O' \
  	--title '�����Z (3���A���オ��)'
    ptex2pdf -l ${outfile}
done

# �����Z: 2��, ��������Ȃ�
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_2digit_no_borrow_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '���Ȃ܂�' \
  	--title '�����Z (2���A��������Ȃ�)'
    ptex2pdf -l ${outfile}
done


# �����Z: 2��, �������肠��
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_2digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '���Ȃ܂�' \
  	--title '�����Z (2���A�������肠��)'
    ptex2pdf -l ${outfile}
done

# �����Z: 3��, �������肠��
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_3digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 3 \
	--min_digits 1 \
    	--name '���O' \
  	--title '�����Z (3���A�������肠��)'
    ptex2pdf -l ${outfile}
done

# �����Z: 7�� (�����t��)
for num in ${GEN_NUMS}
do
    outfile=add_hissan_7digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 7 \
	--min_digits 7 \
    	--name '���O' \
  	--title '�����Z (7��)' \
	--answer
    ptex2pdf -l ${outfile}
done

# �����Z: 7�� (�����t��)
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_7digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 7 \
	--min_digits 7 \
    	--name '���O' \
  	--title '�����Z (7��)' \
	--answer
    ptex2pdf -l ${outfile}
done

# �����Z: 16�� (�����t��)
for num in ${GEN_NUMS}
do
    outfile=add_hissan_16digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 16 \
	--min_digits 16 \
    	--name '���O' \
  	--title '�����Z (16��)' \
	--answer
    ptex2pdf -l ${outfile}
done

# �����Z: 16�� (�����t��)
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_16digit_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o  ${outfile} \
	--inc_carry_over \
    	-n ${num} \
    	--digits 16 \
	--min_digits 16 \
    	--name '���O' \
  	--title '�����Z (16��)' \
	--answer
    ptex2pdf -l ${outfile}
done
