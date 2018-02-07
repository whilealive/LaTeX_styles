% ==================================================================
% FILE     bmzExamLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Prüfungen (LuaLaTeX)
%          Es gibt eine normale Serie (Teil 1 und 2) und eine Nachholprüfung.
%
% DATE     07.02.2018
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExamLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{report}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicLayoutLT}
\RequirePackage{basicMacrosLT}
\RequirePackage{tikzStyle}
\RequirePackage{myNotes}
\RequirePackage{myBMZ}

\DeclareOption*{\PassOptionsToPackage{\CurrentOption}{optional}}
\ProcessOptions\relax
\RequirePackage{optional}

% Pfadangabe der Prüfungsaufgabensammlung
\newcommand*{\PathTALS}{$HOME/Documents/Work/BMS-ZH/01-Unterricht/05-Prüfungsaufgabensammlung/TALS/TALS-Aufgaben/}
\newcommand*{\PathDL}{$HOME/Documents/Work/BMS-ZH/01-Unterricht/05-Prüfungsaufgabensammlung/DL/DL-Aufgaben/}

\def\input@path{{\PathTALS}{\PathDL}}  % .tex-input files
\graphicspath{{\PathTALS}{\PathDL}}    % Scans usw.

% header/footer
\RequirePackage{lastpage}
\lhead{\BMZ}
\rhead{Seite \thepage/\pageref{LastPage}}
\cfoot{}
\opt{Regular}{\chead{Prüfung \@ExamNumber}}
\opt{Nachhol}{\chead{Nachholprüfung \@ExamNumber}}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
% Dokumentklassenoptionen
% \SetClass
\def\@Class{Klasse}
\newcommand*{\SetClass}[1]{\def\@Class{#1}}
% \SetExamNumber
\def\@ExamNumber{00}
\newcommand*{\SetExamNumber}[1]{\def\@ExamNumber{#1}}
% \SetSemesterNumber
\def\@SemesterNumber{00}
\newcommand*{\SetSemesterNumber}[1]{\def\@SemesterNumber{#1}}
% \SetExamRules
\def\@ExamRules{Keine Regeln}
\newcommand*{\SetExamRules}[1]{\def\@ExamRules{#1}}
% \SetTeil
\def\@Teil{0}
\newcommand*{\SetTeil}[1]{\def\@Teil{#1}}

% Prüfungsaufgabe - Umgebung
\newcounter{ExamExerciseCounter}
\setcounter{ExamExerciseCounter}{0}

\RequirePackage{totcount}
\newtotcounter{TotalOfPoints}
\setcounter{TotalOfPoints}{0}

\newenvironment{ExamExercise}[1]{%
  \stepcounter{ExamExerciseCounter}%
  \textbf{Aufgabe \theExamExerciseCounter\ } [#1 Pkt]\ %
  \addtocounter{TotalOfPoints}{#1}\ignorespaces%
}{%
  \par\addvspace{2em}%
}

% Punktanzahl pro Teilaufgabe, rechtsbündig
\newcommand{\Pkt}[1]{\hfill [#1 Pkt]}

% Notizen-Seite (ganze Seite mit Häuschenpapier)
\newcommand*{\Notizen}{\clearpage\textbf{Notizen}\Notes{53}\clearpage}

% Musterlösung pro Aufgabe
% Note: environ package needed to make an environment out of a command (vim math syntax 
% highlighting within curly brackets is broken...)
\RequirePackage{environ}
\NewEnviron{ExamLsg}
{
  \opt{lsg}{%
    \BZ[2]
    \textit{Lösung:}
    \BZ[.5]
    \BODY
  }
}

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  % Titelseite
  \thispagestyle{empty}
  \newgeometry{textwidth=140mm,top=17.5mm,bottom=40mm}

  Berufsmaturitätsschule Zürich\\Lagerstrasse 55, 8090 Zürich\BZ
  Bruno Bischofberger
  \BZ[8]

  \opt{Regular}{\textbf{\Large Prüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber}}
  \opt{Nachhol}{\textbf{\Large Nachholprüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber}}

  % TODO: make more robust
  \ifnum\@Teil>0{\BZ\textbf{\Large Teil \@Teil}}\fi

  \BZ
  \renewcommand*{\arraystretch}{1.6}
  \begin{tabularx}{\linewidth}{|X|c|}
    \hline
    Name & \@Class\\
    \hline
    \multicolumn{2}{|l|}{Datum}\\
    \hline
  \end{tabularx}
  \BZ

  \@ExamRules

  \restoregeometry
}
