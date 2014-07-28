__author__ = 'sec15334'

class MethodHelp():
    def __init__(self, method_name, desc):
        self.method_name = method_name
        self.desc = desc

    def print_help(self):
        print 'method: '+self.method_name+'()'
        print 'desc: '+self.desc


class FlawHelp():
    def __init__(self, flawName, methods):
        self.flawName = flawName
        self.methods = methods

    def print_help(self):
        print 'FlawName: '+self.flawName
        for method in self.methods:
            print 'Method: '

class Flaw():
    def __init__(self,flawname,apge,message):
        self.flawname = flawname
        self.page = apge
        self.message = message
        self.fields = []

    def printFlaw(self):
        print 'Flaw: '+self.flawname
        print 'Page: '+self.page
        print 'Message: '+self.message
        for field in self.fields:
            field.printsolution()

class FieldSolution():
    def __init__(self,field,problem,inject):
        self.field = field
        self.problem = problem
        self.inject = inject

    def printsolution(self):
        print 'field: '+self.field
        print 'inject: ['+self.inject+']'
        print 'problem: '+self.problem



