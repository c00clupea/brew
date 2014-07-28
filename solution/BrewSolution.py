__author__ = 'sec15334'
__version__ = '1.0.0.0'

import code
import readline
import rlcompleter
import sys

import XSSFlaws as xss
import SQLFlaws as sql

plugins = ['xss','sql']


def print_ascii():
    print "#     #                         The Munich IT-Security Research Group"
    print "##   ## #    #  ####  ######    presents"
    print "# # # # #    # #      #         "
    print "#  #  # #    #  ####  #####     the"
    print "#     # #    #      # #         "
    print "#     # #    # #    # #         "
    print "#     #  ####   ####  ######    BREW SOLUTION"

def index_help():
    print 'Welcome to BREW '
    print 'use [name].help() for commands'
    print 'plugins: '+str(plugins)

if __name__ == '__main__':
    vars = globals()
    vars.update(locals())
    readline.set_completer(rlcompleter.Completer(vars).complete)
    readline.parse_and_bind("tab: complete")
    shell = code.InteractiveConsole(vars)
    print("Welcome to BREW MasterSolution "+__version__)
    print("Type index_help() to see available tools")
    print_ascii()
    print index_help()
    shell.interact()