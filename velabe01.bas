
DATA 1,1,1,14,14,14,1,1,1,1,1,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
DATA 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
DATA 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
DATA 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
DATA 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1
DATA 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1
DATA 3,7,3,7,3,3,7,3,7,3,3,7,3,3,3,7,3,3,7,3
DATA 3,7,3,7,3,3,7,3,7,3,3,7,3,3,3,7,3,3,7,3



DECLARE SUB PlotLine (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, colore AS INTEGER)
DECLARE SUB Switch (x AS INTEGER, y AS INTEGER)
DECLARE SUB PlotRotta (StartX, StartY, x, y, z)
' $DYNAMIC
RANDOMIZE TIMER
DIM SHARED accelerazione#
DIM SHARED Pascal AS DOUBLE


'DIM SHARED Sea(4) AS INTEGER
DEFINT A-Z
DIM SHARED barca%(500)
DIM SHARED bg(500)
TYPE ship
    PruaX AS INTEGER
    PruaY AS INTEGER
    sailarea AS DOUBLE
END TYPE
TYPE windtype
    direzione AS DOUBLE
    forza AS INTEGER
    velocita AS DOUBLE
END TYPE
TYPE andatura
    angolo AS DOUBLE
END TYPE



'DIM SHARED bolina AS andatura
'DIM SHARED poppa AS andatura
DIM SHARED center AS ship
center.sailarea = 300
DIM SHARED left AS ship
left.sailarea = 100
DIM SHARED right AS ship
right.sailarea = 100
DIM SHARED pi#
DIM Box%(1 TO 200)
DIM SHARED N AS windtype
N.direzione = 6.28
N.forza = INT(RND * 7) + 1
DIM SHARED NE AS windtype
NE.direzione = .78
NE.forza = INT(RND * 7) + 1
DIM SHARED E AS windtype
E.direzione = 1.57

E.forza = INT(RND * 7) + 1
DIM SHARED SE AS windtype
SE.direzione = 2.35
SE.forza = INT(RND * 7) + 1
DIM SHARED S AS windtype
S.direzione = 3.14
S.forza = INT(RND * 7) + 1
DIM SHARED SW AS windtype
SW.direzione = 3.92
SW.forza = INT(RND * 7) + 1
DIM SHARED W AS windtype
W.direzione = 4.71
W.forza = INT(RND * 7) + 1
DIM SHARED NW AS windtype
NW.direzione = 5.49
NW.forza = INT(RND * 7) + 1








pi# = 3.14159
SCREEN 12
VIEW (0, 0)-(600, 470), 1, 9
COLOR 10, 1
'disegna il campo di regata
FOR i = 1 TO 600 STEP 20
    CALL PlotLine(1, i, 600, i, 7)
NEXT i
FOR i = 1 TO 600 STEP 20
    CALL PlotLine(i, 1, i, 470, 7)
NEXT i

'LINE (x, y)-(x + 635, y + 475), 9, BF
'La direzione del vento
CIRCLE (520, 50), 25, 4
PAINT (540, 50), 3, 4
CIRCLE (520, 50), 20, 10
t = .78
FOR i = 1 TO 40
    PSET (520 + i * -SIN(t), 50 + i), 14
NEXT i
SLEEP 10






'FOR i = 1 TO 580 STEP 20

'CALL PlotLine(1, i, 580, i, 7)


'NEXT i
'CALL PlotLine(18, 80, 18, 208, 4)
'CALL PlotLine(0, 0, 0, 440, 7)
'CALL PlotLine(0, 220, 600, 220, 7)
'CALL PlotLine(0, 440, 600, 440, 7)
'SLEEP 1
'CALL PlotLine(635, 1, 635 - 50, 1 + 50, 9)
'SLEEP 1
'CALL PlotLine(635, 1, 635 - 50, 1 + 50, 4)
'SLEEP 1
'CALL PlotLine(635, 1, 635 - 50, 1 + 50, 9)
'SLEEP 1
'CALL PlotLine(635, 1, 635 - 50, 1 + 50, 4)
'SLEEP 1
'CALL PlotLine(10, 460, 20, 10, 7)
wind.direzione = .78
wind.forza = 10
wind.velocita# = .5 * wind.forza
ship.sailarea = 120
'REM La riga seguente calcola la pressione del vento sulla vela x mq
Pascal# = (wind.velocita# ^ 2) * .613
'angolodibolina = wind.direzione + .78
'der = SIN(angolodibolina)


REM F=m*a quindi a=F/m
accelerazione# = (Pascal# * ship.sailarea) / 1000

'CALL PlotRotta(20, 20, .78, 10, 100)

FOR z = 1 TO 26
    FOR j = 1 TO 20
        READ DotColor
        PSET (200 + j, 100 + z), DotColor
    NEXT j
NEXT z



'PRINT POINT(2)
'PRINT POINT(3)


CALL PlotRotta(200, 100, 300, 150, 7)


SLEEP





SUB PlotLine (x1, y1, x2, y2, colore)
    DEFINT A-Z
    DIM a, b AS DOUBLE
    IF ABS(x1 - x2) > ABS(y1 - y2) THEN
        IF x1 > x2 THEN
            CALL Switch(x1, x2)
            CALL Switch(y1, y2)

        END IF
        dx = (x2 - x1)
        dy = (y2 - y1)
        IF dx <> 0 THEN
            b# = dy / dx
        ELSE
            b# = 0
        END IF
        a# = y1 - x1 * b#
        FOR x = x1 TO x2
            y = INT((((a# + x * b#) + .05) * 10) / 10)
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
            b# = dy / dx
        ELSE
            b# = 0

        END IF


        a# = y1 - x1 * b#


        FOR y = y1 TO y2
            IF b# <> 0 THEN
                x = INT(((((y - a#) / b#) + .05) * 10) / 10)
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
SUB PlotRotta (StartX, StartY, x, y, z)


    PRINT USING "##.####^^^^"; accelerazione#
    CALL PlotLine(StartX, StartY, x, y, z)




END SUB




