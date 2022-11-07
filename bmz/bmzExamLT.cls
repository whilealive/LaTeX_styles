% ==================================================================
% FILE     bmzExamLT.cls
% MACHINE  all
% INFO     Dokumentenklasse für BMZ Prüfungen (LuaLaTeX)
%
%          Eine Präambel hat folgende Form:
%
%          \documentclass[lsg,digest]{bmzExamLTNew}
%          \SetClass{EVT19f}
%          \SetSemesterNumber{1}
%          \SetExamNumber{1}
%          \SetTeil{2}
%
%
% DATE     07.11.2022
% OWNER    Bischofberger
% ==================================================================


\ProvidesClass{bmzExamLT}%
\NeedsTeXFormat{LaTeX2e}%

\LoadClass[10pt]{report}%
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}%

\RequirePackage{basicLayoutLT}%
\RequirePackage{myBMZ}  % loads myMacrosMisc, myMacrosMath
\RequirePackage{tikzStyle}%
\RequirePackage{tikz3dStyle}%
\RequirePackage{pgfplotsStyle}%
\RequirePackage{myNotes}%

% keys: 
% Steuern die Form der Aufgaben/Lösungen.
% Die keys werden durch die Klassenoptionen global ein-/ausgeschaltet (deshalb sind sie so weit oben im Dokument), können aber auch direkt in den Umgebungen gesetzt werden.
\ExplSyntaxOn
\keys_define:nn{bmzExam/examEx}  % keys für "ExamExercise"-Umgebung (siehe unten)
{%
  notes        .bool_set:N = \l__examEx_notes_bool, % fülle unteren Teil der Aufgabe mit notes
  closureLine  .bool_set:N = \l__examEx_closureLine_bool, % schliesse Aufgabe mit Linie ab
  notes        .value_required:n = true,
  closureLine  .value_required:n = true,
  notes        .initial:n = {true},
  closureLine  .initial:n = {false},
}%
\keys_define:nn{bmzExam/examLsg}  % keys für "ExamLsg"-Umgebung (siehe unten)
{%
  hide       .bool_set:N = \l__examLsg_hide_bool, % unterdrückt Ausgabe der "ExamLsg"-Umgebung
  hide       .value_required:n = true,
  hide       .initial:n = {true}, % ohne "hide=false" wird die gesamte ExamLsg ausgelassen!
}%
\ExplSyntaxOff

% -----------------------
% document class options:
% "twopart" - zweiteilige Prüfung (mit/ohne TR), betrifft nur Kopfzeile und \SetTeil{}-Befehl
\newif\if@twopart\@twopartfalse%
\DeclareOption{twopart}{\@twoparttrue}%

% "lsg" - Lösungen: drucke Lösungen aus
\ExplSyntaxOn
\DeclareOption{lsg}
{
  \keys_set:nn{bmzExam/examEx}{notes={false}}
  \keys_set:nn{bmzExam/examLsg}{hide={false}}
}

% "digest" - Übersicht: Aufgaben direkt unereinander, mit horizontalen Linien abgetrennt
\DeclareOption{digest}
{
  \keys_set:nn{bmzExam/examEx}{notes={false},closureLine={true}}
}
\ExplSyntaxOff

\ProcessOptions\relax%
% --------------


% Pfadangabe der Prüfungsaufgabensammlung
\newcommand*{\Path}{$HOME/Documents/Work/BMS-ZH/01-Unterricht/05-Prüfungsaufgabensammlung/}%
\newcommand*{\PathTALS}{01-TALS/TALS-Aufgaben/}%
\newcommand*{\PathDLGESO}{02-DL-GESO/DL-GESO-Aufgaben/}%
\newcommand*{\Lsg}{Lsg/}%

% .tex-input Dokumente, Pfade für \IfFileExists{}{}{} usw.
\def\input@path{{\Path\PathTALS}{\Path\PathTALS\Lsg}{\Path\PathDLGESO}{\Path\PathDLGESO\Lsg}}%
% Pfade für \includegraphics{}
\graphicspath{{\Path\PathTALS}{\Path\PathTALS\Lsg}{\Path\PathDLGESO}{\Path\PathDLGESO\Lsg}}%

