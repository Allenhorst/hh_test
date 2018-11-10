from sqlalchemy.orm import sessionmaker

from server.CreateDatabase import engine
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy import MetaData, create_engine
from app.base.models import *
from config import ProductionConfig

"""
Заполняет таблицу. В данный момент создаёт один пользователь (администратор) и для него создаётся объект. 
"""
Session = sessionmaker(bind=engine)
session = Session()

root_user = User()
root_user.fill_class('admin', 'test@ya.ru', '123456')
root_object = ObjectsS()
root_object.fill_class(1, 2, 'test', 0, 55.09681, 36.61006)
root = [root_object, root_user]
session.add_all(root)
import os
dir_path = os.path.dirname(os.path.realpath(__file__))
print(dir_path)
f = open(dir_path+'/Сode.txt',encoding="Windows-1252")
for line in f:
    code = [x.strip() for x in line.split('|')]
    adem_code_id = AdemcoCode()
    adem_code_id.fill_class(code[0], code[1], code[2])
    session.add(adem_code_id)
session.commit()
session.close()
