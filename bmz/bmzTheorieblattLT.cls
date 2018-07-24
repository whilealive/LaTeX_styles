% ==================================================================
% FILE     bmzTheorieblattLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Theorieblätter (LuaLaTeX)
%          Preamble (nur zwei Zeilen):

%          \documentclass{bmzTheorieblattLT}
%          \SetChapter{Kapitel hier}
%          \SetTitel{Titel hier}
%
% DATE     18.07.2018
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzTheorieblattLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,twoside]{article}
\RequirePackage[a4paper,inner=35mm,outer=35mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicLayoutLT}
\RequirePackage{basicMacrosLT}
\RequirePackage{myBMZ}

% class options:
% --------------
% "notitlepage" - skip document title
\newif\if@notitlepage\@notitlepagefalse
\DeclareOption{notitlepage}{\@notitlepagetrue}

% "cleartoleftpage" - add an extra empty page if last page is even numbered
\newif\if@cleartoleftpage\@cleartoleftpagefalse
\DeclareOption{cleartoleftpage}{\@cleartoleftpagetrue}

\ProcessOptions\relax
% --------------

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
\fancyhead{} % clear all header fields
\fancyfoot{} % clear all footer fields
\fancyhead[RO,LE]{\thepage}
\fancyhead[LO,RE]{\BMZ}
\fancyhead[CO,CE]{\@Titel}


% ----------------------------------------------------------------
% page starts here
% ----------------------------------------------------------------
\if@notitlepage
  % skip document title
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

\if@cleartoleftpage
  \AtEndDocument{\cleartoleftpage}
\fi
