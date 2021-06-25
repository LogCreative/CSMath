import os

def hanoi (n, start ='1', step ='2', stop ='3'):
    ''' Solve the Hanoi tower with n disks , from start peg to stop peg , using step peg as a spool '''
    if n > 0:
        hanoi(n-1, start, stop, step)
        move(n, start, stop)
        hanoi(n-1, step, start, stop)
def move (n, start , stop):
    ''' Display move of disk n from start to stop '''
    print(" Disk %d: %s -> %s" % (n, start , stop))
if __name__ == '__main__':
    n = int(input('How many disks ? '))
    hanoi(n)