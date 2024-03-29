(* ::Package:: *)

commandLineMode=True


If[commandLineMode,
	inputFolder=$CommandLine[[-2]];
	outputFolder=$CommandLine[[-1]];
	SetDirectory[DirectoryName[$InputFileName]]
	,
	Print["==================================\nWARNING: program is not running in command line mode!\n=================================="];
	inputFolder="Please type in here";
	outputFolder="Please type in here";
	SetDirectory[NotebookDirectory[]]
]



files=FileNames[All,inputFolder];


numbers=ToString/@Range[0,9]


Convert[input_]:=Module[{termList,listNumDen,result},
	If[Head[input]===Plus,
		termList=List@@input
	,
		termList={input}
	];
	listNumDen={Numerator[#],Denominator[#]}&/@termList;
	result=StringReplace[ToString[InputForm[listNumDen]],{"{"->"list(","}"->")"}];
	result=StringReplace[result,
		"^"~~Shortest[x__]~~"/":>If[Complement[StringSplit[x,""]//Union,numbers]==={},"^("<>x<>")/","^"<>x<>"/"]
	];
	result
]


ReadConvertAndSave[inputFile_]:=Module[{input,result,outputFileName},
	input=Get[inputFile];
	result=Convert[input];
	outputFileName=outputFolder<>"/listnumden_"<>FileNameSplit[inputFile][[-1]];
	If[!DirectoryQ[#],Run["mkdir -p "<>#]]&[outputFolder];
	Export[outputFileName,result];
	If[commandLineMode,
		Run["echo "<>outputFileName]
	,
		Print[outputFileName]
	]
]





outputFolder


LaunchKernels[];
ParallelTable[ReadConvertAndSave[files[[i]]],{i,Length[files]}];
CloseKernels[];



