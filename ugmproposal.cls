\NeedsTeXFormat{LaTeX2e}
%Created by Pekik Nurwantoro, Universitas Gadjah Mada, Yogyakarta, Indonesia
%Forked from Bagus Rianto, Computer Science 2011
%Edited by Muhammad Rifqi Fatchurrahman Putra Danar, Computer Science 2012
\ProvidesClass{ugmskripsi}[2016/17/08 v2.0.1 The University of Gadjah Mada Skripsi Class]

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}
\RequirePackage{amsmath}
\RequirePackage{array}
%\usepackage{minted}
% \usemintedstyle{bw}

\usepackage{adjustbox}
\usepackage{graphicx}
\usepackage{multirow}
\usepackage[table,xcdraw]{xcolor}

\usepackage{tabularx}

\usepackage{textcomp}
\usepackage{float}
\usepackage{booktabs}
\usepackage{pbox}
\usepackage[normalem]{ulem}
\usepackage{csquotes}
\usepackage{framed}
\usepackage{enumitem}
\usepackage{listings}
\usepackage{color}
\usepackage{courier}
\usepackage[scaled=.75]{beramono}
\usepackage{etoolbox,refcount}
\usepackage{multicol}
\usepackage{pdflscape}
\usepackage{tikz}
\usepackage[final]{pdfpages}
\usepackage{makeidx}

\usetikzlibrary{matrix, chains, positioning, arrows, arrows.meta, fit, calc, trees, shapes, shapes.symbols, shapes.geometric, decorations.pathreplacing, decorations.pathmorphing}


% Minted settings
%\AtBeginEnvironment{minted}{%
%  \renewcommand{\fcolorbox}[4][]{#4}}

\newif\if@msthesis
\newif\if@msproposal
\DeclareOption{skripsi}{\@msthesistrue\@msproposalfalse}
\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{skripsi,satusetengahspasi,indonesia}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}

% bib
% \RequirePackage[round]{natbib}
% \bibliographystyle{authoryear}
\usepackage{xpatch}
\usepackage[
isbn=false,
doi=false,
url=false,
eprint=false,
backend=bibtex, % sebelumnya biber
natbib=true,
style=authoryear,
citestyle=authoryear,
firstinits=true,
maxbibnames=99,
maxcitenames=2,
uniquelist=false
]{biblatex}
\addbibresource{referensi.bib}

% ubah titik jadi koma untuk pemisah
\renewcommand*{\newunitpunct}{\addcomma\space}

% urutan nama dari last ke first
\DeclareNameAlias{sortname}{last-first}

% spasi 1.5 tiap daftar pustaka
\setlength\bibitemsep{1.5\itemsep}


% format untuk buku
\DeclareBibliographyDriver{book}{%
  \printnames{author}%
  \newunit
  \printfield{year}%
  \newunit
  \printfield{title}%
  \newunit
  \printlist{publisher}%
  \newunit
  \printlist{location}%
  \finentry}

% ubah and jadi dan untuk bib
\AtBeginBibliography{%
  \renewcommand*{\finalnamedelim}{%
    \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
    \addspace dan\space}%
}


% ubah and jadi dan
\let\origparencite\parencite
\renewrobustcmd{\parencite}{%
  \AtNextCite{%
  \renewcommand*{\finalnamedelim}{%
    \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
    \addspace dan\space}%
  }%
  \origparencite%
}
% ubah and jadi dan
\renewcommand*{\finalnamedelim}{%
  \ifnumgreater{\value{liststop}}{2}{\finalandcomma}{}%
  \addspace dan\space}

% Remove "in" for articles
\renewbibmacro{in:}{%
  \ifentrytype{article}
    {}
    {\printtext{\nopunct\addspace}}}

% Remove "in" for proceedings
\renewbibmacro{in:}{%
  \ifentrytype{inproceedings}
    {}
    {\printtext{\nopunct\addspace}}}

% Remove quote from title
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{citetitle}{#1}
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{title}{#1}



\RequirePackage{nomencl}%
\renewcommand{\nomname}{\nomenclaturename}%
\makeglossary%

%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} %Indent approx 6 character

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil}%
  \def\@evenfoot{\hfil\thepage\hfil}
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{2}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
%\renewcommand \thesection {\@arabic\c@section.}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%\renewcommand\thesubsection {\@alph\c@subsection.}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
%\renewcommand\thesubsubsection{\@roman\c@subsubsection.}
%\renewcommand\thesubsubsection{}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries\centering}}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{PRAKATA}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\abstractname{INTISARI}%
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{LAMPIRAN}%
\def\refname{DAFTAR PUSTAKA}%
\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indek}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
}

