% ==================================================================
% FILE     bmzSkript.cls
% MACHINE  all
% INFO     documentclass für TALS Skript
%
% DATE     25.04.2018
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzSkript}
\NeedsTeXFormat{LaTeX2e}

% KOMA
\LoadClass[10pt,twoside,headings=optiontohead,open=right]{scrreprt}
\RequirePackage[a4paper,inner=28mm,outer=60mm,top=30mm,bottom=45mm,marginparwidth=40mm]{geometry}  % textwidth=120mm

% fonts (lucida opentype)
\RequirePackage{mathtools}       % to be loaded before unicode-math, will load fontspec
\RequirePackage{unicode-math}    % support opentype math fonts (load after mathtools!)
\RequirePackage{lucidaBrightOT}  % set fonts, kerning etc.
\RequirePackage[ngerman]{babel}  % hyphenations

% global settings
\setlength{\parindent}{0pt}
\RequirePackage{setspace}

% typography, symbols etc.
\RequirePackage[babel=true]{microtype}
\RequirePackage[hyphens]{url}

% header/footer (KOMA)
\RequirePackage[headsepline,plainheadsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\setkomafont{pageheadfoot}{\normalfont}

% various KOMA stuff
\RedeclareSectionCommand[beforeskip=2\baselineskip,afterskip=\baselineskip]{section}
\RedeclareSectionCommand[beforeskip=2\baselineskip]{subsection}
\RedeclareSectionCommand[beforeskip=1\baselineskip,afterskip=1sp]{subsubsection}

% floats, figures, captions...
\RequirePackage{graphicx}
\RequirePackage{caption}
\captionsetup[figure]{%
  name=Abb.,
  font=small,
  format=plain,
  justification=raggedright,
  singlelinecheck=false%
}

% units
\RequirePackage{siunitx}
\sisetup{per-mode=symbol,exponent-product=\cdot}

\RequirePackage{basicMacrosLT}
\RequirePackage{tikzStyle}
\RequirePackage{myNotes}
\RequirePackage{myBMZ}

% do not try to fill pages with content vertically (needed as it's twoside)
\raggedbottom
\allowdisplaybreaks

% enumeration of chapters, sections
\setcounter{secnumdepth}{2}
\setcounter{chapter}{-1}

% graphics
\graphicspath{{images/}{tikzPreCompile/}}

% header/footer (KOMA-Script)
\renewcommand*{\chaptermarkformat}{}  % no numbers
\automark[section]{chapter}
\lohead[\BMZ]{\BMZ}
\lehead[\BMZ]{\BMZ}
\cohead[\leftmark]{\leftmark}
\cehead[\leftmark]{\leftmark}
\rohead[]{\rightmark}
\rehead[]{\rightmark}

\RequirePackage{multirow}

% ----------------------------------------------------------------
% custom commands and environments...
% ----------------------------------------------------------------
% Enlarge \textwidth by 30mm, so that it is centered on a4paper
\newenvironment{FullWidth}{\begin{addmargin*}[0mm]{-30mm}}{\end{addmargin*}}

% Lösungsseite (immer letzte Seite pro Kapitel)
\newenvironment{SolPage}{\clearpage\section{Lösungen}}{}

% ----------------------------------------------------------------
% hyphenations
% ----------------------------------------------------------------
\hyphenation{Pythagoras}
