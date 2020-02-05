import librouteros
while True:
    try: librouteros.connect('127.0.0.1','admin','')
    except (ConnectionRefusedError): 
        print('skip connect' + '\n')
        continue
    else: 
        break