%English
\def\captionsenglish{%
\def\prefacename{PREFACE}%
\def\contentsname{CONTENTS}%
\def\listfigurename{LIST OF FIGURES}%
\def\listtablename{LIST OF TABLES}%
\def\listappendixname{LIST OF APPENDICES}%
\def\nomenclaturename{NOMENCLATURE}%
\def\abstractname{ABSTRACT}%
\def\partname{PART}%
\def\chaptername{CHAPTER}%
\def\appendixname{APPENDIX}%
\def\refname{REFERENCES}%
\def\bibname{REFERENCES}%
\def\indexname{Index}%
\def\figurename{Figure}%
\def\tablename{Table}%
\def\pagename{Page}%
}

%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\gdef\@university{Universitas Gadjah Mada}
\gdef\@faculty{Fakultas Matematika dan Ilmu Pengetahuan Alam}
\gdef\@city{Yogyakarta}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\@examdate}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}
\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}%
\newcommand{\@firstexaminer}{}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}%
\newcommand{\@secondexaminer}{}
\newcommand{\thirdexaminer}[1]{\gdef\@thirdexaminer{#1}}%
\newcommand{\@thirdexaminer}{}

%------------------------------------------------------------
%format tanggal proposal
%------------------------------------------------------------
\newcommand{\agreedate}[1]{\gdef\@agreedate{#1}}
\newcommand{\@agreedate}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
    
%------------------------------------------------------------
%Define cover in Indonesian
%------------------------------------------------------------
%\def\cover{%
%  \thispagestyle{empty}%
%  \pagenumbering{roman}
%  \setcounter{page}{1}
%    \begin{center}
%      \begin{singlespace}
%      \MakeUppercase{\normalfont\bfseries Skripsi}\\
%      \vspace{1.5cm}
%      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
%      \vspace{1.0cm}
%      \MakeUppercase{\normalfont\slshape\bfseries\@titleeng}\par\nobreak
%       \vfill
%       \includegraphics{logougm}
%       \vfill
%       {\normalfont
%        \@fullname\\
%        \@idnum}\\
%       \vspace{1.5cm}
%       {\normalfont
%         \MakeUppercase{\normalfont\bfseries Program Studi \@program}\\
%         \MakeUppercase{\normalfont\bfseries Jurusan \@dept}\\
%         \MakeUppercase{\normalfont\bfseries\@faculty}\\
%         \MakeUppercase{\normalfont\bfseries\@university}\\
%         \MakeUppercase{\normalfont\bfseries\@city}\\
%         \vspace{0.5cm}
%         {\normalfont\bfseries\@yearsubmit}}\\
%      \end{singlespace}
%      \end{center}
%}

%------------------------------------------------------------
%Define cover proposal in Indonesian
%------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \MakeUppercase{\normalfont\bfseries Usulan Penelitian Tugas Akhir S1}\\
      \vspace{1.5cm}  
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
      \MakeUppercase{\normalfont\slshape\bfseries\@titleeng}\par\nobreak
       \vfill
       \includegraphics{logougm}
       \vfill
       {\normalfont
        \@fullname\\
        \@idnum}\\
       \vspace{1.5cm}
       {\normalfont 
         \MakeUppercase{\normalfont\bfseries Program Studi \@program}\\
         \MakeUppercase{\normalfont\bfseries Departemen \@dept}\\
         \MakeUppercase{\normalfont\bfseries\@faculty}\\
         \MakeUppercase{\normalfont\bfseries\@university}\\
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.5cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
      \addcontentsline{toc}{chapter}{HALAMAN SAMPUL}
} 


%------------------------------------------------------------
%Define titlepage in Indonesian
%------------------------------------------------------------
\def\titlepageind{%
  \thispagestyle{empty}% suppress any headline
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      \MakeUppercase{\normalfont\bfseries Skripsi}\\
      \vspace{1.5cm}
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
      \MakeUppercase{\normalfont\slshape\bfseries\@titleeng}\par\nobreak
      \vspace{1.5cm}
       \if@msthesis%
        {\normalfont Diajukan untuk memenuhi salah satu syarat memperoleh derajat\\
         Sarjana Sains \@program{}}\\
       \else
        {\normalfont Usulan Penelitian}\\
       \fi
       \vfill
       \includegraphics{logougm}
       \vfill
       {\normalfont
        \@fullname\\
        \@idnum}\\
       \vspace{1.5cm}
       {\normalfont
         \MakeUppercase{\normalfont\bfseries Program Studi \@program}\\
         \MakeUppercase{\normalfont\bfseries Jurusan \@dept}\\
         \MakeUppercase{\normalfont\bfseries\@faculty}\\
         \MakeUppercase{\normalfont\bfseries\@university}\\
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.5cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
\addcontentsline{toc}{chapter}{Halaman Judul}
}

% %------------------------------------------------------------
% %Format proposal 
% %------------------------------------------------------------
% \def\agreementpage{
%   \newpage\thispagestyle{empty}
%   \begin{center}
%   \begin{singlespace}
%   \MakeUppercase{\normalfont\large\bfseries\expandafter{Halaman Persetujuan}}\\
%   \vspace{1.0cm}
%   \MakeUppercase{\normalfont\large\bfseries\expandafter{Proposal Skripsi}}\\
%   \vspace{0.5cm}
%     \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
%   \vspace{1.0cm}
%   Diusulkan oleh :
%   \vspace{1.5cm}\\
%   \textbf{\@fullname}
%   \vspace{0.5cm}\\
%   \textbf{\@idnum}
%   \vspace{1.5cm}\\
%   Telah disetujui pada
%   \vspace{0.5cm}\\
%   pada tanggal
%   \@agreedate
%   \vspace{1.5cm}\\
%   \underline{\@firstsupervisor}\\
%   Pembimbing


%   \end{singlespace}
%   \end{center}
%   \addcontentsline{toc}{chapter}{HALAMAN PERSETUJUAN}
% }

%------------------------------------------------------------
%Format proposal 
%------------------------------------------------------------
\def\agreementpage{
  \clearpage\newpage
  \thispagestyle{empty}
  \begin{center}
  \begin{singlespace}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Halaman Persetujuan}}\\
  \vspace{1.0cm}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Proposal Skripsi}}\\
  \vspace{0.5cm}
    \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
  \vspace{1.0cm}
  Diusulkan oleh :
  \vspace{1.5cm}\\
  \textbf{\@fullname}
  \vspace{0.5cm}\\
  \textbf{\@idnum}
  \vspace{1.5cm}\\
  Telah disetujui pada
  \vspace{0.5cm}\\
  tanggal
  \@agreedate
  \vspace{1.5cm}\\
  \underline{\@firstsupervisor}\\
  Pembimbing


  \end{singlespace}
  \end{center}
  \addcontentsline{toc}{chapter}{HALAMAN PERSETUJUAN}
}

%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------
\def\approvalpage{%
  \newpage\thispagestyle{empty}%
  \begin{center}
  \begin{singlespace}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Halaman Pengesahan}}\\
  \vspace{1.0cm}
  \MakeUppercase{\normalfont\large\bfseries\expandafter{Usulan Penelitian S1}}\\
  \vspace{0.5cm}
      \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
  \vspace{1.0cm}
