import os
import socket
import sys
import threading
import queue
import time
os.system("cls"),
os.system("mode con lines=22 cols=38"),
os.system("rem IPV4_DOWNED"),
os.system("title PORT SCANNER"),
os.system("rem REMADE by @IPV4_DOWNED"),

common_ports = {
    "21": "FTP",
    "22": "SSH",
    "23": "Telnet",
    "25": "SMTP",
    "53": "DNS",
    "80": "HTTP",
    "194": "IRC",
    "443": "HTTPS",
    "3306": "MySQL",
    "25565": "Minecraft"
}

def get_scan_args():
    if len(sys.argv) == 2:
        return (sys.argv[1], 0, 1024)
    elif len(sys.argv) == 3:
        return (sys.argv[1], 0, int(sys.argv[2]))
    elif len(sys.argv) == 4:
        return (sys.argv[1], int(sys.argv[2]), int(sys.argv[3]))

def is_port_open(host, port): #Return boolean
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(0.5)
        sock.connect((host, port))
    except socket.error:
        return False
    return True
print("[40;33m======================================")
print("[40;31m      ____  ____  ____  ___________")
print("[40;31m     / __ \/ __ \/ __ \/_  __/ ___/")
print("[40;31m    / /_/ / / / / /_/ / / /  \__ \ ")
print("[40;31m   / ____/ /_/ / _, _/ / /  ___/ / ")
print("[40;31m  /_/    \____/_/ |_| /_/  /____/  ")
print("")
print("[40;33m======================================")
print("")
def scanner_worker_thread(host):
    while True:
        port = port_queue.get()
        if is_port_open(host, port):
            if str(port) in common_ports:
                print("      [40;37m{} [40;31m([40;33m{}[40;31m) [40;32mis OPEN PORT!                  ".format(str(port), common_ports[str(port)]))
            else:
                print("      [40;37m{} [40;32mis OPEN PORT!   [40;36m                   ".format(port))
                print("      [40;33mALL OTHER PORTS ARE CLOSED")
                print("             [40;33mIF NOT SHOWN")
        port_queue.task_done()



scan_args = get_scan_args()
port_queue = queue.Queue()
for _ in range(20):
    t = threading.Thread(target=scanner_worker_thread, kwargs={"host": scan_args[0]})
    t.daemon = True
    t.start()

start_time = time.time()
for port in range(scan_args[1], scan_args[2]):
    port_queue.put(port)

port_queue.join()
end_time = time.time()
print("")
print("      [40;37mScanning Time {:.3f} seconds.".format(end_time - start_time))
os.system("pause >nul"),
print("exit"),