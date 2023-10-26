%% This is file 'ubletter' based on `hhuletter.cls` based on `akletter.cls',
%% written by Axel Kielhorn, modified by Friedhelm Sowa, modified by Carsten Wuensch 
%% 
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ubletter}
              [2010/07/27 v1.0
               UB LaTeX letter class]
\newcommand\@ptsize{}

\newcount\mylastpage
\mylastpage0

\newlength\aktextwidth
\newlength\aktextheight
\newlength\akoffsetwidth
\newdimen\foldhskip
\newdimen\foldvskipi
\newdimen\foldvskipii
\newdimen\foldvskipiii
\setlength\akoffsetwidth    {0mm}
\setlength\foldhskip        {5mm}
\setlength\foldvskipi       {84mm}
\setlength\foldvskipiii     {47.5mm}

\DeclareOption{a4paper}
   {\setlength\paperheight  {297mm}%
    \setlength\paperwidth   {210mm}%
    \setlength\aktextwidth  {172mm}%{456\p@}%
    \setlength\aktextheight {260mm}%
    \setlength\foldvskipii  {43.5mm}}
\DeclareOption{a4offset}
   {\setlength\paperheight  {297mm}%
    \setlength\paperwidth   {210mm}%
    \setlength\aktextwidth  {172mm}%{432\p@}%
    \setlength\aktextheight {260mm}%
    \setlength\akoffsetwidth{24pt}%
    \setlength\foldvskipii  {43.5mm}}
\DeclareOption{a5paper}
    {\ClassError{ubletter}
    {Sorry, only a4paper supported!}
    {If you tell me how to calculate the right margins,\MessageBreak
    I will add different paper sizes}}
\DeclareOption{b5paper}
    {\ClassError{ubletter}
    {Sorry, only a4paper supported!}
    {If you tell me how to calculate the right margins,\MessageBreak
    I will add different paper sizes}}
\DeclareOption{letterpaper}
   {\setlength\paperheight  {11in}%
    \setlength\paperwidth   {8.5in}%
    \setlength\aktextwidth  {468\p@}%
    \setlength\aktextheight {610\p@}%
    \setlength\foldvskipii  {44mm}}
\DeclareOption{legalpaper}
    {\ClassError{ubletter}
    {Sorry, only a4paper and letterpaper supported!}
    {If you tell me how to calculate the right margins,\MessageBreak
    I will add different paper sizes}}
\DeclareOption{executivepaper}
    {\ClassError{ubletter}
    {Sorry, only a4paper and letterpaper supported!}
    {If you tell me how to calculate the right margins,\MessageBreak
    I will add different paper sizes}}
\DeclareOption{landscape}
    {\ClassError{ubletter}
    {Sorry, landscape not supported!}
    {If you tell me how to calculate the right margins,\MessageBreak
    I will add different paper sizes}}
\DeclareOption{10pt}       {\renewcommand \@ptsize{0}}
\DeclareOption{11pt}       {\renewcommand \@ptsize{1}}
\DeclareOption{12pt}       {\renewcommand \@ptsize{2}}
\DeclareOption{twoside}    {\@twosidetrue \@mparswitchtrue}
\DeclareOption{oneside}    {\@twosidefalse\@mparswitchfalse}
\DeclareOption{draft}      {\setlength\overfullrule{5pt}}
\DeclareOption{final}      {\setlength\overfullrule{0pt}}
\DeclareOption{leqno}      {\input{leqno.clo}}
\DeclareOption{fleqn}      {\input{fleqn.clo}}
\newif\if@bankhi \@bankhifalse
\newif\if@banklo \@banklofalse
\newif\if@fold   \@foldtrue

\newif\if@refdate       \@refdatefalse
\newif\if@subjectdate   \@subjectdatefalse
\newif\if@rightdate     \@rightdatefalse
\DeclareOption{refdate}     {\@rightdatefalse\@refdatetrue\@subjectdatefalse}
\DeclareOption{subjectdate} {\@rightdatefalse\@refdatefalse\@subjectdatetrue}
\DeclareOption{rightdate}   {\@rightdatetrue\@refdatefalse\@subjectdatefalse}

\DeclareOption{foldmarks}  {\@foldtrue}
\DeclareOption{nofoldmarks}{\@foldfalse}
\DeclareOption{bankhigh}   {\@bankhitrue}
\DeclareOption{banklow}    {\@banklotrue}

\newif\if@reverseaddr     \@reverseaddrfalse
\DeclareOption{reverseaddr}{\@reverseaddrtrue}
\ExecuteOptions{subjectdate,a4paper,10pt,oneside,nofoldmarks,onecolumn,final}
\ProcessOptions
\input{size1\@ptsize.clo}
\voffset-1in\advance\voffset-1.6mm
\hoffset6mm
\setlength\lineskip        {1\p@}
\setlength\normallineskip  {1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip         {0.7em}
\setlength\parindent       {0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\headheight      {12\p@}
\setlength\headsep         {0mm}
\setlength\footskip        {25\p@}

\setlength{\textwidth}     {\aktextwidth}
\setlength{\textheight}    {\aktextheight}

\setlength{\@tempdima}     {\paperwidth}
\addtolength{\@tempdima}   {-\textwidth}
\setlength\oddsidemargin   {.5\@tempdima}

\addtolength{\oddsidemargin}{-1in}
\setlength\evensidemargin  {\oddsidemargin}

\addtolength\oddsidemargin {\akoffsetwidth}
\addtolength\evensidemargin{-\akoffsetwidth}
\setlength\marginparwidth  {60\p@}
\setlength\marginparsep    {11\p@}
\setlength\marginparpush   {5\p@}
\setlength\topmargin       {-35\p@}
\setlength\footnotesep     {12\p@}
\setlength{\skip\footins}  {10\p@ \@plus 2\p@ \@minus 4\p@}
\newlength{\rightfield}
\newlength{\leftfield}
\setlength{\rightfield}    {42mm}
\setlength{\leftfield}     {\textwidth}
\addtolength{\leftfield}   {-\rightfield}

\newlength{\addrfieldindent}
\setlength{\addrfieldindent}{0mm}

\newlength{\addrfieldsep}
\setlength{\addrfieldsep}{16pt}
\newlength{\datefieldsep}
\setlength{\datefieldsep}{24pt}
\newlength{\openingsep}
\setlength{\openingsep}{14pt}

\newsavebox{\FIRM}
\newsavebox{\firm}
\newsavebox{\firmaddress}
\newsavebox{\FIRMHEAD}
\newsavebox{\firmreturn}
\newsavebox{\firmfoot}

\newcommand*\pnumfont   {\normalfont\footnotesize}
\newcommand*\headfont   {\slshape} 
\newcommand*\reffont    {\normalfont}
\newcommand*\reftextfont{\normalfont}

\def\@foldmarks{\if@fold \bgroup
 \reversemarginpar
 \vspace{\foldvskipi}\marginpar{\hspace{\foldhskip}\rule{2mm}{.2pt}}
 \vspace{\foldvskipii}\marginpar{\hspace{\foldhskip}\rule{4mm}{.2pt}}
 \vspace{\foldvskipiii}\marginpar{\hspace{\foldhskip}\rule{2mm}{0pt}}
 \vspace{-\foldvskipiii}\vspace{-\foldvskipii}\vspace{-\foldvskipi}
 \egroup \fi}


\AtBeginDocument{%
 \def\captionsenglish{%
  \def\yourrefname      {Your ref.:}
  \def\yourmailname     {Your letter of:}
  \def\myrefname        {Our ref.:}
  \def\mymailname       {Our letter of:}
  \def\customername     {Customer no.}
  \def\invoicename      {Invoice no.}
  \def\subjectname      {Subject: }
  \def\ccname           {cc: }
  \def\enclname         {encl: }
  \def\headtoname       {To}
  \def\datename         {Date}
  \def\pagename         {Page}
  \def\telephonename    {Telephone}
  \def\telefaxname      {Telefax}}
 \let\captionsUSenglish=\captionsenglish
 \def\captionsgerman{%
  \def\yourrefname      {Ihr Zeichen:}
  \def\yourmailname     {Ihr Schreiben vom:}
  \def\myrefname        {Unser Zeichen:}
  \def\mymailname       {Unser Schreiben vom:}
  \def\customername     {Kundennummer}
  \def\invoicename      {Rechnungsnummer}
  \def\subjectname      {}
  \def\ccname           {Kopien an: }
  \def\enclname         {Anlagen: }
  \def\headtoname       {An}
  \def\datename         {Datum}
  \def\pagename         {Seite}
  \def\telephonename    {Telefon}
  \def\telefaxname      {FAX}}
 \def\captionsngerman{%
  \def\yourrefname      {Ihr Zeichen:}
  \def\yourmailname     {Ihr Schreiben vom:}
  \def\myrefname        {Unser Zeichen:}
  \def\mymailname       {Unser Schreiben vom:}
  \def\customername     {Kundennummer}
  \def\invoicename      {Rechnungsnummer}
  \def\subjectname      {}
  \def\ccname           {Kopien an: }
  \def\enclname         {Anlagen: }
  \def\headtoname       {An}
  \def\datename         {Datum}
  \def\pagename         {Seite}
  \def\telephonename    {Telefon}
  \def\telefaxname      {Telefax}}
 \let\captionsaustrian=\captionsgerman
 \def\captionsfrench{%
  \def\yourrefname      {Vos r\'ef\'erences:}
  \def\yourmailname     {Votre lettre du:}
  \def\myrefname        {Nos r\'ef\'erences:}
  \def\mymailname       {Nos lettre du:}
  \def\customername     {Num\'ero de client}
  \def\invoicename      {Num\'ero de facture}
  \def\subjectname      {Concernant: }
  \def\ccname           {Copie \`a: }
  \def\enclname         {Annexes: }
  \def\headtoname       {A}
  \def\datename         {Date}
  \def\pagename         {Page}
  \def\telephonename    {Telephone}
  \def\telefaxname      {Telefax}}
 \def\captionsdanish{%
  \def\yourrefname      {Deres ref.:}
  \def\yourmailname     {Deres brev af:}
  \def\myrefname        {Vor ref.:}      % or   Vores ref.:
  \def\mymailname       {Vort brev af:}  % or   Vores brev af:
  \def\customername     {Kundenr.}
  \def\invoicename      {Invoice no.}
  \def\subjectname      {Ang{\aa}ende: }
  \def\ccname           {kopi til: }     % or   kopi sendt til: 
  \def\enclname         {vedlagt: }
  \def\headtoname       {Til}
  \def\datename         {Dato}
  \def\pagename         {Side}
  \def\telephonename    {Telefon}
  \def\telefaxname      {Telefax}}

 \def\dateenglish{\def\today{\number\day/\number\month/\number\year}}
 \def\dateUSenglish{\def\today{\number\month/\number\day/\number\year}}
 \def\dategerman{\def\today{\number\day.\,\number\month.\,\number\year}}
 \def\dateiso{\def\today{\number\year--\number\month--\number\day}}
 \let\dateaustrian=\dategerman
 \let\datefrench=\dategerman

 \captionsUSenglish
 \dateUSenglish
 \ifx\l@USenglish\undefined
   \chardef\l@USenglish=255
 \else\ifnum\language=\l@USenglish
   \captionsUSenglish
   \dateUSenglish
 \fi\fi
 \ifx\l@ngerman\undefined
   \chardef\l@german=255
 \else\ifnum\language=\l@ngerman
  \captionsgerman
  \dategerman
 \fi\fi
 \ifx\l@austrian\undefined
   \chardef\l@austrian=255
 \else\ifnum\language=\l@austrian
  \captionsgerman
  \dategerman
 \fi\fi
 \ifx\l@french\undefined
   \chardef\l@french=255
 \else\ifnum\language=\l@french
  \captionsfrench
  \datefrench
 \fi\fi
 \input{\username.cfg}
}

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty
	  \let\@evenfoot\@empty
      \def\@oddhead{\usebox{\firm}
         \headfont\hfil\@date\hfil\pagename\ \pnumfont\thepage}%
      \let\@evenhead\@oddhead}
\else
  \def\ps@headings{%
      \let\@oddfoot\@empty
      \def\@oddhead{\usebox{\firm}
         \headfont\hfil\@date\hfil\pagename\ \pnumfont\thepage}}
\fi
\def\ps@empty{%
    \let\@oddfoot\@empty\let\@oddhead\@empty
    \let\@evenfoot\@empty\let\@evenhead\@empty
    }

\def\ps@firstpage{%
    \let\@evenhead\@empty \let\@evenfoot\@empty
% header institute and logo
    \def\@oddhead{\vtop{\hsize\textwidth\hrule height12mm width0pt\vskip0pt%
                  \usebox{\FIRMHEAD}}}
    }

\def\ps@plain{\setlength{\headsep}{17mm}\setlength{\topmargin}{0mm}
    \let\@oddhead\@empty\let\@evenhead\@empty
    \def\@oddfoot{\hfil\pnumfont --~\thepage~--\hfil}%
    \def\@evenfoot{\hfil\pnumfont --~\thepage~--\hfil}
    }
\newcommand*{\usename}[1]  {\def\username{#1}}
\newcommand*{\name}[1]     {\def\fromname{#1}}
\newcommand*{\signature}[1]{\def\fromsig{#1}}
\newcommand*{\institute}[1]{\def\frominstitute{#1}}
\newcommand*{\function}[1]{\def\fromfunction{#1}}
\newcommand*{\optiona}[1]{\def\fromoptiona{#1}}
\newcommand*{\optionb}[1]{\def\fromoptionb{#1}}
\newcommand*{\telephone}[1]{\def\telephonenum{#1}}
\newcommand*{\telefax}[1]  {\def\telefaxnum{#1}}
\newcommand*{\gebaeude}[1]{\def\gebnum{#1}}
\newcommand*{\etage}[1]{\def\etanum{#1}}
\newcommand*{\raum}[1]{\def\raumnum{#1}}
\def\username{hhubrief}
\def\fromname{}
\def\fromsig{\fromname}
\def\frominstitute{}
\def\fromfunction{}
\def\fromoptiona{}
\def\fromoptionb{}
\def\telephonenum{}
\def\telefaxnum{}
\def\gebnum{}
\def\etanum{}
\def\raumnum{}

\newcommand*{\makelabels}{%
  \AtBeginDocument{%
     \let\@startlabels\startlabels
     \let\@mlabel\mlabel
     \if@filesw
       \immediate\write\@mainaux{\string\@startlabels}\fi}%
  \AtEndDocument{%
     \if@filesw\immediate\write\@mainaux{\string\clearpage}\fi}}
\@onlypreamble\makelabels

\def\adrentry#1#2#3#4#5#6#7#8{\ifx #8\@empty \else
 \ifx #2\@empty
  \expandafter\def\csname #8\endcsname{#1\\#3}
 \else
  \expandafter\def\csname #8\endcsname{#2 #1\\#3}
 \fi \fi}
\def\adrchar#1{}

\newenvironment{letter}[1]
  {\newpage
    \if@twoside
      \ifodd\c@page
      \else
        \thispagestyle{empty}\null\newpage
      \fi
    \fi
%%
%
% Die Paginierung ist nicht entsprechend DIN 5008 aufgebaut!
% Eine normgerechte Paginierung wird durch setzen von \mylastpage0
% in der Konfigurationsdatei erreicht, die mit \usename angegeben wird.
% Muster dieser Konfigurationsdatei ist ubbrief.cfg.
%
%%
    \def\@oddfoot{\vbox{\hsize167mm\pnumfont 
\ifnum\mylastpage>0\hspace*{135mm}Seite~\thepage~von \the\mylastpage
\else\ifnum\c@page>1\hfill --~\thepage~--\hfill\hbox to 0pt{\hss}\else\relax\fi
\fi}}%
    \def\@evenfoot{\vbox{\hsize167mm\pnumfont 
\ifnum\mylastpage>0\hspace*{135mm}Seite~\thepage~von \the\mylastpage
\else\hfill --~\thepage~--\hfill\hbox to 0pt{\hss}
\fi}}%
    \c@page\@ne
    \c@footnote\z@%
    \interlinepenalty=200 % smaller than the TeXbook value
    \@processto{\leavevmode\ignorespaces #1}\hsize\leftfield}
  {\stopletter\@@par%
   \immediate\write\@mainaux{\string\global\string\mylastpage\thepage}%
   \pagebreak\@@par
    \if@filesw
      \begingroup
        \let\\=\relax
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout{%
          \string\@mlabel{}{%
            \ifx\@specialmail\@empty
            \else
              {\bfseries\@specialmail}\\[1ex]
            \fi
            \toname\\\toaddress}}%
      \endgroup
    \fi}
\long\def\@processto#1{%
    \@xproc #1\\@@@%
	\ifx\toaddress\@empty
    \else
	  \@yproc #1@@@
    \fi}
\long\def\@xproc #1\\#2@@@{\def\toname{#1}\def\toaddress{#2}}
\long\def\@yproc #1\\#2@@@{\def\toaddress{#2}}
\newcommand*{\stopbreaks}{%
   \interlinepenalty\@M
   \def\par{\@@par\nobreak}
   \let\\=\@nobreakcr
   \let\vspace\@nobreakvspace}

\DeclareRobustCommand\@nobreakvspace
   {\@ifstar\@nobreakvspacex\@nobreakvspacex}
\def\@nobreakvspacex#1{%
  \ifvmode
    \nobreak\vskip #1\relax
  \else
    \@bsphack\vadjust{\nobreak\vskip #1}\@esphack
  \fi}

\def\@nobreakcr{\@ifstar{\@normalcr*}{\@normalcr*}}

\newcommand*{\startbreaks}{%
  \let\\\@normalcr
   \interlinepenalty 200%
   \def\par{\@@par\penalty 200\relax}}

\newcommand{\@addrfield}{%
	\mbox{}\kern\addrfieldindent%

  \parbox[t]{8cm}{%
    \usebox{\firmreturn}\\[-6pt]%
    \parbox[t][3.5cm][c]{8cm}%
      {\fontsize{11}{13pt}\selectfont
       \ifx\@specialmail\@empty
       \else
         {\bfseries\@specialmail}\\[1ex]
       \fi
       \toname\\
       \toaddress
     }%
   }%
}


\newcommand{\@datefield}{%
\if@refdate
    \makebox[\textwidth][l]{%
      \@yref  \vspace{0.02\textwidth}%
      \@ymail \vspace{0.02\textwidth}%
      \@myref \vspace{0.02\textwidth}%
      \@mymail \hfill \@dateref
    }\\[7mm]
\else
    \makebox[\textwidth][l]{%
      \@yref  \vspace{0.02\textwidth}%
      \@ymail \vspace{0.02\textwidth}%
      \@myref \vspace{0.02\textwidth}%
      \@mymail
    }\\[7mm]
\fi
\if@subjectdate
	\setlength{\@tempdima}{\leftfield}
\else
	\setlength{\@tempdima}{\textwidth}
\fi
\ifx\@subject\@empty
   \makebox[\@tempdima]{}%
\else
    \parbox[l]{\leftfield}{\@subject}%
\fi
%% The encl-line
\ifx\@encl\@empty
   \makebox[\@tempdima]{}%
\else
    \par\parbox[l]{\leftfield}{\@encl}%
\fi
\if@subjectdate
    \hfill\makebox[\rightfield][r]{\@date}
\fi%
\\[1ex]
\ifx\@customer\@empty
\else
    \parbox[l]{\@tempdima}{\@customer}\\%
\fi%
\ifx\@invoice\@empty
\else
    \parbox[l]{\@tempdima}{\@invoice}\\%
\fi%
}

\newcommand*{\opening}[1]{\hsize\aktextwidth%
%  \enlargethispage{-20mm}
  \thispagestyle{firstpage} \null \@foldmarks%
  \vspace*{\addrfieldsep}%
  \vbox{\vspace*{14mm}\hsize\textwidth\addtolength{\hsize}{5mm}%
  \if@reverseaddr
    \rightbox\hfill\@addrfield\par
  \else
    \@addrfield\hfill\rightbox\par
  \fi}
  \vspace{\datefieldsep}
  \@datefield\null\par%
  \vspace{\openingsep}%
  #1\par\nobreak
\hsize\leftfield}

\newcommand{\closing}[1]{\par\vspace{\parskip}%
  \stopbreaks
  \noindent
  \parbox{\leftfield}{\raggedright
     \ignorespaces #1\par
     \vspace{6\medskipamount}%
     \fromsig
     \strut}%
   \par}
\medskipamount=\parskip
\newcommand*{\cc}[1]{%
  \par\noindent
  \parbox[t]{\textwidth}{%
    \@hangfrom{\normalfont\ccname }%
    \ignorespaces #1\strut}\par}

\def\encl#1{\def\@encl{%
\ifx\enclname\@empty
  #1
\else
  \@hangfrom{\enclname\ }#1
\fi
}}


\newcommand*{\ps}{\par\startbreaks}
\newcommand*{\stopletter}{}

\if@refdate
  \def\yref#1{\def\@yref{\parbox[t]{.18\textwidth}
    {\reffont\scriptsize \yourrefname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\ymail#1{\def\@ymail{\parbox[t]{.18\textwidth}
    {\reffont\scriptsize \yourmailname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\myref#1{\def\@myref{\parbox[t]{.18\textwidth}
    {\reffont\scriptsize \myrefname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\mymail#1{\def\@mymail{\parbox[t]{.18\textwidth}
    {\reffont\scriptsize \mymailname\\
	 \reftextfont\raggedright\normalsize #1}}}
\else
  \def\yref#1{\def\@yref{\parbox[t]{.23\textwidth}
    {\reffont\scriptsize \yourrefname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\ymail#1{\def\@ymail{\parbox[t]{.23\textwidth}
    {\reffont\scriptsize \yourmailname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\myref#1{\def\@myref{\parbox[t]{.23\textwidth}
    {\reffont\scriptsize \myrefname\\
	 \reftextfont\raggedright\normalsize #1}}}
  \def\mymail#1{\def\@mymail{\parbox[t]{.23\textwidth}
    {\reffont\scriptsize \mymailname\\
	 \reftextfont\raggedright\normalsize #1}}}
\fi

\def\@dateref{\parbox[t]{.2\textwidth}
   {\reffont\scriptsize \@refdatename\ \\
    \reftextfont\normalsize \@date}}

\def\refdatename#1{\def\@refdatename{#1}}
\def\@refdatename {}

\def\subject#1{\def\@subject{%
\ifx\subjectname\@empty
  \bfseries\scshape #1
\else
  \@hangfrom{\subjectname\ }\bfseries\scshape #1
\fi
}}

\def\invoice#1{\def\@invoice{%
    \invoicename\ \bfseries #1
  }}
  
\def\customer#1{\def\@customer{%
    \customername\ \bfseries #1
  }}
  
\def\@invoice {}
\def\@customer{}

\def\@yref   {}  \def\@ymail {}
\def\@myref  {}  \def\@mymail{}
\def\@subject{}
\def\@refdate{}

\def\specialmail#1{\def\@specialmail{#1}}
\def\email#1      {\def\@email{#1}}
\def\mailbox#1    {\def\@mailbox{#1}}
\def\homepage#1   {\def\@homepage{#1}}
\def\@specialmail {}
\def\@email       {}
\def\@mailbox     {}

\newcount\labelcount
\newcommand*{\startlabels}{\labelcount\z@
   \pagestyle{empty}%
   \let\@texttop\relax
   \setlength\parsep {0\p@}
   \topmargin      -60\p@
   \headsep        \z@
   \oddsidemargin  -35\p@
   \evensidemargin -35\p@
   \textheight     260mm
   \@colht\textheight  \@colroom\textheight \vsize\textheight
   \textwidth      \aktextwidth%550\p@
   \columnsep      26\p@
   \ifcase \@ptsize\relax
     \normalsize
   \or
     \small
   \or
     \footnotesize
   \fi
   \baselineskip \z@
   \lineskip     \z@
   \boxmaxdepth  \z@
   \parindent    \z@
   %\twocolumn
   \relax}
\let\@startlabels=\relax
\newcommand*{\mlabel}[2]{%
  \parbox[b][2in][c]{3in}{%
     \strut\ignorespaces\usebox{\firmreturn}\\
     \fontsize{12}{14pt}\selectfont
     \parbox[t][1.2in][c]{3in}{#2}
   }\par%
}

\let\@mlabel=\@gobbletwo
\setlength\leftmargini  {2.5em}
\setlength\leftmarginii {2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength\leftmargin   {\leftmargini}
\setlength\labelsep     {5\p@}
\setlength\labelwidth   {\leftmargini}
\addtolength\labelwidth {-\labelsep}
\setlength\partopsep    {0\p@}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\@listI{\setlength\leftmargin{\leftmargini}
            \setlength\parsep {0\p@}%
            \setlength\topsep {.4em}%
            \setlength\itemsep{.4em}}
\let\@listi\@listI
\@listi
\def\@listii {\setlength  \leftmargin{\leftmarginii}%
              \setlength  \labelwidth{\leftmarginii}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listiii{\setlength  \leftmargin{\leftmarginiii}%
              \setlength  \labelwidth{\leftmarginiii}%
              \addtolength\labelwidth{-\labelsep}%
              \setlength  \topsep    {.2em}%
              \setlength  \itemsep   {\topsep}}
\def\@listiv {\setlength  \leftmargin{\leftmarginiv}%
              \setlength  \labelwidth{\leftmarginiv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listv  {\setlength  \leftmargin{\leftmarginv}%
              \setlength  \labelwidth{\leftmarginv}%
              \addtolength\labelwidth{-\labelsep}}
\def\@listvi {\setlength  \leftmargin{\leftmarginvi}%
              \setlength  \labelwidth{\leftmarginvi}%
              \addtolength\labelwidth{-\labelsep}}
\renewcommand\theenumi   {\@arabic\c@enumi}
\renewcommand\theenumii  {\@alph\c@enumii}
\renewcommand\theenumiii {\@roman\c@enumiii}
\renewcommand\theenumiv  {\@Alph\c@enumiv}
\newcommand\labelenumi   {\theenumi.}
\newcommand\labelenumii  {(\theenumii)}
\newcommand\labelenumiii {\theenumiii.}
\newcommand\labelenumiv  {\theenumiv.}
\renewcommand\p@enumii   {\theenumi}
\renewcommand\p@enumiii  {\theenumi(\theenumii)}
\renewcommand\p@enumiv   {\p@enumiii\theenumiii}

\newcommand\labelitemi  {\textbullet}
\newcommand\labelitemii {\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv {\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]%
  {\hspace\labelsep\normalfont\bfseries #1}

\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\setlength\itemsep{\z@}%
                        \setlength\itemindent{-15\p@}%
                        \setlength\listparindent{\itemindent}%
                        \setlength\rightmargin{\leftmargin}%
                        \addtolength\leftmargin{15\p@}}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\setlength\listparindent{1.5em}%
                        \setlength\itemindent{\listparindent}%
                        \setlength\rightmargin{\leftmargin}}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\setlength\rightmargin{\leftmargin}}%
                \item\relax}
               {\endlist}

\setlength\arraycolsep   {5\p@}
\setlength\tabcolsep     {6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep {2\p@}
\setlength\tabbingsep    {\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep       {3\p@}
\setlength\fboxrule      {.4\p@}
\renewcommand\theequation{\@arabic\c@equation}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\relax}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\relax}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
\renewcommand\footnoterule{%
  \kern-\p@
  \hrule \@width .4\columnwidth
  \kern .6\p@}
\long\def\@makefntext#1{%
    \noindent
    \hangindent 5\p@
    \hb@xt@5\p@{\hss\@makefnmark}#1}

\setlength\columnsep     {10\p@}
\setlength\columnseprule {0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\raggedbottom
\let\@texttop\relax
\onecolumn

\endinput
%% End of file `ubletter.cls'.
