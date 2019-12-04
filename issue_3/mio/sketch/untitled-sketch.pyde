# 2018-07-25 processing.py sketch
# License: CC0


import time, datetime

# Settings
canvasW = 250
canvasH = 500
imgPrefix = ""
imgDateFormat = "%Y%m%d%H%M%S"
imgExt = "png"

def setup():
    size(canvasW, canvasH)
    background(255)
    drawLines()
    save(imgPrefix + timestamp(imgDateFormat) + "." + imgExt)

def timestamp(fmt):
    ts = time.time()
    return datetime.datetime.fromtimestamp(ts).strftime(fmt)

def drawLines():
    # Minimum 5 lines
    lineCt = int(random(5, canvasW * canvasH * 0.001))
    for i in range(lineCt):
        # Shades of red, optional alpha
        redVal = random(250)
        gbVal = redVal / random(5)
        while gbVal >= redVal:
            gbVal = redVal / random(5)
        alphaVal = 255

        # Line weight
        strokeWeight(random(lineCt * 0.5))

        # Line coords
        x1 = random(canvasW)
        y1 = random(canvasH)
        x2 = random(canvasW)
        y2 = random(canvasH)
        while x2 == x1:
            x2 = random(canvasW)
        while y2 == y1:
            y2 = random(canvasH)

        stroke(redVal, gbVal, gbVal, alphaVal)
        line(x1, y1, x2, y2)
