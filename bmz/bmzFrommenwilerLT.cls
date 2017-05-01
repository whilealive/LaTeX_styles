% ==================================================================
% FILE     bmzFrommenwilerLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Frommenwiler Musterlösungen (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzFrommenwiler}
%          \SetThema{Algebra} oder \SetThema{Geometrie}
%
% DATE     23.03.2017
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzFrommenwilerLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{article}
\RequirePackage[a4paper,textwidth=160mm,top=30mm,bottom=40mm]{geometry}  % extra wide

\RequirePackage{basicLayoutLT}
\RequirePackage{basicMacrosLT}
\RequirePackage{tikzStyle}
\RequirePackage{pgfplotsStyle}
\RequirePackage{myBMZ}

% images
\graphicspath{{Loesungen/}}

\RequirePackage[absolute]{textpos}  % absolute positioning of text blocks

% globaler Ordner der einzelnen Lösungen
\newcommand*{\Dir}{Loesungen/}

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% header/footer
\lhead{\BMZ}
\rhead{\thepage}
\cfoot{}
\chead[]{Musterlösungen Frommenwiler \@Thema}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
\def\@Thema{Thema}
\newcommand*{\SetThema}[1]{\def\@Thema{#1}}

\newcommand*{\Adressblock}{%
  \begin{textblock*}{60mm}(25mm,18.75mm)
    Berufsmaturitätsschule Zürich\\
    Lagerstrasse 55, 8090 Zürich\\[2ex]
    Bruno Bischofberger
  \end{textblock*}%
}

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  \thispagestyle{empty}%
  \Adressblock
  \vspace*{22mm}%
  \section{Musterlösungen Frommenwiler \@Thema}%
}

