import socket

from server.СreateDatabase import *
from server.ModelTable import MessageETHContactID
import time
import datetime
from sqlalchemy.orm import sessionmaker

host = '0.0.0.0'
port = 10008
serv_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM, proto=0)
serv_sock.bind((host, port))
serv_sock.listen(10)
""":param backlog - размер очереди входящих подключений"""

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
