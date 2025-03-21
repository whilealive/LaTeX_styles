% ==================================================================
% FILE     bmzFrommenwilerLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Frommenwiler Musterlösungen (LuaLaTeX)
%          Preamble (nur zwei Zeilen):
%          \documentclass{bmzFrommenwiler}
%          \SetThema{Algebra} oder \SetThema{Geometrie}
%
% DATE     08.07.2024
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzFrommenwilerLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt]{article}
\RequirePackage[a4paper,textwidth=160mm,top=30mm,bottom=40mm]{geometry}  % extra wide

\RequirePackage{basicLayoutLT}
\RequirePackage{myMacrosMisc}
\RequirePackage{myMacrosMath}
\RequirePackage{myExercises}
\RequirePackage{tikzStyle}
\RequirePackage{tikz3dStyle}
\RequirePackage{pgfplotsStyle}
\RequirePackage{myBMZ}

% images
\graphicspath{{Loesungen/}}

% globaler Ordner der einzelnen Lösungen
\newcommand*{\Dir}{Loesungen/}

% header/footer
\lhead{\BMZ}
\rhead{\thepage}
\cfoot{}
\chead[]{Musterlösungen Frommenwiler \@Thema}

% clickable links in table of contents
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linktoc=all,
    linkcolor=blue,
}

% this fixes overful hboxes in table of contents
\usepackage[titles]{tocloft}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
\def\@Thema{Thema}
\newcommand*{\SetThema}[1]{\def\@Thema{#1}}

\newenvironment{ML}[1]{%
  \phantomsection
  \addcontentsline{toc}{subsection}{Aufgabe~#1}
  \SpaceAbove%
  \BZ\noindent\textbf{Aufgabe~#1\enspace}%
}{\SpaceBelow}

% ----------------------------------------------------------------
% Begin document with...
% ----------------------------------------------------------------
\AtBeginDocument{%
  \thispagestyle{empty}%
  \Adressblock{25mm}{18.75mm}%
  \vspace*{22mm}%
  \section*{Musterlösungen Frommenwiler \@Thema}%
  \tableofcontents
  \clearpage
}

