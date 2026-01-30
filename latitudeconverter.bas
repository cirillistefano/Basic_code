'$Debug
'-------------------------------------------------------------------------------------------------------------------------------------
' Convert every single y coordinates into a sessagesimal Latitude position.
' The function DecimalLatitudecalculate! has like parameter the y position, and returns the angle in decimal(distance from the "equatore" and relative angle).
' Passing this number as parameter to the function  NSLatitudeconverter$, it returns a string with the sessagesimal Latitude position.
' ------------------------------------------------------------------------------------------------------------------------------------
declare Function DecimalLatitudecalculate! (relativey As Single)
declare function NSLatitudeconverter$(ad as single)
Dim Shared xratio, yratio As Single
Dim Shared centerx, centery, ypos As Single
Dim decimallatitude, punto, temppos As Single
Dim Shared deccalculate As Single
Dim posi As Integer
Dim dot As String
Dim latitudine As String
Dim tempstring As String
Dim minus As String
Dim alert As Integer

Screen 12
xratio = 1.77
yratio = 2.66
centerx = 320
centery = 240
ypos = 315
temppos = DecimalLatitudecalculate!(ypos)
dot = Chr$(46)
tempstring = Str$(temppos)
posi = InStr(tempstring, dot)

If Left$(tempstring, 1) = Chr$(45) Then 'If minus in front of the string, issues an alert setting a bit.
    'Print "minus sign detected"
    alert = 1
End If
If posi = 4 And alert = 1 Then
    'Print "posi=4"
    tempstring = Left$(tempstring, posi + 2)
Else
    tempstring = Left$(tempstring, posi + 2)
End If
If posi = 3 Then
    tempstring = Left$(tempstring, 5)
End If
If Right$(tempstring, 1) = "0" Then 'If the last digit is = 0 then adds .1 cause Val function doesn.t care about a zero.

    temppos = Val(tempstring) + .1

Else
    temppos = Val(tempstring)
End If
latitudine = NSLatitudeconverter$(temppos)
Print "Sessagesimal latitude position: "; latitudine
End



Function NSLatitudeconverter$ (ad As Single)
    Dim num As String
    Dim nuovastringa As String
    Dim altrastringa As String
    Dim minuti As String
    Dim neominuti As String
    Dim secondi As String
    Dim dot As String
    Dim posizione As Integer
    Dim min As Single
    Dim minutipos As Integer
    Dim result As String
    Dim cardinal As String
    'num = ad
    num = Str$(ad)
    Print "Decimal latitude: "; num
    Sleep
    If Left$(num, 1) = Chr$(45) Then
        cardinal = "South"
        num = Right$(num, Len(num) - 1)
    Else
        cardinal = "North"
    End If

    dot = Chr$(46)
    posizione = InStr(num, dot)
    'Print posizione
    'Sleep 30
    nuovastringa = Left$(num, posizione - 1)
    nuovastringa = nuovastringa + Chr$(248)
    nuovonumero = Val(nuovastringa)
    'Print nuovonumero
    altrastringa = Right$(num, Len(num) - posizione)
    If Len(altrastringa) > 1 Then
        min = (Val(altrastringa) / 100) * 60
    Else
        min = (Val(altrastringa) / 10) * 60
    End If
    'Print minuti
    minuti = Str$(min)
    minutipos = InStr(minuti, dot)
    neominuti = Left$(minuti, minutipos - 1)
    'Print neominuti$
    secondi = Right$(minuti, Len(minuti) - minutipos)
    'Print minuti$
    result = nuovastringa + neominuti + "'" + " " + secondi + "''" + " " + cardinal
    NSLatitudeconverter$ = result



End Function
Function DecimalLatitudecalculate! (relativey As Single)
    Dim tempsingle As Single
    tempsingle = centery - relativey
    deccalculate = tempsingle / yratio
    DecimalLatitudecalculate! = deccalculate
End Function

