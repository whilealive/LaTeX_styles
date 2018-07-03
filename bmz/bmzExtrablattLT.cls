% ==================================================================
% FILE     bmzExtrablattLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Extrablätter (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzExtrablatt}
%          \SetTitel{EigenerTitel hier}
%
% DATE     03.07.2018
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzExtrablattLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{article}
\RequirePackage[a4paper,textwidth=140mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicLayoutLT}
\RequirePackage{basicMacrosLT}
\RequirePackage{myBMZ}

\newif\if@notitlepage
\@notitlepagefalse
\DeclareOption{notitlepage}{\@notitlepagetrue}
\ProcessOptions\relax

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% Title
\def\@Titel{Titel}
\newcommand*{\SetTitel}[1]{\def\@Titel{#1}}

% Chapter
\newif\if@haschapter
\@haschapterfalse
\newcommand*{\SetChapter}[1]{\def\@Chapter{#1}\@haschaptertrue}

% Adressblock
\RequirePackage[absolute]{textpos}
\newcommand*{\Adressblock}{%
  \begin{textblock*}{60mm}(35mm,18.75mm)
    Berufsmaturitätsschule Zürich\\
    Lagerstrasse 55, 8090 Zürich\\[2ex]
    Bruno Bischofberger
  \end{textblock*}%
}

% header/footer
\lhead{\BMZ}
\rhead{\thepage}
\cfoot{}
\chead[]{\@Titel}

% ----------------------------------------------------------------
% page starts here
% ----------------------------------------------------------------
\if@notitlepage
  % leave empty
\else
  \AtBeginDocument{%
    \thispagestyle{empty}%
    \Adressblock
    \vspace*{22mm}%
    \if@haschapter
      \vspace*{4mm}%
      \@Chapter
      \vspace*{-2\baselineskip}
    \fi
    \section{\@Titel}%
  }
\fi
