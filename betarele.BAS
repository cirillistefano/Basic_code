DECLARE SUB PlotLine (x1, y1, x2, y2, colore)
DECLARE SUB Switch (x, y)

DEFINT A-Z
DIM SHARED dx
DIM SHARED dy
DIM SHARED a!
DIM SHARED b!
DIM SHARED x, y


SCREEN 12
LINE (50, 100)-(50, 160), 4
CALL PlotLine(180, 20, 180, 170, 6)
CALL PlotLine(135, 55, 180, 25, 9)
CALL PlotLine(8, 118, 150, 90, 10)
CALL PlotLine(20, 35, 60, 105, 7)

SUB PlotLine (x1, y1, x2, y2, colore)
    IF ABS(x1 - x2) > ABS(y1 - y2) THEN
        IF x1 > x2 THEN
            CALL Switch(x1, x2)
            CALL Switch(y1, y2)

        END IF
        dx = (x2 - x1)
        dy = (y2 - y1)
        IF dx <> 0 THEN
            b! = dy / dx
        ELSE
            b! = 0
        END IF

        a! = y1 - x1 * b!
        FOR x = x1 TO x2
            y = INT((((a! + x * b!) + .05) * 10) / 10)
            PSET (x, y), colore
        NEXT x





    ELSE
        IF y1 > y2 THEN
            CALL Switch(y1, y2)
            CALL Switch(x1, x2)
        END IF
        dx = (x2 - x1)
        dy = (y2 - y1)
        IF dx <> 0 THEN
            b! = dy / dx
        ELSE
            b! = 0
        END IF


        a! = y1 - x1 * b!


        FOR y = y1 TO y2
            IF b! <> 0 THEN
                x = INT(((((y - a!) / b!) + .05) * 10) / 10)
            ELSE
                x = x1
            END IF
            PSET (x, y), colore
        NEXT y

    END IF










END SUB
SUB Switch (x, y)
    t = x
    x = y
    y = t

END SUB

