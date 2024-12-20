\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancy_article}[2024/01/28 A somewhat nicer looking template for articles]

\LoadClass[a4paper]{scrartcl}

% Required packages
\RequirePackage{etoolbox}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage[outputdir=out]{minted}
\RequirePackage[listings]{tcolorbox}
\RequirePackage[backend=biber, style=ieee, hyperref=true]{biblatex}
\RequirePackage{hyperref}
\RequirePackage{fontspec}
\RequirePackage[autostyle]{csquotes}
\RequirePackage{geometry}
\RequirePackage[printonlyused, withpage, smaller]{acronym}

% Parameters
\newbool{lang_german}
\DeclareOption{de}{\booltrue{lang_german}}

\ProcessOptions\relax

% Optional packages
\ifbool{lang_german}{
	\RequirePackage[ngerman]{babel}
	\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
}

% Colors
\definecolor{BoxCode}{HTML}{183a37}
\definecolor{BoxMath}{HTML}{432534}
\definecolor{BoxBackground}{HTML}{f4f7f5}

% Setup
\geometry{
	a4paper,
	margin=2cm
}

\hypersetup{hidelinks}

\setmainfont{Merriweather}
\setsansfont{Merriweather Sans}
\setmonofont{Fira Code}

\tcbuselibrary{minted, theorems}

% Definitions
\newtcblisting{code}[1]{
	listing only,
	colback=BoxBackground,
	colframe=BoxCode,
	minted language={#1},
	minted style=tango,
	minted options={breaklines,linenos,numbersep=3mm},
	left=6mm
}
\newtcblisting{codefile}[2]{
	listing only,
	colback=BoxBackground,
	colframe=BoxCode,
	minted language={#1},
	minted style=tango,
	minted options={breaklines,linenos,numbersep=3mm},
	left=6mm,
	fonttitle=\sffamily,
	title={#2}
}

\newtcbtheorem[number within=section]{theorem}%
{\ifbool{lang_german}{Satz}{Theorem}}%
{
	ams equation*,
	colback=BoxBackground,
	colframe=BoxMath
}{th}
