# # -*- coding: utf-8 -*-

class One():
    def __init__(self):
        self.first = 1
        self.last = 9
    def Half(self):
        return [self.first,self.last]
class Two():
    def __init__(self):
        self.white = 'White'
        self.black = 'Black'

    def Color(self):
        return [self.white,self.white]

class Example(object):
    def __init__(self):
        super(Example, self).__init__()

        self.numberone = One()
        self.numbertwo = Two()
        self.uno = self.numberone.first
        self.blanco = self.numbertwo.white
        self.numeros = self.numberone.Half()
        self.colores = self.numbertwo.Color()

    def printer(self):
        print [self.numberone.first,self.numbertwo.white]
        print [self.numeros,self.colores]


Instance = Example()
Instance.printer()
