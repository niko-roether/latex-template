\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancy_article}[2024/01/28 A somewhat nicer looking template for articles]

\LoadClass[a4paper]{scrartcl}

% Required packages
\RequirePackage{etoolbox}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[outputdir=out]{minted}
\RequirePackage[listings]{tcolorbox}
\RequirePackage[backend=biber, style=ieee, hyperref=true]{biblatex}
\RequirePackage{hyperref}
\RequirePackage{fontspec}
\RequirePackage[autostyle]{csquotes}
\RequirePackage{geometry}
%\RequirePackage[
%	left=2cm,
%	right=2cm,
%	top=2cm,
%	bottom=2cm,
%	headheight=1m,
%	headsep=0.5cm
%]{geometry}

% Parameters
\newbool{lang_german}
\DeclareOption{de}{\booltrue{lang_german}}

\ProcessOptions\relax

% Optional packages
\ifbool{lang_german}{
	\RequirePackage[ngerman]{babel}
	\RequirePackage[ngerman=ngerman-x-latest]{hyphsubst}
}


% Setup
\geometry{
	a4paper,
	margin=2cm
}

\hypersetup{
	colorlinks=true,
	linkcolor=black,
	filecolor=blue,
	urlcolor=blue
}

\setmainfont{Merriweather}
\setsansfont{Merriweather Sans}
\setmonofont{Fira Code}

\tcbuselibrary{minted}
\newtcblisting{code}[1]{
	listing only,
	minted language={#1},
	minted style=tango
}
\newtcblisting{codefile}[2]{
	listing only,
	minted language={#1},
	minted style=tango,
	fonttitle=\sffamily,
	title={#2}
}
