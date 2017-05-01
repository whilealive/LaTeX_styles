% ==================================================================
% FILE     bmzSkriptPreCompile.cls
% MACHINE  all
% INFO     documentclass für TALS Skript (tikz precomipile)
%
% DATE     21.03.2017
% OWNER    Bischofberger
% ==================================================================

\ProvidesClass{bmzSkriptPreCompile}
\NeedsTeXFormat{LaTeX2e}

% temporary standalone-luatex fix
\RequirePackage{luatex85}

% KOMA
\LoadClass[10pt,tikz]{standalone}

% fonts (lucida opentype)
\RequirePackage{mathtools}       % to be loaded before unicode-math, will load fontspec
\RequirePackage{unicode-math}    % support opentype math fonts (load after mathtools!)
\RequirePackage{lucidaBrightOT}  % set fonts, kerning etc.

% units
\RequirePackage{siunitx}
\sisetup{per-mode=symbol}

\RequirePackage{tikzStyle}
%\RequirePackage{myBMZ}
