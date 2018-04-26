% ==================================================================
% FILE     bmzExtrablattLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Extrablätter (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzExtrablatt}
%          \SetTitel{EigenerTitel hier}
%
% DATE     25.04.2018
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

% header/footer
\lhead{\BMZ}
\rhead{\thepage}
\cfoot{}
\chead[]{\@Titel}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
\if@notitlepage
  % leave empty
\else
  \RequirePackage[absolute]{textpos}
  \newcommand*{\Adressblock}{%
    \begin{textblock*}{60mm}(35mm,18.75mm)
      Berufsmaturitätsschule Zürich\\
      Lagerstrasse 55, 8090 Zürich\\[2ex]
      Bruno Bischofberger
    \end{textblock*}%
  }
  \AtBeginDocument{%
    \thispagestyle{empty}%
    \Adressblock
    \vspace*{22mm}%
    \section{\@Titel}%
  }
\fi
