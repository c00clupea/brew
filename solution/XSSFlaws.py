__author__ = 'sec15334'

from Utils import Flaw as fl
from Utils import FieldSolution as fs
from Utils import MethodHelp as mh



def help():
    search_help = mh('search_page','XSS searchpage')
    image_help = mh('image_library','XSS image lib')
    print search_help.print_help()
    return image_help.print_help()

def search_page():
    flaw = fl('XSS','http://localhost:8081/secu/search.secu','Possible XSS in search field')
    field = fs('searchfield','Not validated','--><b>problem</b>')
    flaw.fields.append(field)
    return flaw.printFlaw()


def image_library():
    flaw = fl('XSS','http://localhost:8081/secu/picturegallery.secu','Possible XSS in URI')
    field = fs('URI','Not validated','http://localhost:8081/secu/picturegallery.secu?pic=http://localhost:8081/secu/img/logo.png')
    flaw.fields.append(field)
    print flaw.printFlaw()


if __name__ == '__main__':
    xss_flaw = search_page()
    xss_flaw.printFlaw()