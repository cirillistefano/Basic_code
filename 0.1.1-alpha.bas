$Debug



Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
Data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
















declare Sub sprite (x%, y%, file$)
declare Sub PUT2 (Sprite() As Integer, XSize As Integer, YSize As Integer, X As Integer, Y As Integer)
declare Function Round(Num!, Decimals% ) as integer
declare function findDistance(o_x as single, o_y as single, d_x as single, d_y as single)
declare Function CircleRect (circle_x%, circle_y%, circle_rad%, r1x%, r1y%, r1w%, r1h%, )
'declare function rectCircle(r1x%,r1y%,r1w%,r1h%,circle_x%,circle_y%,circle_rad%)
declare sub PlayAI()
declare sub BestPath()
DECLARE FUNCTION rectRect% (r1x%, r1y%, r1w%, r1h%, r2x%, r2y%, r2w%, r2h%)
DECLARE FUNCTION rectRect2% (r1x%, r1y%, r1w%, r1h%, r2x%, r2y%, r2w%, r2h%)
DECLARE SUB PlotLine (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, colore AS INTEGER)
DECLARE SUB Switch (x AS INTEGER, y AS INTEGER)
DECLARE SUB PlotRotta (StartX, StartY, x, y, z)
DECLARE SUB UpdateKeys (k())


' $DYNAMIC
Randomize Timer
'Dim Shared winddirezione!
Dim Shared accelerazione!
'Dim Shared Pascal As Single
'Dim Shared kb(128) As Integer, lastk As Integer
'Dim Shared kbleft As Integer, kbright As Integer, kbesc As Integer

'Const true = 1: false = 0



'DIM SHARED Sea(4) AS INTEGER
DefInt A-Z

Dim Shared bg(1)
Type ship
    PruaX As Integer
    PruaY As Integer
    sailarea As Double
    timoneangle As Double
End Type
Type windtype
    direzione As Single
    forza As Single
    velocita As Single
End Type
Type andatura
    direzione As Integer
End Type
Type timone
    angolo As Double
End Type
Type boatype
    boa_x As Integer
    boa_y As Integer
    radius As Integer
End Type
Dim keys(127)
Dim Shared boa As boatype
Dim Shared wind As windtype
Dim Shared barra As timone
Dim Shared bolina As andatura
Dim Shared poppa As andatura
Dim Shared pi!
Dim Shared angle
'Dim Shared barca%(43, 48)
'Dim Boa%(1 To 32)
'Dim Barca%(19, 25)
'Dim Barca2%(19, 25)
Dim barca%(531)
Dim barca1%(531)
Dim Mask%(19, 25)
pi! = 3.14159
Dim c!(360), s!(360)
For i = 1 To 360
    c!(i) = Cos(i * 3.14 / 180)
    s!(i) = Sin(i * 3.14 / 180)
Next
Const TRUE = -1
Const FALSE = 0

'Dim Timone&
'Timone& = _LoadImage("timone.png", 32)
'Screen Timone&
'Sleep 5
'Cls

'setting the screen
'Screen 12
Screen _NewImage(800, 600, 256)
View (0, 0)-(790, 595), 1, 9

Line (10, 10)-(790, 595), 2, B
'Color 10, 1
'Disegna la direzione del vento
Circle (720, 50), 15, 4
Paint (710, 50), 3, 4
Circle (720, 50), 10, 10
t = Atn(315)
For i = 1 To 30
    PSet (720 + i * -Sin(t), 50 + i), 14
Next i
'Disegna il timone

Circle (650, 50), 30, 6
Circle (650, 50), 29, 6
Circle (650, 20), 5, 2

Sleep 10

'Reading data from the sprites
For Z = 0 To 25
    For j = 0 To 19

        Read Mask%(j, Z)
        'PSet (10 + j, 230 + Z), 255
    Next j
Next Z
' End of sprites


