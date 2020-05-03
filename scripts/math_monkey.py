#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""Generate various math column addition worksheet
"""
import argparse
from collections import namedtuple
from jinja2 import Environment, FileSystemLoader
import os
from pprint import pprint
import random
import sys

from column_decimal import ColumnDecimal


def add_math_params(parser):
    parser.add_argument('-t', '--type', choices=['add', 'sub'],
                        help='Select problem type', default='add')
    parser.add_argument('--digits', action='store', type=int, metavar='num',
                        help='Max digits', default=2)
    parser.add_argument('--min_digits', action='store', type=int, metavar='num',
                        help='Min digits. (Set to --digits if omitted)')
    parser.add_argument('--num_augend', action='store', type=int, metavar='num',
                        help='Number of arugend', default=2)
    parser.add_argument('--inc_carry_over', action='store_true',
                        help='Include carry over math', default=False)
    parser.add_argument('--only_carry_over', action='store_true',
                        help='Generated math must have at least one carry over', default=False)
    parser.add_argument('--exc_digits_incr', action='store_true',
                        help='Exclude math results in +1 digit number', default=False)


def check_math_params(parser, args):
    """Check math option validity"""
    if args.digits > 16 or args.digits <= 0:
        parser.error(f"--digits {args.digits} is not in the range [1, 16]")

    if args.num_augend > 20 or args.num_augend <= 1:
        parser.error(f"--num_augend {args.num_augend} is not in the range [2,20]")

    if args.only_carry_over:
        args.inc_carry_over = True


def gen_random_add(args):
    """Geenrate random addition"""

    min_digits = args.min_digits or args.digits

    max_num = 10**args.digits - 1
    min_num = 10**(min_digits - 1)

    nums = None
    while True:
        nums = [ColumnDecimal(random.randrange(min_num, max_num)) for _ in range(args.num_augend)]
        c = sum(nums)
        carry_over = ColumnDecimal.GetCarry(c, *nums)

        if args.exc_digits_incr and len(carry_over) > args.digits:
            continue

        if not args.inc_carry_over and 1 in carry_over:
            continue

        if args.only_carry_over and 1 not in carry_over:
            continue

        break

    print(' + '.join([str(k) for k in nums]) + f' = {sum(nums)}')
    Problem = namedtuple('Problem', ['answer', 'nums'])
    return Problem(answer=sum(nums), nums=nums)


def gen_random_sub(args):
    """Geenrate random subtraction"""

    min_digits = args.min_digits or args.digits

    max_num = 10**args.digits - 1
    min_num = 10**(min_digits - 1)

    nums = None
    while True:
        first = ColumnDecimal(random.randrange(min_num, max_num))
        if first.num == min_num:
            continue

        nums = [ColumnDecimal(random.randrange(min_num, first.num)) for _ in range(args.num_augend-1)]
        c = first - sum(nums)
        if (c.num < 0):
            continue

        borrow_flag = ColumnDecimal.GetBorrow(c, first, *nums)

        if not args.inc_carry_over and 1 in borrow_flag:
            continue

        if args.only_carry_over and 1 not in borrow_flag:
            continue

        break

    print(' - '.join([str(k) for k in [first] + nums]) + f' = {c.num}')
    Problem = namedtuple('Problem', ['answer', 'nums'])
    return Problem(answer=first - sum(nums), nums=[first] + nums)


def generate_problem(args):
    if args.type == 'add':
        problems = [gen_random_add(args)
                    for _ in range(args.num_problem)]
    elif args.type == 'sub':
        problems = [gen_random_sub(args)
                    for _ in range(args.num_problem)]
    else:
        assert False, f"Unknown type: {args.type}"
    return problems


def add_doc_params(parser):
    parser.add_argument('--title', action='store', metavar='string',
                        help='Title of the generated worksheet')
    parser.add_argument('--name', action='store', metavar='string',
                        help='Name field text')
    parser.add_argument('-n', '--num_problem', action='store',
                        type=int, metavar='num', required=True,
                        help='Number of problem to be generated')
    parser.add_argument('--answer', action='store_true', default=False,
                        help='Print answer pages at the end')


def set_params(args):
    type2op = {'add': '+', 'sub': '-'}

    params = {
        'title': args.title or 'Math Monkey',
        'name': args.name or 'Name',
        'digits': args.digits,
        'op': type2op[args.type],
        'answer': args.answer,
    }

    if args.num_augend > 11:
        params['digits'] += 1

    return params


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('-o', '--output', action='store', metavar='file',
                        help='Output tex file name', required=True)

    add_doc_params(parser)
    add_math_params(parser)

    args = parser.parse_args()

    check_math_params(parser, args)

    problems = generate_problem(args)

    loader = FileSystemLoader(searchpath=[os.path.join(os.path.dirname(__file__), '..', 'data')])
    env = Environment(loader=loader)

    template = env.get_template('column_addition.tex.j2')

    params = set_params(args)
    params['problems'] = problems

    tex_txt = template.render(params)
    with open(args.output, 'wb') as fo:
        fo.write(tex_txt.encode('utf-8'))

    print(f"Output result to {args.output}")
    print(f"Command example to convert to pdf: ptex2pdf -l {args.output}")


if __name__ == "__main__":
    sys.exit(main())
