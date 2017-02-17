% ==================================================================
% FILE     bmzExtrablatt.cls
% MACHINE  all
% INFO     documentclass für BMZ Extrablätter
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzExtrablatt}
%          \SetTitel{EigenerTitel hier}
%
% DATE     25.04.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExtrablatt}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,headings=optiontohead]{scrartcl}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

% my math style (loads basicDocumentStyle by default)
\RequirePackage{basicMathDocStyle}
\RequirePackage[absolute]{textpos}  % absolute positioning of text blocks

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% header/footer (KOMA-Script)
\lohead{BMS Zürich}
\rohead{\thepage}
\cofoot{}
\cohead[]{\@Titel}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
\def\@Titel{Titel}
\newcommand*{\SetTitel}[1]{\def\@Titel{#1}}

\newcommand*{\Adressblock}{%
  \begin{textblock*}{60mm}(35mm,18.75mm)
    Berufsmaturitätsschule Zürich\\
    Lagerstrasse 55, 8090 Zürich\\[2ex]
    Bruno Bischofberger
  \end{textblock*}%
}

% Aufgabenliste aus Frommenwiler (kopiert von bmzSkriptStyle)
\NewEnviron{Frommenwiler}
{
  \vbox{
    \begin{Aufg}
      Lösen Sie die folgenden Aufgaben aus Frommenwiler.\par
      \begin{tabularx}{\textwidth}{Xp{12mm}X}
        \toprule
        Aufgabe & Seite & Bemerkungen\\
        \midrule
        \BODY
        \bottomrule
      \end{tabularx}
    \end{Aufg}
  }
}

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  \thispagestyle{empty}%
  \Adressblock
  \vspace*{22mm}%
  \section{\@Titel}%
}

