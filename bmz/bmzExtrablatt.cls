% ==================================================================
% FILE     bmzExtrablatt.cls
% MACHINE  all
% INFO     documentclass für BMZ Extrablätter
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzExtrablatt}
%          \SetTitel{EigenerTitel hier}
%
% DATE     17.04.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExtrablatt}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,headings=optiontohead]{scrartcl}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

% my math style (loads basicDocumentStyle by default)
\RequirePackage{basicMathDocStyle}

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


\newcommand*{\Adressblock}{
  \begin{tikzpicture}[overlay, remember picture]
    \path[align=left] (current page.north west) ++(33.5mm,-17.3mm) node[below right] 
    {Berufsmaturitätsschule Zürich\\Lagerstrasse 55, 8090 Zürich\\[1em]Bruno Bischofberger};
  \end{tikzpicture}
  \BZ[4]
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
\AtBeginDocument{
  \thispagestyle{empty}
  \Adressblock
  \section{\@Titel}
}
