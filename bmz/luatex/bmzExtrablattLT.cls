% ==================================================================
% FILE     bmzExtrablattLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Extrablätter (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzExtrablatt}
%          \SetTitel{EigenerTitel hier}
%
% DATE     09.03.2017
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExtrablattLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{article}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicDocStyleLT}
\RequirePackage{myBMZ}

\RequirePackage[absolute]{textpos}  % absolute positioning of text blocks

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% header/footer
\lhead{\BMZ}
\rhead{\thepage}
\cfoot{}
\chead[]{\@Titel}

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

