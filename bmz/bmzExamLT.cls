% ==================================================================
% FILE     bmzExamLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Prüfungen (LuaLaTeX)
%          Es gibt eine normale Serie (Teil 1 und 2) und eine Nachholprüfung.
%
% DATE     23.10.2019
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExamLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{report}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicLayoutLT}
\RequirePackage{myBMZ}  % loads basicMacrosLT
\RequirePackage{tikzStyle}
\RequirePackage{tikz3dStyle}
\RequirePackage{pgfplotsStyle}
\RequirePackage{myNotes}

% class options:
% --------------
% "lsg" - Lösungen
\newif\if@lsg\@lsgfalse
\DeclareOption{lsg}{\@lsgtrue}

% "twopart" - zweiteilig
\newif\if@twopart\@twopartfalse
\DeclareOption{twopart}{\@twoparttrue}


\ProcessOptions\relax
% --------------

% Pfadangabe der Prüfungsaufgabensammlung
\newcommand*{\Path}{$HOME/Documents/Work/BMS-ZH/01-Unterricht/05-Prüfungsaufgabensammlung/}
\newcommand*{\PathTALS}{01-TALS/TALS-Aufgaben/}
\newcommand*{\PathDLGESO}{02-DL-GESO/DL-GESO-Aufgaben/}
\newcommand*{\Lsg}{Lsg/}

% .tex-input Dokumente, Pfade für \IfFileExists{}{}{} usw.
\def\input@path{{\Path\PathTALS}{\Path\PathTALS\Lsg}{\Path\PathDLGESO}{\Path\PathDLGESO\Lsg}}
% Pfade für \includegraphics{}
\graphicspath{{\Path\PathTALS}{\Path\PathTALS\Lsg}{\Path\PathDLGESO}{\Path\PathDLGESO\Lsg}}

% header/footer
\RequirePackage{lastpage}
\lhead{\BMZ}
\rhead{Seite \thepage/\pageref{LastPage}}
\cfoot{}
\if@twopart
  \chead{Prüfung \@ExamNumber\ -- Teil \@Teil}
\else
  \chead{Prüfung \@ExamNumber}
\fi

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
% optional argument: "printNotes=false"
\RequirePackage{environ}
\newif\iffillUpWithNotes
\pgfkeys
{%
  examLsg/.is family, /examLsg,%
  default/.style={printNotes=false},%
  printNotes/.is if=fillUpWithNotes
}
\NewEnviron{ExamLsg}[1][printNotes]
{
  \if@lsg
    \BZ[2]
    \textit{Lösung:}\nopagebreak
    \hBZ
    \BODY
  \else
    \pgfkeys{/examLsg, default, #1}%
    \iffillUpWithNotes\FillNotes\fi
  \fi
}

\newcommand*{\includeSolution}[1]
{%
  \IfFileExists{#1}{%
    \includegraphics[width=\linewidth]{#1}\par
  }{%
    \textcolor{red}{(Noch) keine Lösungen vorhanden.}
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

  \textbf{\Large Prüfung \@ExamNumber, Mathematik, Semester \@SemesterNumber}

  \if@twopart{\BZ\textbf{\Large Teil \@Teil}}\fi

  \BZ
  {\renewcommand*{\arraystretch}{1.6}%
  \begin{tabularx}{\linewidth}{|X|c|}
    \hline
    Name & \@Class\\
    \hline
    \multicolumn{2}{|l|}{Datum}\\
    \hline
  \end{tabularx}}
  \BZ

  \@ExamRules

  \restoregeometry
}