Telah dipersiapkan dan disusun oleh\\
\vspace{0.5cm}
\@fullname\\
\@idnum\\
\vspace{1.0cm}
Telah dipertahankan di depan Tim Penguji\\
pada tanggal \expandafter{\@examdate}\\
\vspace{0.5cm}
Susunan Tim Penguji\\
\vspace{2.2cm}
\begin{tabular}{p{8cm}p{6cm}}
\@firstsupervisor&\@firstexaminer\\
Pembimbing&Ketua Penguji
\end{tabular}

\vspace{2.0cm}
\begin{tabular}{p{8cm}p{6cm}}
\@secondsupervisor&\@secondexaminer\\
&Anggota Penguji
\end{tabular}

\bigskip
\vspace{2.0cm}
\begin{tabular}{p{8cm}p{6cm}}
&\@thirdexaminer\\
&
\end{tabular}
    \end{singlespace}
    \end{center}
\addcontentsline{toc}{chapter}{HALAMAN PENGESAHAN}
}

%signed
\def\approvalpagesigned{
  \setboolean{@twoside}{false}
  \includepdf[pages=-, offset=75 -75]{PROPOSAL/a.pdf} % todo : change later
  \addcontentsline{toc}{chapter}{HALAMAN PENGESAHAN}
}

%------------------------------------------------------------
%Declare Page
%------------------------------------------------------------
\def\declarepage{%
  \newpage\thispagestyle{chapterheading}%
  \begin{center}
  {\normalfont\large\bfseries\expandafter{PERNYATAAN}}
  \par\nobreak
  \end{center}
  \vspace{1.0cm}
    \noindent
Dengan ini saya menyatakan bahwa dalam Skripsi ini tidak terdapat karya yang
pernah diajukan untuk memperoleh gelar kesarjanaan di suatu Perguruan Tinggi,
dan sepanjang pengetahuan saya juga tidak terdapat karya atau pendapat yang
ditulis atau diterbitkan oleh orang lain, kecuali yang secara tertulis diacu
dalam naskah ini dan disebutkan dalam daftar pustaka.

\vspace{1.5cm}
\begin{tabular}{p{7.5cm}c}
&\@city,\space\@examdate\\
&\\
&\\
&\space\@fullname
\end{tabular}
\vfill
\addcontentsline{toc}{chapter}{Halaman Pernyataan}
}

