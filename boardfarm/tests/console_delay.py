from boardfarm.devices import board
from boardfarm.tests import rootfs_boot


class DelayBetweenChar(rootfs_boot.RootFSBootTest):
    def runTest(self):
        board.delaybetweenchar = 0.1

        for console in board.consoles:
            console.delaybetweenchar = 0.1


class DelayBetweenCharExtreme(rootfs_boot.RootFSBootTest):
    def runTest(self):
        board.delaybetweenchar = 1
        for console in board.consoles:
            console.delaybetweenchar = 1


class NoDelayBetweenChar(rootfs_boot.RootFSBootTest):
    def runTest(self):
        board.delaybetweenchar = None
        for console in board.consoles:
            console.delaybetweenchar = None
