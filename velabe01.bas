
Data 1,1,1,14,14,14,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
Data 1,1,1,14,14,14,14,14,14,14,14,14,14,14,14,14,1,1,1,1
Data 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
Data 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
Data 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1
Data 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,1,1,1
Data 3,7,3,7,3,3,7,3,7,3,3,7,3,3,3,7,3,3,7,3
Data 3,7,3,7,3,3,7,3,7,3,3,7,3,3,3,7,3,3,7,3



DECLARE SUB PlotLine (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, colore AS INTEGER)
DECLARE SUB Switch (x AS INTEGER, y AS INTEGER)
DECLARE SUB PlotRotta (StartX, StartY, x, y, z)
' $DYNAMIC
Randomize Timer
Dim Shared winddirezione#
Dim Shared accelerazione#
Dim Shared Pascal As Double


'DIM SHARED Sea(4) AS INTEGER
DefInt A-Z
Dim Shared barca%(500)
Dim Shared bg(500)
Type ship
    PruaX As Integer
    PruaY As Integer
    sailarea As Double
End Type
Type windtype
    direzione As Double
    forza As Integer
    velocita As Double
End Type
Type andatura
    angolo As Double
End Type



'DIM SHARED bolina AS andatura
'DIM SHARED poppa AS andatura
Dim Shared center As ship
center.sailarea = 300
Dim Shared left As ship
left.sailarea = 100
Dim Shared right As ship
right.sailarea = 100
Dim Shared pi#
Dim Box%(1 To 200)
Dim Shared N As windtype
N.direzione = 6.28
N.forza = Int(Rnd * 7) + 1
Dim Shared NE As windtype
NE.direzione = .78
NE.forza = Int(Rnd * 7) + 1
Dim Shared E As windtype
E.direzione = 1.57

E.forza = Int(Rnd * 7) + 1
Dim Shared SE As windtype
SE.direzione = 2.35
SE.forza = Int(Rnd * 7) + 1
Dim Shared S As windtype
S.direzione = 3.14
S.forza = Int(Rnd * 7) + 1
Dim Shared SW As windtype
SW.direzione = 3.92
SW.forza = Int(Rnd * 7) + 1
Dim Shared W As windtype
W.direzione = 4.71
W.forza = Int(Rnd * 7) + 1
Dim Shared NW As windtype
NW.direzione = 5.49
NW.forza = Int(Rnd * 7) + 1








pi# = 3.14159
Screen 12
View (0, 0)-(600, 470), 1, 9
Color 10, 1
'disegna il campo di regata
For i = 1 To 600 Step 20
    Call PlotLine(1, i, 600, i, 7)
Next i
For i = 1 To 600 Step 20
    Call PlotLine(i, 1, i, 470, 7)
Next i

'LINE (x, y)-(x + 635, y + 475), 9, BF
'La direzione del vento
Circle (520, 50), 25, 4
Paint (540, 50), 3, 4
Circle (520, 50), 20, 10
t = .78
For i = 1 To 40
    PSet (520 + i * -Sin(t), 50 + i), 14
Next i
Sleep 10






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
wind.direzione# = .78
wind.forza = 14
wind.velocita# = .5 * wind.forza
ship.sailarea = 120
'REM La riga seguente calcola la pressione del vento sulla vela x mq
Pascal# = (wind.velocita# ^ 2) * .613
angolodibolina# = wind.direzione# + .78
dx# = angolodibolina#

'der# = Sin(angolodibolina#)


Rem F=m*a quindi a=F/m
accelerazione# = (Pascal# * ship.sailarea) / 1000

'CALL PlotRotta(20, 20, .78, 10, 100)

'For z = 1 To 26
'For j = 1 To 20
'Read DotColor
'PSet (200 + j, 100 + z), DotColor
'Next j
'Next z
'Debug informations
Print "Wind Speed"; wind.forza; "knots"
Print Using "##.####^^^^"; angolodibolina#
Print Using "##.####^^^^"; accelerazione#
'Differenziale
der# = accelerazione# / angolodibolina#
Print Using "##.####^^^^"; der#

'PRINT POINT(2)
'PRINT POINT(3)
z = Abs(der#)
Print z
Screen 12
y = 200

Call PlotLine(10, 200, der# * 100, 200 + (angolodibolina# * 100), 12)



'Call PlotRotta(1, 100, 101, 150, 7)


Sleep





Sub PlotLine (x1, y1, x2, y2, colore)
    DefInt A-Z
    Dim a, b As Double
    If Abs(x1 - x2) > Abs(y1 - y2) Then
        If x1 > x2 Then
            Call Switch(x1, x2)
            Call Switch(y1, y2)


        End If
        dx = (x2 - x1)
        dy = (y2 - y1)
        If dx <> 0 Then
            b# = dy / dx
        Else
            b# = 0
        End If
        a# = y1 - x1 * b#
        For x = x1 To x2
            y = Int((((a# + x * b#) + .05) * 10) / 10)
            PSet (x, y), colore
        Next x





    Else
        If y1 > y2 Then
            Call Switch(y1, y2)
            Call Switch(x1, x2)
        End If
        dx = (x2 - x1)
        dy = (y2 - y1)
        If dx <> 0 Then
            b# = dy / dx
        Else
            b# = 0

        End If


        a# = y1 - x1 * b#


        For y = y1 To y2
            If b# <> 0 Then
                x = Int(((((y - a#) / b#) + .05) * 10) / 10)
            Else
                x = x1
            End If
            PSet (x, y), colore
        Next y

    End If










End Sub

Sub Switch (x, y)
    t = x
    x = y
    y = t

End Sub
Sub PlotRotta (StartX, StartY, x, y, z)


    Print Using "##.####^^^^"; accelerazione#
    Call PlotLine(Sin(angolodibolina) * StartX * accelerazione#, Cos(angolodibolina) * StartY * accelerazione#, x, y, z)




End Sub