% header/footer
\RequirePackage{lastpage}%
\lhead{\BMZ}%
\rhead{Seite \thepage/\pageref{LastPage}}%
\cfoot{}%
\if@twopart%
  \chead{Prüfung \@ExamNumber\ -- Teil \@Teil}%
\else%
  \chead{Prüfung \@ExamNumber}%
\fi%

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
% Dokumentklassenoptionen
% \SetClass
\def\@Class{Klasse}%
\newcommand*{\SetClass}[1]{\def\@Class{#1}}%
% \SetExamNumber
\def\@ExamNumber{00}%
\newcommand*{\SetExamNumber}[1]{\def\@ExamNumber{#1}}%
% \SetSemesterNumber
\def\@SemesterNumber{00}%
\newcommand*{\SetSemesterNumber}[1]{\def\@SemesterNumber{#1}}%
% \SetExamRules
\def\@ExamRules{Keine Regeln}%
\newcommand*{\SetExamRules}[1]{\def\@ExamRules{#1}}%
% \SetTeil
\def\@Teil{0}%
\newcommand*{\SetTeil}[1]{\def\@Teil{#1}}%

% Prüfungsaufgabe - Umgebung
\newcounter{ExamExerciseCounter}%
\setcounter{ExamExerciseCounter}{0}%

\RequirePackage{totcount}%
\newtotcounter{TotalOfPoints}%
\setcounter{TotalOfPoints}{0}%

% Aufgabenumgebung für Prüfungen, stark an diese Dokumentklasse angepasst
% Optionales Argument: notes=true/false, closureLine=true/false
\ExplSyntaxOn
\NewDocumentEnvironment{ExamExercise}{ o m }
{
  \IfNoValueF{#1}{\keys_set:nn{bmzExam/examEx}{#1}}
  \stepcounter{ExamExerciseCounter}
  \textbf{Aufgabe\ \theExamExerciseCounter\ } [#2\ Pkt]\ 
  \addtocounter{TotalOfPoints}{#2}\ignorespaces
}{
  \bool_if:NTF{\l__examEx_closureLine_bool}
    {\hBZ\hrulefill\hBZ}
    {\bool_if:NTF{\l__examLsg_hide_bool}{}{\clearpage}}
  \bool_if:NTF{\l__examEx_notes_bool}
    {\FillNotes}
    {\bool_if:NTF{\l__examEx_closureLine_bool}{}{\clearpage}}
}

% Musterlösung pro Aufgabe
% Optionales Argument: hide=true/false
% Standard ist hide=false!
\RequirePackage{environ}
\NewEnviron{ExamLsg}[1][]
{
  \keys_set:nn{bmzExam/examLsg}{#1}
  \bool_if:NTF{\l__examLsg_hide_bool}
    {}
    {\BZ[2]\textit{Lösung:}\nopagebreak\hBZ\BODY}
}
\ExplSyntaxOff

\newcommand*{\includeSolution}[1]%
{%
  \IfFileExists{#1}%
    {\includegraphics[width=.95\linewidth]{#1}\par}%
    {\textcolor{red}{(Noch) keine Lösungen vorhanden.}\par%
  }%
}%
  
% Punktanzahl pro Teilaufgabe, rechtsbündig
\newcommand{\Pkt}[1]{\hspace*{1em}\hfill [#1~Pkt]\par}%

% Notizen-Seite (ganze Seite mit Häuschenpapier)
\newcommand*{\Notizen}{\clearpage\textbf{Notizen}\Notes{53}\clearpage}%



% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  % Titelseite
  \thispagestyle{empty}%
  \newgeometry{textwidth=140mm,top=17.5mm,bottom=40mm}%

  Berufsmaturitätsschule Zürich\\Lagerstrasse 55, 8090 Zürich\BZ%
  Bruno Bischofberger%
  \BZ[8]%

  \textbf{\Large Prüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber}%

  \if@twopart{\BZ\textbf{\Large Teil \@Teil}}\fi%

  \BZ%
  {\renewcommand*{\arraystretch}{1.6}%
  \begin{tabularx}{\linewidth}{|X|c|}%
    \hline%
    Name & \@Class\\%
    \hline%
    \multicolumn{2}{|l|}{Datum}\\%
    \hline%
  \end{tabularx}}%
  \BZ%

  \@ExamRules%

  \restoregeometry%
}%
