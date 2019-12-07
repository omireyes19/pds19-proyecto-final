#!/usr/bin/python
from configparser import ConfigParser
 
def config(filename='database.ini', section='postgresql'):
    # creamos parser
    parser = ConfigParser()
    # leemos config file
    parser.read(filename)
 
    # la sección default del archivo leido
    db = {}
    
    # checamos si la seccion (postgresql) existe en el parser
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
         
    # error si falta algun parametro
    else:
        raise Exception('Section {0} no encontrado en el file {1}'.format(section, filename))
 
    return db
