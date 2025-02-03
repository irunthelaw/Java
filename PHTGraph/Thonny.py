import board
import time
from adafruit_ms8607 import MS8607
pht = MS8607(i2c)
i2c = board.I2C()
while True:
      print(pht.pressure, ", ", (int(pht.relative_humidity * 100) / 100) ,", ",  (int(((9/5) * pht.temperature + 32) * 100)) / 100)
      time.sleep(5)
