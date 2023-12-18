'I've rearranged this file, originally it was a Turbo Pascal file
'Not as the LINE command in qbasic or qb64 does, it nicely Psets a line pixel by pixel.
DECLARE SUB PlotLine (x1 AS INTEGER, y1 AS INTEGER, x2 AS INTEGER, y2 AS INTEGER, colore AS INTEGER)
DECLARE SUB Switch (x AS INTEGER, y AS INTEGER)

DefInt A-Z
Dim Shared dx
Dim Shared dy
Dim Shared a!
Dim Shared b!
Dim Shared x, y


Screen 12
Line (50, 100)-(50, 160), 4
Call PlotLine(10, 20, 100, 70, 5)
Call PlotLine(135, 55, 180, 25, 9)
Call PlotLine(8, 118, 150, 90, 10)
Call PlotLine(20, 35, 60, 105, 7)

Sub PlotLine (x1, y1, x2, y2, colore)
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

END SUB

