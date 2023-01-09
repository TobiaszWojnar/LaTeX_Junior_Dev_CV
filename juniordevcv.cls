\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{juniordev}[2023/01/10 Junior Developer CV class v1.0]
% Based on developercv [2019/01/28 Developer CV class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%-----------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%-----------------------------------------------------------

\usepackage[hidelinks]{hyperref} % Required for links
\setlength{\parindent}{0mm} % Suppress paragraph indentation
\usepackage[dvipsnames]{xcolor}
\colorlet{buttonColor}{black!90!green!90!blue}

%-----------------------------------------------------------
%	PAGE LAYOUT
%-----------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
 	top=.8cm, % Top margin
	bottom=.8cm, % Bottom margin
	left=1.5cm, % Left margin
	right=1.5cm, % Right margin
	% top=1.7cm, % Top margin
	% bottom=1.7cm, % Bottom margin
	% left=1.92cm, % Left margin
	% right=1.92cm, % Right margin
	headheight=0.7cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	% showframe, % Uncomment to show how the type block is set on the page
}
\pagestyle{empty} % No headers or footers

%-----------------------------------------------------------
%	GRAPHICS DEFINITIONS
%----------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\usetikzlibrary{tikzmark}

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%-----------------------------------------------------------
%	FONTS
%-----------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters
\usepackage[default]{raleway}

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)
\newcommand\namefontsize{\fontsize{26pt}{10pt}\selectfont}

% \renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%-----------------------------------------------------------

\usepackage{fontawesome} % Required for FontAwesome icons

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
	\vcenteredhbox{\colorbox{buttonColor}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}% Icon and box
	\hspace{0.2cm}% Whitespace
	\vcenteredhbox{\textcolor{buttonColor}{#3}}% Text
}

%-----------------------------------------------------------
%	CUSTOM SECTIONS
%-----------------------------------------------------------

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{6pt} % Whitespace before the section title
	\colorbox{buttonColor}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
}

%-----------------------------------------------------------
%	ENTRY LIST
%-----------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable
\setlength{\tabcolsep}{2pt} % No spacing between table columns

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{0.18\textwidth}{% 18% of the text width of the page
		#1 % Leftmost entry date(s) text
	}%
	&\parbox[t]{0.82\textwidth}{% 82% of the text width of the page
		\textbf{#2}% Entry heading text
		\hfill% Horizontal whitespace
		{\footnotesize \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
		#4 % Entry description text
	}\\\\[-1pt]}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
\newcommand{\task}{{\small \faCaretRight } }
\newcommand{\slink}{{\small \faLink } }
