\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Internationalization related configuration for LaTeX documents. This
% package defines:
% - font encoding
% - translation of constants
% - command to use foreign words (where foreign is English)
%
% It DOES NOT define:
% - character encoding (you are required to define the encoding in your
%   LaTeX document. Unfortunately, we cannot assume that everybody uses
%   UTF-8 nowadays.
%
\RequirePackage{ifthen}
\newboolean{scholars@encoding@utf8}
\newboolean{scholars@encoding@iso88591}
\setboolean{scholars@encoding@utf8}{false}
\setboolean{scholars@encoding@iso88591}{false}

\DeclareOption{utf8}{
	\setboolean{scholars@encoding@utf8}{true}
}
\DeclareOption{latin1}{
	\setboolean{scholars@encoding@iso88591}{true}
}

\ProcessOptions*

\RequirePackage{cmap}
% \RequirePackage{mmap}  % Buggy! It's breaking \url support.
% \RequirePackage[noTeX]{mmap}

% Select font encoding (and fix cut/paste for PDF documents).
\RequirePackage[T1]{fontenc}

% l10n
\RequirePackage{babel}
\RequirePackage{datetime}

% Select charset encoding
\ifthenelse{\boolean{scholars@encoding@utf8}}{
	\RequirePackage[fasterrors,savemem,warnunknown]{ucs}
	\RequirePackage[utf8x,utf8]{inputenc}
	\PassOptionsToPackage{unicode}{hyperref}
}{}
\ifthenelse{\boolean{scholars@encoding@iso88591}}{
	\RequirePackage[latin1]{inputenc}
}{}

% Fonts to be used. This choice depends upon the font's choice. For
% T1, the old recommended option was 'ae' (Almost European). It will use
% Adobe Type 1 versions of the CM fonts instead of bitmapped ones.
% Currently, a better option is 'cm-super' (mostly automatically
% vectorized from bitmap ones) and 'lmodern' (manually vectorized).
% As 'lmodern' (Latin Modern) is more carefully designed and under
% continuous maintenance, it is the recommended option.
\RequirePackage{lmodern}

% Macro used for works in English
\newcommand\foreign[1]{\foreignlanguage{english}{\textit{#1}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configure page margins
%
\RequirePackage{geometry}
\geometry{left=2.5cm,right=2cm,top=2cm,bottom=3.5cm,paper=a4paper}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configure paragraph spacing
%


% Remove spacing between paragraphs.
%
\setlength{\parskip}{0pt}

% Set indentation
%
\setlength{\parindent}{1.5cm} %

% Configure line spacing
%
\RequirePackage{setspace}
\onehalfspace


% Avoids widow lines (do not set a value higher than 10000 as this may disable
% the intended behaviour, do not ask me why!).
%
\widowpenalty = 9999
\clubpenalty = 9999
\displaywidowpenalty = 9999



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title pages.
%
\RequirePackage{pdfpages}
\RequirePackage{lastpage}
\RequirePackage{chngpage}

\def\titleen#1{\gdef\@titleen{#1}}%
\def\@titleen{\@latex@error{No \noexpand\titleen given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\coadvisor#1{\gdef\@coadvisor{#1}}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\addressen#1{\gdef\@addressen{#1}}%
\def\@addressen{\@latex@error{No \noexpand\addressen given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\universityen#1{\gdef\@universityen{#1}}%
\def\@universityen{\@latex@error{No \noexpand\universityen given}\@ehc}%

\def\universityunit#1{\gdef\@universityunit{#1}}%
\def\@universityunit{\@latex@error{No \noexpand\universityunit given}\@ehc}%

\def\program#1{\gdef\@program{#1}}%
\def\@program{\@latex@error{No \noexpand\program given}\@ehc}%

\def\programen#1{\gdef\@programen{#1}}%
\def\@programen{\@latex@error{No \noexpand\programen given}\@ehc}%

\def\course#1{\gdef\@course{#1}}%
\def\@course{\@latex@error{No \noexpand\course given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\goal#1{\gdef\@goal{#1}}%
\def\@goal{\@latex@error{No \noexpand\goal given}\@ehc}%

\def\degree#1{\gdef\@degree{#1}}%
\def\@degree{\@latex@error{No \noexpand\degree given}\@ehc}%

\def\degreetype#1{\gdef\@degreetype{#1}}%
\def\@degreetype{\@latex@error{No \noexpand\degreetype given}\@ehc}%

\def\documenttype#1{\gdef\@documenttype{#1}}%
\def\@documenttype{\@latex@error{No \noexpand\documenttype given}\@ehc}%

\def\documenttypeen#1{\gdef\@documenttypeen{#1}}%
\def\@documenttypeen{\@latex@error{No \noexpand\documenttypeen given}\@ehc}%

\def\degreearea#1{\gdef\@degreearea{#1}}%
\def\@degreearea{\@latex@error{No \noexpand\degreearea given}\@ehc}%

\newcommand{\advisorlabel}{Advisor}
\newcommand{\coadvisorlabel}{Co-advisor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CAPA

\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\centering
		{
			\singlespacing
			\large\allcaps{\@university}\\
			\large\allcaps{\@universityunit}\\
			\large\allcaps{\@program}\par	
		}
		\vspace{56pt}	
		{
			\singlespacing
			\large\textbf{\allcaps{\@author}}\\
		}
		\vfill
		{
			\singlespacing
			\Large\textbf{\allcaps{\@title}} \par 
		}
		\vspace{48pt}
		\large\allcaps{\@documenttype}
		\vfill
		\textbf{\allcaps{\@address}}\par
		\textbf{\@depositshortdate}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FOLHA DE ROSTO 

\newcommand{\esporient}[2]
{
	\leftskip 0em
	\@tempdima 6.4em
	\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
	{#1#2\hfil}
}

\newcommand{\@goalfulltext}{
	\@latex@error{No \noexpand\goalfulltext given}\@ehc
}

\renewcommand{\@goalfulltext}{
	\@goal{} apresentado à disciplina de \@course, do \@program{} do \@universityunit{}
	da \@university{}, como requisito parcial para obtenção do título de \@degree{}
	em \@degreearea{}.
}



\newcommand{\coverpagetwo}
{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
				\singlespacing
				\large\textbf{\allcaps{\@author}}\\
		\end{center}
		\vfill
		\begin{center}
			\Large\textbf{\allcaps{\@title}}\par
		\end{center}
		\vspace{60pt}
%		\hspace{.4\textwidth}
		\hfill\begin{minipage}{.6\textwidth}
				\singlespacing
				\hyphenpenalty=10000
				\@goalfulltext\par
				\esporient{\numberline{\advisorlabel:}}{\hspace{.5mm}\@advisor}\par
				\@ifundefined{@coadvisor}{}{
					\vspace{-8pt}
					\esporient{\numberline{\coadvisorlabel:}}{\hspace{.5mm}\@coadvisor}\par
				}
		\end{minipage}
		\vfill
		\begin{center}
			\textbf{\allcaps{\@address}}\par
			\textbf{\@depositshortdate}
		\end{center}
	\end{adjustwidth}
}

% Title and cover page
%
\renewcommand{\maketitle}{%
	\metadata
	\begin{titlepage}
		\coverpageone
		\coverpagetwo
	\end{titlepage}
	\null
	\cleardoublepage
}

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %   Ficha catalografica
\providecommand{\UTFPRfichacatpumdata}{}
\newcommand{\fichacatpum}[1]{\renewcommand{\UTFPRfichacatpumdata}{#1}}
\providecommand{\UTFPRfichacatautordata}{}
\newcommand{\fichacatautor}[1]{\renewcommand{\UTFPRfichacatautordata}{#1}}
\providecommand{\UTFPRfichacatpgbibdata}{}
\newcommand{\fichacatpgbib}[1]{\renewcommand{\UTFPRfichacatpgbibdata}{#1}}
\providecommand{\UTFPRfichacatpalchadata}{}
\newcommand{\fichacatpalcha}[1]{\renewcommand{\UTFPRfichacatpalchadata}{#1}}
\providecommand{\UTFPRfichacatpdoisdata}{}
\newcommand{\fichacatpdois}[1]{\renewcommand{\UTFPRfichacatpdoisdata}{#1}}
\providecommand{\UTFPRfichacatbibdata}{}
\newcommand{\fichacatbib}[1]{\renewcommand{\UTFPRfichacatbibdata}{#1}}

\usepackage{refcount}
\newcommand{\pagedifference}[2]{%
	\number\numexpr\getpagerefnumber{#2}-\getpagerefnumber{#1}\relax}

\newcommand{\fichacat}{
	\newcommand{\lenauthor}{\hspace{8px}}
	\newcommand{\lencore}{\hspace{8px}}
	\thispagestyle{empty}{
		\footnotesize{
			\vspace*{12.8cm}
			\begin{center}
				\begin{tabular}{c}
					Dados Internacionais de Cataloga\c{c}\~{a}o na Publica\c{c}\~{a}o
				\end{tabular}
			\end{center}
		}
		\vspace{-25px}
		\begin{center}
			\line(1,0){385}
		\end{center}
		\vspace{-15px}
		\begin{table}[h!]
			\begin{center}
				\scriptsize
				\begin{tabular}{lp{12cm}}
					\UTFPRfichacatpumdata
					\lenauthor & \UTFPRfichacatautordata \\
					\lenauthor & \lencore \@title / \@author. \@address. UTFPR,  \@depositshortdate. \\
					           & \lencore \pageref{LastPage}. f. : il. ; 30 cm \\
					           & \\
					           & \lencore Orientador: \@advisor. \\
\@ifundefined{@coadvisor}{}{
							   & \lencore \coadvisorlabel: \@coadvisor \\
}
							   & \lencore \@documenttype{} (\@degreetype) - \@university. \@program. \@address, \@depositshortdate.\\
							   & \lencore Bibliografia: f. \pageref{bibstart} - \pageref{bibend}. \\
					           & \\
					           & \lencore \UTFPRfichacatpalchadata \\
					           & \\
					           & \hfill \UTFPRfichacatpdoisdata \\
			  \end{tabular}
      \end{center}
    \end{table}
    \vspace{-35px}

    \begin{center}
      \line(1,0){385}
    \end{center}

    \vspace{-25px}
    \center \footnotesize \UTFPRfichacatbibdata
    \newpage
	}
}

\newenvironment{agradecimentos}{
	\cleardoublepage
	\chapter*{Agradecimentos}
}{}

% Command to create a dedicate page.
\newcommand{\dedicate}[1]{
	\cleardoublepage
	\null
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{#1}}
	\vspace{3cm}
}

% Environment to write abstract (in English and native language). This
% environment has narrower margins.
\newenvironment{abstract}{
	\chapter*{Abstract}
	\setlength{\parindent}{0pt}
		
	\UTFPRfichacatautordata. \@titleen. \@depositshortdate.
	\pageref{LastPage}. f. \@documenttypeen{} (\@programen), \@universityen.
	\@addressen, \@depositshortdate.
	
	\vspace{.7cm}
}{
	\vspace{.7cm}
}

\newenvironment{resumo}{
	\chapter*{Resumo}
	\setlength{\parindent}{0pt}

	\UTFPRfichacatautordata. \@title. \@depositshortdate.
	 \pageref{LastPage}. f. \@documenttype{} (\@program), \@university.
	 \@address, \@depositshortdate.

	\vspace{.7cm}
}{
	\vspace{.7cm}
}

\newcommand{\palavraschaves}[1]{\noindent\textbf{Palavras-chaves:} #1}

\newcommand{\keywords}[1]{\noindent\textbf{Keywords:} #1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page configuration (page number placement, chapter and section formatting)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title definitions
%
% The 'titlesec' package is fabulous! Changing the \chapter and friends is a nightmare. That
% package makes the job easy, piece of cake actually!
%
% noindentafter: Do not indent the first paragraph after a title definition
% rigidchapters: Set a fixed space for chapters
% nobottontitles*: Do not allow a title hanging at the botton (like a widow line)
% largestsep: Uses the largest space between two following titles.
% clearempty: Do not show the page number in an empty page (pretty common in doubleepage docs).
\RequirePackage[pagestyles,noindentafter,rigidchapters,largestsep]{titlesec}

\RequirePackage{fancybox}


% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}{}{}
	\setfoot{}{}{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\sethead{}{}{\thepage}
	\setfoot{}{}{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}[\small\sffamily]{
	\sethead{}{}{\thepage}
	\setfoot{}{}{}
}

\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{empty}
	\pagenumbering{gobble}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagestyle{mainmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\def\pagenumbering#1{%
	\gdef\thepage{\csname @#1\endcsname \c@page}}

\renewcommand\backmatter{%
	\cleardoublepage
	\pagestyle{backmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\newlength{\chaptertitleheight}
\titleformat{\chapter}[display]
{\normalfont\Large\sffamily} % Text format
{ % Label
	\rule[32pt]{.7\linewidth}{4pt}
	\hspace{-10pt}
	\shadowbox{
		\begin{minipage}{.18\linewidth}
			\centering
			\textsc{\Large\chaptertitlename}\\
			\vspace{1ex}
			{\fontsize{80}{100}\selectfont\thechapter}\\
			\vspace{1ex}
		\end{minipage}
	}
	\hspace{-14pt}
	\leaders\hbox{\rule[32pt]{.1pt}{4pt}}\hfill
}
{0pt}
{\Huge\raggedright}
[\rule{\linewidth}{4pt}]

\newsavebox{\scholar@chaptertitle}%
\let\scholar@oldchapter\chapter%
\renewcommand*\chapter{%
	\@ifstar{\scholar@oldchapter@starred}{\@dblarg\scholar@oldchapter@notstarred}}

\newcommand*\scholar@oldchapter@starred[1]{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#1}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{3cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]
	\scholar@oldchapter*{#1}}

\def\scholar@oldchapter@notstarred[#1]#2{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#2}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{7cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]%
	\scholar@oldchapter[{#1}]{#2}}%



% Add a dot after the section/subsection/etc counters.
\titlelabel{\thetitle.\quad}

\titlespacing{\section}{0pt}{1.2em}{.8em}[0pt]




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Configure listings
%

% Redefine the description environment, thus using less space between each
% element. It would be more elegant to use the same solution adopted for
% itemize and enumerate (as done by this class), but that solution does not
% seem to work (maybe that's because 'description' is redefined within the
% 'book' document class.
%
\renewenvironment{description}{%
	\list{}{%
		\Nospacing%
		\let\makelabel\descriptionlabel}%
}%
{\endlist}%

% Redefinition of description labels ([space] <label> ":").
%
\renewcommand*\descriptionlabel[1]{%
	\hspace%
	\labelsep%
	\normalfont%
	%Luiz Arthur: Tive que remover porque colocava bolinhas na frente da lista de siglas, tem que ver onde isso vai influenciar.
	%$\bullet$ \textsf{#1}:%
	\textsf{#1}:\quad%
}

% Define labels for every list environment's item.
%
% \RequirePackage{enumitem-zref}


% Reduces the vertical spacing (topsep, partopsep, parsep, itemsep) and horizontal
% spacing (leftmargin, rightmargin, listparindent, labelwidth, labelsep, itemindent)
% for list environments (description, itemize, enumerate).
%
% For enumerated lists, we also change the numbering to often append a dot after
% the number.
%
\RequirePackage{enumitem}
\setdescription{topsep=0pt, partopsep=6pt, parsep=0pt, itemsep=0pt}
\setitemize{topsep=0pt, partopsep=6pt, parsep=0pt, itemsep=0pt}
\setenumerate{topsep=0pt, partopsep=6pt, parsep=0pt, itemsep=0pt, label*=\arabic*.}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Floats

\RequirePackage{float}
% \floatstyle{plaintop}
\restylefloat*{table}

% \floatstype{plain}
\restylefloat*{figure}

% If the specifier contains a !, the algorithm will ignore any restrictions
% related either to the number of floats that can be put into an area or the
% maximum size an area can occupy.If the specifier contains a !, the algorithm
% will ignore any restrictions related either to the number of floats that can
% be put into an area or the maximum size an area can occupy.
%
% The order in which these characters are put in the optional argument does
% not influence how the algorithm tries to place the float! It first tries h,
% then t, then b.
%
% The placement constraint 'H' really means 'here', starting a new page if
% necessary.
%
\floatplacement{table}{hbt}
\floatplacement{figure}{hbt}

% You can suppress floats on a page using the command \suppressfloats[placement],
% which placements can be 't' or 'b'.
%
% \suppressfloats[t]


% Otimização no espaço ocupado por floats
%
\newcommand{\floatmargin}{0cm}


% Space left between floats in top or bottom areas
%
\renewcommand{\floatsep}{12pt} % plus 2pt minus 2pt}

% Space left between floats in top or bottom areas on two-column pages 
%
\renewcommand{\dblfloatsep}{12pt} % plus 2pt minus 2pt}

% Space left on top and bottom of an in-text float (floats placed with 'h').
%
\renewcommand{\intextsep}{12pt} % plus 2pt minus 2pt}

% Space between last top float or first bottom float and the text when in single column mode.
%
\renewcommand{\textfloatsep}{12pt} % plus 2pt minus 4pt}

% Space between last top float or first bottom float and the text when in two columns mode.
%
\renewcommand{\dbltextfloatsep}{12pt} % plus 2pt minus 4pt}


% 'topfraction' (default 0.7) is the percentage of page height to be used
% (maximum size of the top area)
%
\renewcommand{\topfraction}{0.95}

% 'bottomfraction' (default 0.3) is the percentage of page height to be used
% (maximum size of the bottom area)
%
\renewcommand{\bottomfraction}{0.8}

% 'dbltopfraction' (default 0.7) is the maximum size of the top area for
% double-column floats.
%
\renewcommand{\dbltopfraction}{0.9}

% 'textfraction' (default 0.2) is minimum size of the text area, i.e.,
% the area that must not be occupied by floats
%
\renewcommand{\textfraction}{0.07}

% 'floatpagefraction' (default 0.5) is the minimum part of the page (or column)
% that needs to be occupied by floats to be allowed to form a float page (or
% column)
%
\renewcommand{\floatpagefraction}{0.9}
\renewcommand{\dblfloatpagefraction}{0.9}


% Other settings:

% 'topnumber' (default 2) is the maximum number of floats in the top area.
%
\setcounter{topnumber}{5}

% 'bottomnumber' (default 1) is the maximum number of floats in the bottom area.
%
\setcounter{bottomnumber}{5}

% 'totalnumber' (default 3) is the maximum number of floats on a text column.
%
\setcounter{totalnumber}{10}

% 'dbltopnumber' (default 2) is the maximum number of full-width floats in
% two-column mode going above the text columns.
%
\setcounter{dbltopnumber}{10}

% Enable support for floats at the bottom of pages for double-column documents. 
%
% \RequirePackage{stfloats}

% Package to control float placement. You may use \afterpage{\clearpage} to
% force that all floats, defined until now, be placed. However, consider
% using \FloatBarrier (of 'placeins' instead).
%
% \RequirePackage{afterpage}


% Placeins.sty keeps floats in their place, preventing them from floating
% past \FloatBarrier command into another section. At the same time, it allow
% text to be put on the page.
%
\RequirePackage{placeins}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Captions

\RequirePackage{caption}
\DeclareCaptionFont{singlespacing}{\setstretch{1}}
\DeclareCaptionFont{onehalfspacing}{\onehalfspacing}
\DeclareCaptionFont{doublespacing}{\doublespacing}
\captionsetup{font=footnotesize}
\captionsetup{format=plain}
\captionsetup{indention=0pt}
\captionsetup{labelformat=default}
\captionsetup{labelsep=period}
\captionsetup{justification=justified}
\captionsetup{singlelinecheck=true}
\captionsetup{labelfont=bf}
\captionsetup{parskip=4pt}
\captionsetup{margin=\floatmargin}
\captionsetup[table]{position=top}
\captionsetup{font={singlespacing,small}}
\setlength{\abovecaptionskip}{4pt}
\captionsetup[subfloat]{justification=centering}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting

% Command to turn all letters uppercase
\newcommand{\allcaps}[1]{\uppercase\expandafter{#1}}

% Command to underline the text
\newcommand{\underln}[1]{$\underline{\text{#1}}$}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Correctly format the footnotes
% stable: Remove title's footnote mark from TOC.
% multiple: Adds a command between multiple sequencial footnote marks
% marginal,flushmarginal: Keeps the footnotes within the margin and without indentation
% bottom: Footnotes will be inserted always at the page's bottom.
\RequirePackage[bottom,marginal,flushmargin,stable,multiple]{footmisc}

% Keep the footnote mark within the text area.
% http://tug.org/TeXnik/mainFAQ.cgi?file=footnotes/footnotes
\newlength{\myFootnoteWidth}
\newlength{\myFootnoteLabel}
\setlength{\myFootnoteLabel}{.8em}%  <-- can be changed to any valid value
\renewcommand{\@makefntext}[1]{%
  \setlength{\myFootnoteWidth}{\columnwidth}%
  \addtolength{\myFootnoteWidth}{-\myFootnoteLabel}%
  \noindent\makebox[\myFootnoteLabel][r]{\@makefnmark\ }%
  \parbox[t]{\myFootnoteWidth}{#1}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphics
%

% Enables use of figures.
\@ifpackageloaded{graphicx}{
	\RequirePackage{epstopdf}
}{
	\RequirePackage[pdftex]{graphicx}
	\RequirePackage{epstopdf}
}

% Provide extra options regarding figure positioning.
\RequirePackage[export]{adjustbox}

% Extends the file name processing of package 'graphics' to support a larger
% range of file names (with several dots, with spaces, etc) and filenames
% encoded with utf8.
% \RequirePackage{stringenc}
%
\RequirePackage[extendedchars,encoding,multidot,space,filenameencoding=utf8]{grffile}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spacing hacks
%

% Resolve um warning do latex.
\setlength{\headheight}{16pt}

\setlength{\fboxsep}{0pt}


% TeX’s first attempt at breaking lines is performed without even trying
% hyphenation: TeX sets its “tolerance” of line breaking oddities to the
% internal value \pretolerance, and sees what happens. If it can’t get an
% acceptable break, TeX adds the hyphenation points allowed by the current
% patterns, and tries again using the internal \tolerance value. If this pass
% also fails, and the internal \emergencystretch value is positive, TeX will
% try a pass that allows \emergencystretch worth of extra stretchability to
% the spaces in each line.
%
% The choice of method has time implications — each of the passes takes time,
% so adding a pass (by changing \emergencystretch) is less desirable than
% suppressing one (by changing \pretolerance). However, it’s unusual nowadays
% to find a computer that’s slow enough that the extra passes are really
% troublesome.
% The value of \emergencystretch is added to the assumed stretchability of each
% line of a paragraph, in a further run of the paragraph formatter in case that
% the paragraph can’t be made to look right any other way. (The extra scan
% happens if \emergencystretch>0pt — if it’s zero or negative, no gain could be
% had from rerunning the paragraph setter.)
%
% More subtle (but more tricky to manage) are the microtypographic extensions
% provided by PDFTeX. There are two extensions, margin kerning and font
% expansion; margin kerning only affects the visual effect of the typeset page,
% and has little effect on the ability of the paragraph setter to “get things
% right”. Font expansion works like a subtler version of the trick that
% \emergencystretch plays: PDFTeX ‘knows’ that your current font may be
% stretched (or shrunk) to a certain extent, and will do that “on the fly” to
% optimise the setting of a paragraph.
%
\pretolerance=500
\tolerance=500
\setlength{\emergencystretch}{3em}
\usepackage[final, babel]{microtype}

% Hacks suggested by Axel Reichert at de.comp.text.tex (removes several LaTeX warnings)
% \hbadness 1414
% \raggedbottom

% Do not bother to report overfull boxes if over-edge is < 1pc
\vfuzz 1pc
\hfuzz 1pc

% Lista de acronimos
\RequirePackage[printonlyused, withpage]{acronym}

% Redefinicao do ambiente utilizado pela lista de acronimos, corrigindo o espacamento
% entre os itens.
\renewenvironment{AC@deflist}[1]{
        \raggedright
        \begin{list}{}{
%               \Nospacing
                \settowidth{\labelwidth}{\textbf{\textsf{#1}}}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \renewcommand{\makelabel}{\aclabelfont}
        }
}{
        \end{list}
}

\newcommand{\listofacronyms}[1]{
        \cleardoublepage{}
        \chapter*{\listofacronymsname}
        \input{#1}
        \acresetall{}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PDF settings
\pdfcompresslevel=9
\pdfobjcompresslevel=3

\def\extractpdftexversion#1-#2-#3 #4\@nil{#3}
\edef\pdftexppversion{\expandafter\extractpdftexversion\pdftexbanner\@nil}

\newcommand{\metadata}{
	\pdfinfo {
		/Title (\@title)
		/Author (\@author)
%		/Keywords (\@keywords)
%		/CreationDate (D:20040501215500)
		/ModDate (D:\pdfdate)
		/Producer (pdfTeX \pdftexppversion)
	}
}

% Enable traceability (synchronization) between LaTeX source and PDF output.
% \usepackage[novbox]{pdfsync}

\ifnum\pdftexversion=140
	\ifnum\pdftexrevision>14
		\pdfsuppresswarningpagegroup=1
		% Enable usage of fake spaces in PDF (\pdffakespace)
%		\pdfinterwordspaceon
	\fi
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TOC
\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Listings
\RequirePackage{ifthen}
\RequirePackage{textcomp} % Required by upquote option.
\RequirePackage{listings}
% Default settings for listings
\lstset{upquote=false}
\lstset{basicstyle=\scriptsize}
\lstset{tabsize=4}
\lstset{frame=single}
\lstset{frameround=tttt}
\lstset{aboveskip=16pt}
\lstset{belowskip=6pt}
\lstset{xleftmargin=\floatmargin}
\lstset{xrightmargin=\floatmargin}
\lstset{resetmargins=true}
\lstset{float}
\lstset{captionpos=b}
\lstset{extendedchars=true}
\lstset{showstringspaces=false}

% http://stackoverflow.com/questions/1116266/listings-in-latex-with-utf-8-or-at-least-german-umlauts
\ifthenelse{\boolean{scholars@encoding@utf8}}{
	\RequirePackage{listingsutf8}
}{}

% \ifthenelse{\boolean{scholars@encoding@iso88591}}{
% 	\lstset{inputencoding=latin1}
% }{}

% Macro for inline source code
%
\@ifpackageloaded{url}{}{
	\RequirePackage[obeyspaces,spaces]{url}
}
\newcommand\srccode[1]{\url{#1}}%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References to floats
%
\RequirePackage[capitalise]{cleveref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Appendix

\RequirePackage{appendix}
\let\origappendix=\appendix
\renewcommand\appendix{
	\origappendix
 	\cleardoublepage
 	\addappheadtotoc
 	\appendixpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References

\RequirePackage[alf,abnt-full-initials=yes,abnt-missing-year=sd,abnt-doi=doi,abnt-etal-cite=2,abnt-etal-list=0]{abntex2cite}

% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\addcontentsline{toc}{chapter}{\numberline{}\bibname}
	\chapter*{\bibname}%
	\label{bibstart}
	
	\list{
		\@biblabel{\@arabic\c@enumiv}
	}{
	\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\@openbib@code
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}
}
\sloppy
\clubpenalty4000
\@clubpenalty \clubpenalty
\widowpenalty4000%
\sfcode`\.\@m
}{
\def\@noitemerr{\@latex@warning{Empty thebibliography environment}}
\endlist
\label{bibend}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translations
%

% Translation of names defined by Babel does not take effects as Babel's
% translations are defined by '\begin{document}' statement. Thus, you
% have to use the command '\addto\captions<language>'. This hint was found
% at http://www.tex.ac.uk/cgi-bin/texfaq2html?label=latexwords
%
\addto\captionsbrazil{%
	\renewcommand{\listfigurename}{Lista de figuras}%
	\renewcommand{\listtablename}{Lista de tabelas}%
	\renewcommand{\bibname}{Refer\^encias}
	\renewcommand{\appendixpagename}{Ap\^endices}
	\renewcommand{\appendixtocname}{Ap\^endices}
	\renewcommand{\advisorlabel}{Orientador}
	\renewcommand{\coadvisorlabel}{Coorientador}
}

\@ifpackageloaded{listings}{
	\def\lstlistingname{Source code}
	\def\lstlistlistingname{List of source code}
	\iflanguage{brazil}{%
		\renewcommand\lstlistingname{C\'odigo-fonte}
	}
}{}

% Translations regarding acronyms
\def\listofacronymsname{Acronyms}
\iflanguage{brazil}{%
	\def\listofacronymsname{Lista de acr\^onimos}
}{}

\@ifpackageloaded{cleveref}{
	\crefname{chapter}{Chapter}{Chapters}
	\Crefname{chapter}{Chapter}{Chapters}
	\crefname{section}{Section}{Sections}
	\Crefname{section}{Section}{Sections}
	\crefname{line}{Line}{Lines}
	\Crefname{line}{Line}{Lines}
	\crefname{table}{Table}{Tables}
	\Crefname{table}{Table}{Tables}
	\crefname{figure}{Figure}{Figures}
	\Crefname{figure}{Figure}{Figures}
	\crefname{subfigure}{Figure}{Figures}
	\Crefname{subfigure}{Figure}{Figures}
	\crefname{equation}{Equation}{Equations}
	\Crefname{equation}{Equation}{Equations}
	\crefname{lstlisting}{Listing}{Listings}
	\Crefname{lstlisting}{Listing}{Listings}
	\crefname{lstnumber}{Line}{Lines}
	\Crefname{lstnumber}{Line}{Lines}
	\crefrangelabelformat{chapter}{#3#1#4~to~#5#2#6}
	\crefrangelabelformat{section}{#3#1#4~to~#5#2#6}
	\iflanguage{brazil}{%
		\crefname{chapter}{Cap\'itulo}{Cap\'itulos}
		\Crefname{chapter}{Cap\'itulo}{Cap\'itulos}
		\crefname{section}{Se\c{c}\~ao}{Se\c{c}\~oes}
		\Crefname{section}{Se\c{c}\~ao}{Se\c{c}\~oes}
		\crefname{line}{Linha}{Linhas}
		\Crefname{line}{Linha}{Linhas}
		\crefname{table}{Tabela}{Tabelas}
		\Crefname{table}{Tabela}{Tabelas}
		\crefname{figure}{Figura}{Figuras}
		\crefname{figure}{Figura}{Figuras}
		\Crefname{figure}{Figura}{Figuras}
		\crefname{subfigure}{Figura}{Figuras}
		\Crefname{subfigure}{Figura}{Figuras}
		\crefname{equation}{Equa\c{c}\~ao}{Equa\c{c}\~oes}
		\Crefname{equation}{Equa\c{c}\~ao}{Equa\c{c}\~oes}
		\crefname{listing}{C\'odigo-fonte}{C\'odigos-fonte}
		\Crefname{listing}{C\'odigo-fonte}{C\'odigos-fonte}
		\crefname{lstlisting}{C\'odigo-fonte}{C\'odigos-fonte}
		\Crefname{lstlisting}{C\'odigo-fonte}{C\'odigos-fonte}
		\crefname{lstnumber}{Linha}{Linhas}
		\Crefname{lstnumber}{Linha}{Linhas}
		\crefrangelabelformat{chapter}{#3#1#4~a~#5#2#6}
		\crefrangelabelformat{section}{#3#1#4~a~#5#2#6}
		
		% The commands all take five arguments: the cross-reference type, the format
		% for the first cross-reference in a list, the format for the second
		% cross-reference in a list of two, the format for the middle cross-references
		% in a list of more than two, and the format for the last cross-reference in
		% a list of more than two.
		\newcommand{\crefrangeconjunction}{ e }
		\newcommand{\crefpairconjunction}{ e }
		\newcommand{\crefmiddleconjunction}{, }
		\newcommand{\creflastconjunction}{ e }
		\crefmultiformat{ type }{ first }{ second }{ middle }{ last }
		\Crefmultiformat{ type }{ first }{ second }{ middle }{ last }
		\crefrangemultiformat{ type }{ first }{ second }{ middle }{ last }
		\Crefrangemultiformat{ type }{ first }{ second }{ middle }{ last }
	}{}
}
{}
