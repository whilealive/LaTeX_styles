% ==================================================================
% FILE     bmzTheorieblattLT.cls
% MACHINE  all
% INFO     documentclass für BMZ Theorieblätter (LuaLaTeX)
%          Preamble (nur zwei Zeilen):

%          \documentclass{bmzTheorieblattLT}
%          \SetChapter{Kapitel hier}
%          \SetTitel{Titel hier}
%
% DATE     23.08.2019
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzTheorieblattLT}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,twoside]{article}
\RequirePackage[a4paper,inner=35mm,outer=35mm,top=30mm,bottom=40mm]{geometry}

\RequirePackage{basicLayoutLT}
\RequirePackage{basicMacrosLT}
\RequirePackage{myBMZ}

% keine Nummern in section usw.
\setcounter{secnumdepth}{-2}

% header/footer
\fancyhead{} % clear all header fields
\fancyfoot{} % clear all footer fields
\fancyhead[RO,LE]{\thepage}
\fancyhead[LO,RE]{\BMZ}
\fancyhead[CO,CE]{\nouppercase{\leftmark}}

% ----------
% document title command
\ExplSyntaxOn
\keys_define:nn{bmz/title}
{%
  chapter       .tl_set:N = \l__bmz_Chapter_tl,
  addressblock  .bool_set:N = \l__bmz_Addressblock_tl,
  chapter       .value_required:n = true,
  addressblock  .value_required:n = true,
  chapter       .initial:n = {},
  addressblock  .initial:n = {true},
}

\NewDocumentCommand{\SetTitle}{ o m }
{%
  \IfNoValueF{#1}{\keys_set:nn{bmz/title}{#1}}%
  \thispagestyle{empty}%

  \bool_if:NTF{\l__bmz_Addressblock_tl}%
  {%
    \Adressblock{35mm}{18.75mm}%
    \vspace*{22mm}%
  }%
  {%
    \vspace*{18.4mm}%
  }%
  \tl_if_empty:NF{\l__bmz_Chapter_tl}%
  {%
    \vspace*{4.3mm}%
    \bool_if:NF{\l__bmz_Addressblock_tl}{\vspace*{1.2mm}}  % ugly hack here...
    \l__bmz_Chapter_tl%
    \vspace*{-2.1\baselineskip}%
  }%
  \section{#2}%
}%
\ExplSyntaxOff
% ----------

% ----------------------------------------------------------------
% page starts here
% ----------------------------------------------------------------

% ...
