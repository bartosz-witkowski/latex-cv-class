% cv.sty
% Yet another cv style.
% 2013-07-12 Bartosz Witkowski - bartosz.witkowski@like-a-boss.net

\ProvidesClass{cv}[2013/07/12]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% document options {

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions \relax

\LoadClass{article}

\RequirePackage{color}
\RequirePackage[
   top   = 3cm, 
   bottom= 2.5cm, 
   left=3cm, 
   right=2cm]{geometry}
\RequirePackage{hyperref}

\pagestyle{empty}

\renewcommand{\section}[1]{
   \vskip 2.0ex
   \noindent
   \textcolor[rgb]{0.5,0.5,0.5}{\rule{1.5cm}{7.5pt}}
   {\Large \textsc{#1}}
   \noindent
   \vskip 1.0ex 
   \nobreak
}

% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% full name and header { 

\def \@fullname{None}

\newcommand{\fullname}[1]{\def \@fullname{#1}}

\newcommand{\mkheader}{
   \hypersetup{
     pdftitle={\@fullname - Curriculum Vitae},
     pdfauthor={\@fullname}
   }
   {\centering{\Large{\textsc{Curriculum Vitae}}} \\}
   {\centering{\LARGE{\textsc{\@fullname}}} \\}
   \vskip 3ex
}

% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% environments {

\renewenvironment{itemize}
   { 
      \let \@@olditem \item
      \renewcommand{\item}[2][]{
         {##1} {##2}  \\ \noalign{\vskip 1mm}     
      }
      \noindent
      \begin{tabular}[t]{@{}p{\linewidth}@{}}
   } {
      \end{tabular}
      \renewcommand{\item}[2][]{
         \@@olditem[##1]{##2}
      }
   }


\renewenvironment{description}
   {
      \let \@olditem \item
      \renewcommand{\item}[2][]{
      \begin{hyphenrules}{nohyphenation}
        \textsc{##1}
      \end{hyphenrules}
         & ##2 \\ 
      }
      \begin{tabular}{@{}p{0.25 \linewidth} p{0.65\linewidth}@{}}
   } {
      \end{tabular}
      \renewcommand{\item}[2][]{
         \@olditem[##1]{##2}
      }
   }

% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% footer {

\newcommand{\footer}[1]{
\null \vfill
\begin{center}
   \textsf { 
      \textcolor[rgb]{0.3,0.3,0.3}{
         \scriptsize #1
      }
   }
\end{center}
}

% }