wind.direzione! = Atn(315) '
Print wind.direzione!
Sleep 10
wind.forza! = 13
wind.velocita! = .5 * wind.forza
ship.sailarea = 20
'REM La riga seguente calcola la pressione del vento sulla vela x mq
Pascal! = (wind.velocita! ^ 2) * .613
angolodibolina! = wind.direzione! + .66
barra.angolo = angolodibolina!

Rem F=m*a quindi a=F/m
accelerazione! = (Pascal! * ship.sailarea) / 154

'Debug informations
Print "Wind Speed"; wind.forza; "knots"
Print Using "##.####^^^^"; angolodibolina!
Print Using "##.###^^^^"; accelerazione!
'Differenziale
der! = accelerazione! / angolodibolina!
Print Using "##.###^^^^"; der!



bolina.direzione = TRUE
'Barca 1
x% = 25
y% = 295
w% = 20
h% = 26
'Barca 2
x2% = 25
y2% = 319
w2% = 20
h2% = 26
'
rx% = 30
ry% = 30
rh% = 785
rw% = 585
boa.boa_x = 650
boa.boa_y = 295
boa.radius = 10
'Line (rx%, ry%)-(rh%, rw%), 6, B
'Call PlotLine(65, 10, 520, 10, 7)
'Call PlotLine(65, 420, 520, 420, 7)
Circle (boa.boa_x, boa.boa_y), boa.radius, 5
'Call PlotLine(65, 10, 65, 50, 7)
'Call PlotLine(65, 50, 520, 50, 7)
'Call PlotLine(520, 10, 520, 50, 7)


lastx% = 0
lasty% = 0
lastw% = 0
lasth% = 0
lastx1% = 0
lasty1% = 0
lastw1% = 0
lasth1% = 0
Def Seg = VarSeg(barca%(0))
Def Seg = VarSeg(barca1%(0))
BLoad "BARCA01.PCX", VarPtr(barca%(0))
BLoad "BARCA02.PCX", VarPtr(barca1%(0))
Def Seg

dx = 1
dy = 1
Call sprite(x%, y%, "BARCA01.PCX")
Call sprite(x2%, y2%, "BARCA02.PCX")
'PUT2 Barca%(), 20, 26, x%, y%
'PUT2 Barca2%(), 20, 26, x2%, y2%

