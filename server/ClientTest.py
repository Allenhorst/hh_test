import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('52.59.232.90', 10008))

i = 2
while i:
    sock.send(b'5000 180002R40010100 ')
    # 5000 180050E30500000
    sock.settimeout(60)  # установка таймаута
    data = sock.recv(1024)
    i -= 1
    print(data)