%------------------------------------------------------------
%Acknowlegment
%------------------------------------------------------------
\def\acknowledment{%
  \clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page
\addcontentsline{toc}{chapter}{Halaman Persembahan}
}

%------------------------------------------------------------
%Motto
%------------------------------------------------------------
\def\motto{%
  \clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page
\addcontentsline{toc}{chapter}{Halaman Motto}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\lambang{%
  \clearpage\thispagestyle{chapterheading}%
  \printglossary%
\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%------------------------------------------------------------
%Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstractind{%
  \clearpage\thispagestyle{chapterheading}%
  {\parindent \z@ \centering \normalfont
  {\large\textbf{\abstractname}} \\
  \vspace{1.0cm}
   {\large\textbf{\@titleind}}
        \par\nobreak
        \vskip 12\p@
    \interlinepenalty\@M
    {\normalsize Oleh\par
   \vspace{0.5cm}
    \@fullname\\
    \@idnum\\
    \vskip 10\p@
    }\par\nobreak
    }
  \begin{singlespace}%
  \vskip 20\p@
  \addcontentsline{toc}{chapter}{\abstractname}
}
\def\endabstractind{\par\vfil\null\end{singlespace}}

%------------------------------------------------------------
%Redefine Abstract in English
%------------------------------------------------------------
\def\abstracteng{%
  \clearpage\thispagestyle{chapterheading}\selectlanguage{english}%
  {\parindent \z@ \centering \normalfont
  {\large\textbf{\abstractname}}\\
  \vspace{1.0cm}
   {\large\textbf{\@titleeng}}
        \par\nobreak
        \vskip 12\p@
    \interlinepenalty\@M
    {\normalsize By\par
   \vspace{0.5cm}
    \@fullname\\
    \@idnum\\
    \vskip 10\p@
    }\par\nobreak
    }
  \begin{singlespace}%
  \vskip 20\p@
  \addcontentsline{toc}{chapter}{\abstractname}
  }
\def\endabstracteng{\par\vfil\null\end{singlespace}%
\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}}


\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\AtBeginDocument{%
\if@langindo%
\selectlanguage{bahasa}%
\else
\selectlanguage{english}%
\fi
}

\endinput
