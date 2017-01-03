% ==================================================================
% FILE     bmzSkript.cls
% MACHINE  all
% INFO     documentclass für TALS Skript
%
% DATE     03.01.2017
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzSkript}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,twoside,headings=optiontohead,open=right]{scrreprt}
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
  \begin{minipage}[c]{\linewidth}
    \vspace{-1ex}  % remove vertical space above frame added by \marginnote
    \marginnote{\includegraphics[width=12mm]{HP-Prime.png}}[2ex]  % alternativ: TI-Nspire.png
    \begin{mdframed}[linewidth=0pt, backgroundcolor=gray!40]
      \vspace{-2ex}  % remove vertical space inside frame added by \marginnote
      \subsubsection{TR: #1}
      \BODY
    \end{mdframed}
  \end{minipage}%
  \BZ
}

% Calculator keys
\newcommand*{\Keys}[1]{\fbox{\texttt{#1}}}
\newcommand*{\BKeys}[1]{\colorbox{black}{\color{white}\texttt{#1}}}

% Logische Mengen
\newcommand*{\Logic}[1]{\textsf{\textbf{#1}}}

% Aufgabenliste aus Frommenwiler
\NewEnviron{Frommenwiler}
{
  \SpaceAbove\BZ[1.2]
  \begin{minipage}{\linewidth}
    \penalty12345% subtrahiere vertikalen Abstand der folgenden Aufg-Umgebung
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
  \smallskip\par\penalty12345
}

% Lösungsseite (immer letzte Seite pro Kapitel)
\NewEnviron{SolPage}
{
  \clearpage
  \settasks{before-skip=-2ex,after-item-skip=-1ex}
  \section{Lösungen}
  \BODY
}

% ----------------------------------------------------------------
% hyphenations
% ----------------------------------------------------------------
\hyphenation{Pythagoras}
