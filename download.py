import sys
import socket
import threading
import time
from subprocess import call

REMOTE_SERVER = "www.google.com"

def is_connected():
    try:
        host = socket.gethostbyname(REMOTE_SERVER)
        s = socket.create_connection((host, 80), 2)
        return True
    except:
        pass
    return False

class downloader (threading.Thread):

    def __init__(self):
        threading.Thread.__init__(self)
        self.running = True
        self.restart = False
        self.firsttime = True

    def stop(self):
        self.running = False

    def checkRestart(self):
        if (self.firsttime == True):
            self.firsttime = False
            return True

        if (self.restart == True):
            self.restart = False
            return True
        return False

    def run(self):
        while self.running:
            connected = is_connected()
            if (connected == False):
                print("\nInternet Connection Failed. Restarting...\n")
                self.restart = True
                call(["killall", sys.argv[1]]);
            time.sleep(1)

if (len(sys.argv) > 1):
    check = downloader()
    check.start()

    print("Starting Download...\n")

    while(check.checkRestart()):
        call(sys.argv[1:])

    check.stop()
    check.join()
else:
    print("Please enter a command you want to have executed.")
