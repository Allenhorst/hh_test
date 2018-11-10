# Author: Liskunov Roman (liskunov.roma@yandex.ru)

# Version: 1.0
# Created: 28/09/18

"""
Создаёт базу данных. Проверяет существует ли она. Если нет, то создаёт.
В процессе создания базы данных проверяет существуют ли таблицы. Если нет, то создаёт.
"""
import sys
sys.path.append('../')
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy import MetaData, create_engine
from app.base.models import *
from config import ProductionConfig

engine = create_engine(ProductionConfig.SQLALCHEMY_DATABASE_URI, echo=False)
db.metadata.create_all(engine)
metadata = MetaData(engine)
metadata.create_all()
import server.FillDatabase