Do
    UpdateKeys keys() 'updates the keys array




    Sleep

    'PUT2 Barca%(), 20, 26, x, y
    'Wait &H3DA, 8
    px = x%
    py = y%
    p2x = x2%
    p2y = y2%

    PUT2 Mask%(), 20, 26, px, py
    PUT2 Mask%(), 20, 26, p2x, p2y
    Wait &H3DA, 8
    PSet (px, py - 10), 8
    PSet (p2x, p2y - 10), 10


    'Call Getkeys

    kb$ = InKey$

    If keys(75) Then

        'Print Using "##.####^^^^"; angolodibolina!
        'Print Using "##.####^^^^"; der!

        'barra.angolo = barra.angolo - .06

        angolodibolina! = Round((angolodibolina! - .03), 3)

        der! = Round((accelerazione! / angolodibolina!), 3)
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'PUT2 Barca%(), 60, 60, x + der!, y - angolodibolina!
        'If angolodibolina! <= .54 Then
        'angolodibolina! = angolodibolina! + 1.02
        'der! = (accelerazione! / (angolodibolina!))

        'Print angolodibolina!; ""; der!

        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))
        x% = Round((x% + (der! + Cos(angolodibolina!))), 0)
        y% = Round((y% - (der! + Sin(angolodibolina!))), 0)
        'Print Using "##.####^^^^"; angolodibolina!
        'Print Using "##.####^^^^"; der!
        'Print angolodibolina!
        'PUT2 Barca%(), 20, 26, x, y
        'Wait &H3DA, 8


    End If
    If keys(77) Then

        angolodibolina! = Round((angolodibolina! + .03), 3)
        der! = Round((accelerazione! / angolodibolina!), 3)
        x% = x% + (der! + Cos(angolodibolina!))
        y% = y% + (der! + Sin(angolodibolina!))
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'PSet (Point(0) + der!, Point(1) + (angolodibolina!))
        'PUT2 Barca%(), 20, 26, x, y
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'Print angolodibolina!; ""; der!
        'der! = (accelerazione! \ Abs(angolodibolina!))

    End If
    If keys(72) Then
        'temp1! = angolodipoppa!
        angolodipoppa! = Round((wind.direzione!), 3)

        'angolodibolina! = Round((angolodibolina! + .02), 3)
        der! = Round((accelerazione! / angolodipoppa!), 3)
        'der! = der! + .25
        x% = x% - (angolodipoppa! + Cos(angolodipoppa!))
        y% = y% + (der! + Sin(angolodipoppa!))

        'Print v!; ""; der!
        '        angolodibolina! = angolodibolina! * (-1)
        '       der! = Abs(accelerazione! \ (angolodibolina!))
        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))

        'der! = (accelerazione! \ Abs(angolodibolina!))
        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))

    End If
    If keys(80) Then

        angolodipoppa! = Round((wind.direzione!), 3)
        'angolodibolina! = Round((angolodibolina! - .02), 3)
        der! = Round((accelerazione! / angolodipoppa!), 3)
        'der! = der! + .25
        x% = x% - (angolodipoppa! + Cos(angolodipoppa!))
        y% = y% - (der! + Sin(angolodipoppa!))

    End If

    If kb$ = "a" Then


        'barra.angolo = barra.angolo - .06
        angolodibolina! = Round((angolodibolina! - .02), 3)
        der! = Round((accelerazione! / angolodibolina!), 3)
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'PUT2 Barca%(), 60, 60, x + der!, y - angolodibolina!
        'If angolodibolina! <= .54 Then
        'angolodibolina! = angolodibolina! + 1.02
        'der! = (accelerazione! / (angolodibolina!))

        'Print angolodibolina!; ""; der!

        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))
        x2% = Round((x2% + (der! + Cos(angolodibolina!))), 0)
        y2% = Round((y2% - (der! + Sin(angolodibolina!))), 0)

        'x2% = x2% + der!
        'y2% = y2% - angolodibolina!
        'PUT2 Barca%(), 20, 26, x, y
        'Wait &H3DA, 8


    End If
    If kb$ = "d" Then
        angolodibolina! = Round((angolodibolina! + .02), 3)
        der! = Round((accelerazione! / angolodibolina!), 3)
        x2% = x2% + (der! + Cos(angolodibolina!))
        y2% = y2% + (der! + Sin(angolodibolina!))

        'x2% = x2% + der!
        'y2% = y2% + angolodibolina!
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'PSet (Point(0) + der!, Point(1) + (angolodibolina!))
        'PUT2 Barca%(), 20, 26, x, y
        'Wait &H3DA, 8: Wait &H3DA, 8, 8
        'Print angolodibolina!; ""; der!
        'der! = (accelerazione! \ Abs(angolodibolina!))

    End If
    If kb$ = "w" Then

        angolodipoppa! = Round((wind.direzione!), 3)

        der! = Round((accelerazione! / angolodipoppa!), 3)
        x2% = x2% - (angolodipoppa! + Cos(angolodipoppa!))
        y2% = y2% + (der! + Sin(angolodipoppa!))

        'x2% = x2% - angolodipoppa!
        'y2% = y2% + der!

        'Print v!; ""; der!
        '        angolodibolina! = angolodibolina! * (-1)
        '       der! = Abs(accelerazione! \ (angolodibolina!))
        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))

        'der! = (accelerazione! \ Abs(angolodibolina!))
        'PSet (Point(0) + der!, Point(1) - (angolodibolina!))
    End If
    If kb$ = "s" Then

        angolodipoppa! = Round((wind.direzione!), 3)

        der! = Round((accelerazione! / angolodipoppa!), 3)
        x2% = x2% - (angolodipoppa! + Cos(angolodipoppa!))
        y2% = y2% - (der! + Sin(angolodipoppa!))

    End If

    'Print angolodibolina!; ""; der!
    'PSet (Point(0) + angolodibolina!, Point(1) + der!)
    For i = 1 To 3000
    Next i

    Call sprite(x%, y%, "BARCA01.PCX")
    Call sprite(x2%, y2%, "BARCA02.PCX")

    'PUT2 Barca%(), 20, 26, x%, y%
    Wait &H3DA, 8
    'PUT2 Barca2%(), 20, 26, x2%, y2%
    'PSet (x, y), 9
    'Print "X"; x; "Y"; y
    If (lastx% <> x%) Or (lasty% <> y%) Or (lastw% <> w%) Or (lasth% <> h%) Then
        lastx% = x%
        lasty% = y%
        lastw% = w%
        lasth% = h%

        If rectRect%(x%, y%, 20, 26, rx%, ry%, rw%, rh%) = 1 Then
            hit$ = "HIT"
            Line (10, 10)-(790, 590), 4, B
            'Line (10, 10)-(580, 450), 7, B
        Else
            hit$ = "NO HIT"
            Line (10, 10)-(790, 590), 2, B

        End If
        If CircleRect(boa.boa_x, boa.boa_y, boa.radius, x%, y%, 20, 26) Then
            hit$ = "HIT"
            Circle (boa.boa_x, boa.boa_y), boa.radius, 7
        Else
            hit$ = "NO HIT"
            Circle (boa.boa_x, boa.boa_y), boa.radius, 5
        End If

        'Print hit$
    End If
    If (lastx1% <> x2%) Or (lasty1% <> y2%) Or (lastw1% <> w2%) Or (lasth1% <> h2%) Then
        lastx1% = x2%
        lasty1% = y2%
        lastw1% = w2%
        lasth1% = h2%

        If rectRect%(x2%, y2%, 20, 26, rx%, ry%, rw%, rh%) = 1 Then
            hit$ = "HIT"
            Line (10, 10)-(790, 590), 4, B
            'Line (10, 10)-(580, 450), 7, B
        Else
            hit$ = "NO HIT"
            Line (10, 10)-(790, 590), 2, B
        End If
        If CircleRect(boa.boa_x, boa.boa_y, boa.radius, x2%, y2%, 20, 26) Then
            hit$ = "HIT"
            Circle (boa.boa_x, boa.boa_y), boa.radius, 7
        Else
            hit$ = "NO HIT"
            Circle (boa.boa_x, boa.boa_y), boa.radius, 5
        End If
        'Print hit$
    End If
