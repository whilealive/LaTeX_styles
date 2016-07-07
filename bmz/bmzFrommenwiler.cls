% ==================================================================
% FILE     bmzFrommenwiler.cls
% MACHINE  all
% INFO     documentclass für BMZ Frommenwiler Musterlösungen
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzFrommenwiler}
%          \SetThema{Algebra} oder \SetThema{Geometrie}
%
% DATE     05.07.2016
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzFrommenwiler}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,headings=optiontohead]{scrartcl}
\RequirePackage[a4paper,textwidth=160mm,top=30mm,bottom=40mm]{geometry}  % extra wide

% my math style (loads basicDocumentStyle by default)
\RequirePackage{basicMathDocStyle}
\RequirePackage{pgfplotsStyle}
\RequirePackage[absolute]{textpos}  % absolute positioning of text blocks

% globaler Ordner der einzelnen Lösungen
\newcommand*{\Dir}{Loesungen/}

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% header/footer (KOMA-Script)
\lohead{BMS Zürich}
\rohead{\thepage}
\cofoot{}
\cohead[]{Musterlösungen Frommewniler \@Thema}

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

