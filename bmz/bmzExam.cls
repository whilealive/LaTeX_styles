% ==================================================================
% FILE     bmzExam.cls
% MACHINE  all
% INFO     documentclass für BMZ Prüfungen
%
% DATE     15.04.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExam}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt]{scrreprt}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

% my math style (loads basicDocumentStyle by default)
\RequirePackage{basicMathDocStyle}

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{optional}}
\ProcessOptions\relax
\RequirePackage{optional}

% header/footer
\RequirePackage{lastpage}
\lohead{BMS Zürich}
\rohead{Seite \thepage/\pageref{LastPage}}
\cofoot{}
\opt{serieA}{\cohead{Prüfung \@ExamNumber, Serie A}}
\opt{serieB}{\cohead{Prüfung \@ExamNumber, Serie B}}
\opt{Nachhol}{\cohead{Nachholprüfung \@ExamNumber}}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
% Dokumentklassenoptionen
% \SetExamNumber
\def\@ExamNumber{00}
\newcommand{\SetExamNumber}[1]{\def\@ExamNumber{#1}}
% \SetSemesterNumber
\def\@SemesterNumber{00}
\newcommand{\SetSemesterNumber}[1]{\def\@SemesterNumber{#1}}
% \SetExamRules
\def\@ExamRules{Keine Regeln}
\newcommand{\SetExamRules}[1]{\def\@ExamRules{#1}}

% Prüfungsaufgabe - Umgebung
\newcounter{ExamExerciseCounter}
\setcounter{ExamExerciseCounter}{0}

\RequirePackage{totcount}
\newtotcounter{TotalOfPoints}
\setcounter{TotalOfPoints}{0}

\newenvironment{ExamExercise}[1]{
  \stepcounter{ExamExerciseCounter}
  \textbf{Aufgabe \theExamExerciseCounter\,} [#1 Pkt]
  \addtocounter{TotalOfPoints}{#1}\ignorespaces}
{\par\addvspace{2em}}

% Notizen-Seite (ganze Seite mit Häuschenpapier)
\newcommand{\Notizen}{\clearpage\textbf{Notizen}\Notes{53}\clearpage}

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{
  % Titelseite
  \thispagestyle{empty}
  \newgeometry{textwidth=140mm,top=17.5mm,bottom=40mm}

  Berufsmaturitätsschule Zürich\\Lagerstrasse 55, 8090 Zürich\BZ
  Bruno Bischofberger
  \BZ[8]

  \opt{serieA}{\textbf{\Large Prüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber, Serie A}}
  \opt{serieB}{\textbf{\Large Prüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber, Serie B}}
  \opt{Nachhol}{\textbf{\Large Nachholprüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber}}

  \renewcommand{\arraystretch}{1.6}
  \begin{figure}[H]
    \begin{tabular}{|l@{\hspace{80mm}}|l@{\hspace{35mm}}|}
      \hline
      Name & Klasse\\
      \hline
      \multicolumn{2}{|l|}{Datum}\\
      \hline
    \end{tabular}
  \end{figure}

  \@ExamRules

  \restoregeometry
}