Loop Until keys(1) 'until ESC is pressed
'Loop Until kb$ = Chr$(27)
bolina.direzione = FALSE
poppa.direzione = TRUE

Print Using "##.####^^^^"; angolodibolina!
Print Using "##.####^^^^"; accelerazione!
Print Using "##.####^^^^"; der!

Print "Corrente posx"; Point(0)
Print "Corrente posy"; Point(1)
'x = 10
'y = 200
Print hit$
distx = Point(0) - x
disty = Abs(Point(1) - y)
'distanza! = Sqr(distx ^ 2 - disty ^ 2)
Print "Distanza percorsa: "; distanza!
End

Function rectRect% (r1x%, r1y%, r1w%, r1h%, r2x%, r2y%, r2w%, r2h%)

    ' are the sides of one rectangle touching the other?
    ' r1 right edge past r2 left
    ' r1 left edge past r2 right
    ' r1 top edge past r2 bottom
    ' r1 bottom edge past r2 top
    'If (r1x% + r1w% >= r2x%) And (r1x% <= r2x% + r2w%) And (r1y% + r1h% >= r2y%) And  Then
    '        If (r1x% + r1w% >= r2x%) And (r1x% <= r2x% + r2w%) And (r1y% + r1h% >= r2y%) And (r1y% <= r2y% + r2h%) Then
    If (r1y% + r1h% <= r2y%) Or (r1y% + r1h% > r2w%) Then

        rectRect% = 1
    Else
        rectRect% = 0
    End If
