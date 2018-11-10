import socket
import time
import datetime
from sqlalchemy.orm import sessionmaker
from sqlalchemy import Column, Integer, String, BLOB, REAL
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.declarative import DeclarativeMeta
from sqlalchemy import MetaData, create_engine
from os import environ


class MessageETHContactID():
    __tablename__ = "Message_ETH_ContactID"

    id = Column(Integer, primary_key=True)
    message = Column(String(120))
    user_id = Column(Integer)
    device_uid_id = Column(String(120))
    object_number = Column(Integer)
    type_message = Column(Integer)
    contact_code = Column(Integer)
    razdel_number = Column(Integer)
    zone_number = Column(Integer)
    time_stamp = Column(String(120))

    def fill_class(self, message, user_id, device_uid_id, object_number, type_message, contact_code, razdel_number,
                   zone_number, time_stamp):
        self.message = message
        self.user_id = user_id
        self.device_uid_id = device_uid_id
        self.object_number = object_number
        self.type_message = type_message
        self.contact_code = contact_code
        self.razdel_number = razdel_number
        self.zone_number = zone_number
        self.time_stamp = time_stamp

    def __init__(self, **kwargs):
        for attribute, value in kwargs.items():
            # depending on whether value is an iterable or not, we must
            # unpack it's value (when **kwargs is request.form, some values
            # will be a 1-element list)
            if hasattr(value, '__iter__') and not isinstance(value, str):
                # the ,= unpack of a singleton fails PEP8 (travis flake8 test)
                value = value[0]
            setattr(self, attribute, value)

    def __repr__(self):
        return self

    def to_json(self):
        return json.dumps(self, cls=AlchemyEncoder)




host = '0.0.0.0'
port = 10008
serv_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, proto=0)
serv_sock.bind((host, port))
serv_sock.listen(10)
""":param backlog - размер очереди входящих подключений"""


SQLALCHEMY_DATABASE_URI = 'postgresql://{}:{}@{}:{}/{}'.format(
        environ.get('GENTELELLA_DATABASE_USER', 'postgres'),
        environ.get('GENTELELLA_DATABASE_PASSWORD', 'postgres'),
        environ.get('GENTELELLA_DATABASE_HOST', 'db'),
        environ.get('GENTELELLA_DATABASE_PORT', 5432),
        environ.get('GENTELELLA_DATABASE_NAME', 'ivs')
    )

engine = create_engine(SQLALCHEMY_DATABASE_URI, echo=False)
Session = sessionmaker(bind=engine)
session = Session()

while True:
    # Бесконечно обрабатываем входящие подключения
    client_sock, client_addr = serv_sock.accept()
    print('Connected by', client_addr)
    try:
        while True:  # Пока клиент не отключился, читаем передаваемые им данные и отправляем их обратно
            data = client_sock.recv(1024)
            client_sock.settimeout(60)
            if not data:  # Клиент отключился
                break
            if len(data) < 20:
                continue
            else:
                data = data.decode('utf-8')
                object_number = int(data[7:11])
                type_message = 0
                if data[11] == 'E' or data[11] == '1':
                    type_message = 1
                if data[11] == 'R' or data[11] == '3':
                    type_message = 3
                if data[11] == '6':
                    type_message = 6
                contact_code = int(data[12:15])
                razdel_number = int(data[15:17])
                zone_number = int(data[17:20])
                time_stamp = datetime.datetime.fromtimestamp(time.time()).strftime('%d-%m-%Y %H:%M:%S')
                message_eth_contactID = \
                    MessageETHContactID(data, 1, 0,
                                        object_number, type_message, contact_code, razdel_number,
                                        zone_number, time_stamp)
                #  Отправка в бд
                session.add(message_eth_contactID)
                session.commit()
                text = b'\x06\x0D\x0A'
                client_sock.sendall(text)
                # client_sock.close()
    except socket.error:
        client_sock.close()
