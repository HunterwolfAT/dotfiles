import socket
import threading
import time
from subprocess import call

REMOTE_SERVER = "www.google.com"
restart = True

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
                call(["killall", "youtube-dl"]);

url = input("Enter URL of YouTube Video to Download:\n")

check = downloader()
check.start()

print("Starting Download...\n")

while(check.checkRestart()):
    restart = False
    call(["youtube-dl", url])

check.stop()
check.join()
