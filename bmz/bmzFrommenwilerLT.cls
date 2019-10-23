% ==================================================================
% FILE     bmzFrommenwilerLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Frommenwiler Musterlösungen (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzFrommenwiler}
%          \SetThema{Algebra} oder \SetThema{Geometrie}
%
% DATE     23.10.2019
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzFrommenwilerLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{article}
\RequirePackage[a4paper,textwidth=160mm,top=30mm,bottom=40mm]{geometry}  % extra wide

\RequirePackage{basicLayoutLT}
\RequirePackage{myBMZ}  % loads basicMacrosLT
\RequirePackage{tikzStyle}
\RequirePackage{tikz3dStyle}
\RequirePackage{pgfplotsStyle}

% images
\graphicspath{{Loesungen/}}

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

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  \thispagestyle{empty}%
  \Adressblock{25mm}{18.75mm}%
  \vspace*{22mm}%
  \section{Musterlösungen Frommenwiler \@Thema}%
}

