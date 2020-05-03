#!/bin/bash

PYTHON=python

set -e
set -x

GEN_NUMS="10 100 1000"


# ‘«‚µZ: 2Œ…, Œ…ã‚ª‚è‚È‚µ
for num in ${GEN_NUMS}
do
    outfile=add_hissan_2digit_no_carry_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t add \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '‚¨‚È‚Ü‚¦' \
  	--title '‘«‚µZ (2Œ…AŒ…ã‚ª‚è‚È‚µ)'
    ptex2pdf -l ${outfile}
done


# ‘«‚µZ: 2Œ…, Œ…ã‚ª‚è‚ ‚è
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
    	--name '‚¨‚È‚Ü‚¦' \
  	--title '‘«‚µZ (2Œ…AŒ…ã‚ª‚è)'
    ptex2pdf -l ${outfile}
done

# ‘«‚µZ: 3Œ…, Œ…ã‚ª‚è‚ ‚è
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
    	--name '–¼‘O' \
  	--title '‘«‚µZ (3Œ…AŒ…ã‚ª‚è)'
    ptex2pdf -l ${outfile}
done

# ˆø‚«Z: 2Œ…, Œ…‰º‚ª‚è‚È‚µ
for num in ${GEN_NUMS}
do
    outfile=sub_hissan_2digit_no_borrow_${num}.tex
    $PYTHON scripts/math_monkey.py \
    	-t sub \
    	-o ${outfile} \
    	-n ${num} \
    	--digits 2 \
	--min_digits 1 \
    	--name '‚¨‚È‚Ü‚¦' \
  	--title 'ˆø‚«Z (2Œ…AŒ…‰º‚ª‚è‚È‚µ)'
    ptex2pdf -l ${outfile}
done


# ˆø‚«Z: 2Œ…, Œ…‰º‚ª‚è‚ ‚è
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
    	--name '‚¨‚È‚Ü‚¦' \
  	--title 'ˆø‚«Z (2Œ…AŒ…‰º‚ª‚è‚ ‚è)'
    ptex2pdf -l ${outfile}
done

# ˆø‚«Z: 3Œ…, Œ…‰º‚ª‚è‚ ‚è
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
    	--name '–¼‘O' \
  	--title 'ˆø‚«Z (3Œ…AŒ…‰º‚ª‚è‚ ‚è)'
    ptex2pdf -l ${outfile}
done

# ‘«‚µZ: 7Œ… (“š‚¦•t‚«)
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
    	--name '–¼‘O' \
  	--title '‘«‚µZ (7Œ…)' \
	--answer
    ptex2pdf -l ${outfile}
done

# ˆø‚«Z: 7Œ… (“š‚¦•t‚«)
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
    	--name '–¼‘O' \
  	--title 'ˆø‚«Z (7Œ…)' \
	--answer
    ptex2pdf -l ${outfile}
done

# ‘«‚µZ: 16Œ… (“š‚¦•t‚«)
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
    	--name '–¼‘O' \
  	--title '‘«‚µZ (16Œ…)' \
	--answer
    ptex2pdf -l ${outfile}
done

# ˆø‚«Z: 16Œ… (“š‚¦•t‚«)
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
    	--name '–¼‘O' \
  	--title 'ˆø‚«Z (16Œ…)' \
	--answer
    ptex2pdf -l ${outfile}
done
