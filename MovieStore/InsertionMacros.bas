Attribute VB_Name = "NewMacros"

Function MediumType() As String
    
    Dim intMediumIndex As Integer
    intMediumIndex = Int((3 - 1 + 1) * Rnd + 1)
    
    Select Case intMediumIndex
        Case 1
            MediumType = "VHS"
        Case 2
            MediumType = "DVD"
        Case 3
            MediumType = "BLU"
    End Select

End Function

Function RandomDate() As String
    
    Dim intDay As Integer
    intDay = Int((30 - 1 + 1) * Rnd + 1)
    
    Dim intMon As Integer
    intMon = Int((12 - 1 + 1) * Rnd + 1)
    
    Dim intYear As Integer
    intYear = Int((3 - 1 + 1) * Rnd + 1)
    
    Select Case intYear
        Case 1
            RandomDate = intMon & "/" & intDay & "/" & "2017"
        Case 2
            RandomDate = intMon & "/" & intDay & "/" & "2016"
        Case 3
            RandomDate = intMon & "/" & intDay & "/" & "2015"
    End Select
    
End Function

Sub Loop_Insert_Boxes()
    For i = 1 To 30
        
        Insert_Random_Boxes (i)
        
    Next
End Sub

Sub Insert_Random_Boxes(intBoxID As Integer)
    'INSERT INTO vstblBoxes(BoxID, MovieID, MediumTypeCode, DateBoxReceived, RentalCount)
    'VALUES (1, 5, 'DVD', TO_DATE('11/18/2016', 'MM/DD/YYYY'), 23);
    
    ' Random movieID
    Dim intMovie As Integer
    intMovie = Int((20 - 1 + 1) * Rnd + 1)
    
    ' Random medium type
    Dim strMedium As String
    strMedium = MediumType()
    
    ' Random RentalCount
    Dim intRental As Integer
    intRental = Int((100 - 1 + 1) * Rnd + 1)
    
    ' Random Date
    Dim strDate As String
    strDate = RandomDate()
    
    Dim strInsert As String
    strInsert = "  VALUES (" & intBoxID & ", " & intMovie & ", '" & strMedium & "', TO_DATE('" & strDate & "', 'MM/DD/YYYY'), " & intRental & ");"
    
    Selection.Paste
    Selection.TypeParagraph
    Selection.TypeText Text:=strInsert
    Selection.TypeParagraph
    
End Sub

Sub ActorFields()
Attribute ActorFields.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro1"
'
' Macro1 Macro
'
'
    Selection.TypeText Text:="INSERT INTO vstblActors(ActorID, StageLName, StageFName, DOB, PlaceOfBirth) VALUES (vstblActors_ActorID_seq.NEXTVAL, '"
    Selection.MoveRight Unit:=wdWord, Count:=1
    Selection.MoveLeft Unit:=wdCharacter, Count:=1
    Selection.TypeText Text:="',"
    Selection.MoveRight Unit:=wdCharacter, Count:=1
    Selection.TypeText Text:="'"
    Selection.MoveRight Unit:=wdWord, Count:=1
    Selection.TypeText Text:="',"
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.TypeText Text:=" TO_DATE('"
    Selection.MoveRight Unit:=wdWord, Count:=5
    Selection.TypeText Text:="', 'MM/DD/YYYY'),"
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.TypeText Text:=" '"
    Selection.EndKey Unit:=wdLine
    Selection.TypeText Text:="');"
    Selection.MoveDown Unit:=wdLine, Count:=1
    Selection.HomeKey Unit:=wdLine
End Sub

Sub Insert_movies()
Attribute Insert_movies.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Insert_movies"
'
' Insert_movies Macro
'
'
    Selection.EndKey Unit:=wdLine
    Selection.MoveLeft Unit:=wdWord, Count:=5
    Application.Move Left:=546, Top:=19
    Selection.TypeText Text:="', TO_DATE('"
    Selection.MoveLeft Unit:=wdWord, Count:=7
    Selection.TypeBackspace
    Selection.HomeKey Unit:=wdLine
    Selection.TypeText Text:="  VALUES (,'"
    Selection.EndKey Unit:=wdLine
    Selection.TypeText Text:="', 'MM/DD/YYYY'), );"
    Selection.MoveDown Unit:=wdLine, Count:=1
    Selection.HomeKey Unit:=wdLine
End Sub

Sub Loop_Insert_movies()

    For i = 3 To 23
        
        insert_movie_at_index (i)
        
    Next

End Sub

Sub insert_movie_at_index(intIndex As Integer)
'
' Insert_movies Macro
'
'
    Dim strValue As String
    strValue = "  VALUES (" & intIndex & ",'"
    
    ' generate random number
    Dim intRand As Integer
    intRand = Int((6 - 1 + 1) * Rnd + 1)
        
    Dim strPrefix As String
    strPrefix = "', 'MM/DD/YYYY'), " & intRand & ");"

    Selection.EndKey Unit:=wdLine
    Selection.MoveLeft Unit:=wdWord, Count:=5
    Application.Move Left:=546, Top:=19
    Selection.TypeText Text:="', TO_DATE('"
    Selection.MoveLeft Unit:=wdWord, Count:=7
    Selection.TypeBackspace
    Selection.HomeKey Unit:=wdLine
    Selection.TypeText Text:=strValue
    Selection.EndKey Unit:=wdLine
    Selection.TypeText Text:=strPrefix
    Selection.MoveDown Unit:=wdLine, Count:=1
    Selection.HomeKey Unit:=wdLine
End Sub
Sub Macro1()
Attribute Macro1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Macro1"
'
' Macro1 Macro
'
'
    Selection.Paste
    Selection.TypeParagraph
End Sub