End Function

Function CircleRect (circle_x%, circle_y%, circle_rad%, r1x%, r1y%, r1w%, r1h%)
    test_x! = circle_x%
    test_y! = circle_y%



    If (circle_x% <= r1x%) Then
        test_x! = r1x%
    Else If (circle_x% >= r1x% + r1w%) Then
            test_x! = r1x% + r1w%
        End If
        If (circle_y% <= r1y%) Then
            test_y! = r1y%
        Else If (circle_y% >= r1y% + r1h%) Then
                test_y! = r1y% + r1h%
            End If
        End If


        distx! = circle_x% - test_x!
        disty! = circle_y% - test_y!
        distance! = Sqr((distx! * distx!) + (disty! * disty!))
        If distance! <= circle_rad% Then
            CircleRect = 1
        Else
            CircleRect = 0
        End If
    End If
End Function
Sub sprite (x%, y%, file$)


    Dim picture(32001) As Integer
    Def Seg = VarSeg(picture(0))
    BLoad file$, VarPtr(picture(0))
    For tempx% = 0 To picture(0) \ 8 - 1
        For tempy% = 0 To picture(1) - 1
            temp% = Peek(VarPtr(picture(2)) + tempx% + (picture(0) \ 8&) * tempy%)
            If temp% > 0 And tempx% + x% >= 0 And tempx% + x% < 800 And tempy% + y% >= 0 And tempy% + y% < 600 Then
                PSet (x% + tempx%, y% + tempy%), temp%
            End If
        Next
    Next
    Def Seg = &HA000
End Sub








'Print "Corrente posx"; PMap(der! * 100, 0)
'Print "Corrente posy"; PMap(200 + (angolodibolina! * 100), 1)





'Call PlotRotta(1, 100, 101, 150, 7)
Sub PUT2 (Sprites() As Integer, XSize As Integer, YSize As Integer, X As Integer, Y As Integer)
    ' Draw the sprite from the array onto the screen
    For YP = 0 To YSize - 1
        For XP = 0 To XSize - 1
            PSet (X + XP, Y + YP), Sprites%(XP, YP)
        Next XP
    Next YP
End Sub
Function findDistance (o_x As Single, o_y As Single, d_x As Single, d_y As Single)
    findDistance = Sqr((d_x - o_x) * (d_x - o_x) + (d_y - o_y) * (d_y - o_y))
End Function







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
            b! = dy / dx
        Else
            b! = 0
        End If
        a! = y1 - x1 * b!
        For x = x1 To x2
            y = Int((((a! + x * b!) + .05) * 10) / 10)
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
            b! = dy / dx
        Else
            b! = 0

        End If


        a! = y1 - x1 * b!


        For y = y1 To y2
            If b! <> 0 Then
                x = Int(((((y - a!) / b!) + .05) * 10) / 10)
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

Function Round (Num!, Decimals%)
    n = Num! * (10 ^ Decimals%)
    n = Sgn(n) * (Abs(Int(n + .5)))
    Round = n / (10 ^ Decimals%)
End Function
Sub UpdateKeys (k())
    Static lastPress
    press = Inp(96)

    If press < 128 Then 'when a key is pressed, the keyboard scan code is
        k(press) = TRUE 'returned. when released, the scan code + 128 is
        lastPress = press 'returned
    Else
        k(press - 128) = FALSE
        If press = 170 Then k(lastPress) = FALSE 'if 170 is returned, then
    End If 'last key that was pressed
    'should be released
    Def Seg = 0
    Poke 1052, Peek(1050) 'clears keyboard buffer (gets rid of beeping)
End Sub





