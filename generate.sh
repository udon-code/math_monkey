#!/bin/bash

PYTHON=python

set -e
set -x

GEN_NUMS="10 100 1000"


# 足し算: 2桁, 桁上がりなし
for num in ${GEN_NUMS}
do
    outfile=add_hissan_2digit_no_carry_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name 'おなまえ' \
  	--title '足し算 (2桁、桁上がりなし)'
    ptex2pdf -l ${outfile}
done


# 足し算: 2桁, 桁上がりあり
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
    	--name 'おなまえ' \
  	--title '足し算 (2桁、桁上がり)'
    ptex2pdf -l ${outfile}
done

# 足し算: 3桁, 桁上がりあり
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
    	--name '名前' \
  	--title '足し算 (3桁、桁上がり)'
    ptex2pdf -l ${outfile}
done

# 引き算: 2桁, 桁下がりなし
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_2digit_no_borrow_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name 'おなまえ' \
  	--title '引き算 (2桁、桁下がりなし)'
    ptex2pdf -l ${outfile}
done


# 引き算: 2桁, 桁下がりあり
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
    	--name 'おなまえ' \
  	--title '引き算 (2桁、桁下がりあり)'
    ptex2pdf -l ${outfile}
done

# 引き算: 3桁, 桁下がりあり
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
    	--name '名前' \
  	--title '引き算 (3桁、桁下がりあり)'
    ptex2pdf -l ${outfile}
done

# 足し算: 7桁 (答え付き)
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
    	--name '名前' \
  	--title '足し算 (7桁)' \
	--answer
    ptex2pdf -l ${outfile}
done

# 引き算: 7桁 (答え付き)
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
    	--name '名前' \
  	--title '引き算 (7桁)' \
	--answer
    ptex2pdf -l ${outfile}
done

# 足し算: 16桁 (答え付き)
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
    	--name '名前' \
  	--title '足し算 (16桁)' \
	--answer
    ptex2pdf -l ${outfile}
done

# 引き算: 16桁 (答え付き)
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
    	--name '名前' \
  	--title '引き算 (16桁)' \
	--answer
    ptex2pdf -l ${outfile}
done
