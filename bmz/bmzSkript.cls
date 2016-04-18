% ==================================================================
% FILE     bmzSkript.cls
% MACHINE  all
% INFO     documentclass für TALS Skript
%
% DATE     18.04.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzSkript}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,twoside,headings=optiontohead]{scrreprt}
\RequirePackage[a4paper,inner=30mm,outer=60mm,top=30mm,bottom=45mm,marginparwidth=40mm]{geometry}  % textwidth=120mm

% my math style (loads basicDocumentStyle by default)
\RequirePackage{basicMathDocStyle}

% do not try to fill pages with content vertically (needed as it's twoside)
\raggedbottom

% enumeration of chapters, sections
\setcounter{secnumdepth}{2}
\setcounter{chapter}{-1}

% graphics
\graphicspath{{images/}{tikzPreCompile/}}

% header/footer (KOMA-Script)
\renewcommand*{\chaptermarkformat}{}  % no numbers
\automark[section]{chapter}
\lohead[BMS Zürich]{BMS Zürich}
\lehead[BMS Zürich]{BMS Zürich}
\cohead[\leftmark]{\leftmark}
\cehead[\leftmark]{\leftmark}
\rohead[]{\rightmark}
\rehead[]{\rightmark}

% for notes in wide margin -> also see geometry package inclusion
\RequirePackage{marginnote}

% change globally to ]a,b[ intervalls here...
\RequirePackage{interval}
\intervalconfig{soft open fences, separator symbol={;}}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
% Put chapter pages automatically on the right side even though it's a oneside document.
% Before a new chapter, put: "\clearpage{\pagestyle{empty}\cleardoublepage}".
\def\cleardoublepage{%
  \clearpage\ifodd\c@page\else\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi
}

% Enlarge \textwidth by 30mm, so that it is centered on a4paper
\NewEnviron{FullWidth}
{
  \begin{addmargin*}[0mm]{-30mm}
    \BODY
  \end{addmargin*}
}

% HP Prime environment
\NewEnviron{TR}[1][Titel...]
{
  \begin{figure}[H]
    \marginnote{\includegraphics[width=12mm]{HP-Prime.png}}[1em]
    \begin{mdframed}[linewidth=0pt, backgroundcolor=gray!40]
      \vspace{-1em}  % remove vertical space added by \marginnote
      \subsubsection{TR: #1}
      \BODY
    \end{mdframed}
  \end{figure}
}

% Calculator keys
\newcommand*{\Keys}[1]{\fbox{\tt #1}}

% Logische Mengen
\newcommand*{\Logic}[1]{\textsf{\textbf{#1}}}

% Aufgabenliste aus Frommenwiler
\NewEnviron{Frommenwiler}
{
  \medskip
  \begin{minipage}{\linewidth}
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
  \end{minipage}
  \smallskip
}

% ----------------------------------------------------------------
% hyphenations
% ----------------------------------------------------------------
\hyphenation{Pythagoras}
