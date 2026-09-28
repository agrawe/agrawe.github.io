%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Custom LaTeX Academic CV Class             %
%                 Created by Alexander Grawe               %
%                  Last edited: 2025-04-26                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%% Set up class %%%%%%%%%%%%%%%%%%%%%%%
% Load Class, pass specified options to loaded class, 
% extarticle includes more font sizes than article
\LoadClassWithOptions{extarticle}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[custom cv class]
%\renewcommand{\familydefault}{\sfdefault}

%%%%%%%%%%%%%%%%%%%%%%% Load packages %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{geometry}           % Margins etc.
\RequirePackage{hyperref}           % Hyperlinks
\RequirePackage{libertine}          % Libertine fonts
\RequirePackage[dvipsnames]{xcolor} % Extra colors
\RequirePackage{fancyhdr}           % Fancy headers
\RequirePackage{setspace}
\RequirePackage[super]{nth}

%%%%%%%%%%%%%%%%%%%%%%% Set options %%%%%%%%%%%%%%%%%%%%%%%%

% Margins
\geometry{a4paper, margin = 2cm}

% Paragraph indent
\setlength{\parindent}{0ex} 

% Line spacing
\setstretch{1}

% Set offset to each header and footer
\fancyhfoffset{0em}

% Remove head rule
\renewcommand{\headrulewidth}{0pt}

% Clear all header & footer fields
\fancyhf{}
\pagestyle{fancy}

% Accent color (matches website link color in light mode)
\definecolor{accent}{HTML}{8E1B1B}

% Hyperlinks
\hypersetup{
    colorlinks = true,
    urlcolor = accent,
    linkcolor = Black
    }

% Suppress underfull hbox warnings
\hbadness=99999

%%%%%%%%%%%%%%%%%%%%%% Define inputs %%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\name}[1]{\def\@name{#1}}      % Full name
\newcommand{\inst}[1]{\def\@inst{#1}}       % Institution
\newcommand{\email}[1]{\def\@email{#1}}     % Email address
\newcommand{\website}[1]{\def\@website{#1}} % Website URL
\newcommand{\address}[1]{\def\@address{#1}} % Address

%%%%%%%%%%%%%%%%% Define one-time commands %%%%%%%%%%%%%%%%%

% Current Month and Year
\newcommand*{\printdate}{%
   \ifcase \month\or January\or February\or March\or 
   April\or May\or June\or July\or August\or September\or 
   October\or November\or December\fi \space \number\year}

% CV Header
\newcommand{\cvheader}{%
    \begin{center}
    {\huge \@name}\vspace{1ex}

    \@inst

    \href{mailto:\@email}{\@email}
    \hspace{1ex} $\mid$ \hspace{1ex} 
    \href{https://\@website}{www.\@website}\\
\end{center}
}

% CV Contact
\newcommand{\cvcontact}{%
    \hrule
    \vspace{2ex}
    \cventry{\textbf{Contact}}{\@name\\
     \@address}{}   
}

%  CV Footer
%	#1 left footer
% 	#2 middle footer
%   #3 right footer
\newcommand*{\cvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{#1}
  \fancyfoot[C]{#2}
  \fancyfoot[R]{#3}
}

%%%%%%%%%%%%%%% Define multiple-use commands %%%%%%%%%%%%%%%

% CV Section
%	#1 section title
\newcommand{\cvsection}[1]{%
    \vspace{1ex}
    \textbf{\large #1} 
    \vspace{1ex}
    \hrule
    \vspace{1.5ex}
}

% CV Entry (three columns)
%	#1 left (narrow) column
% 	#2 middle (wide) column
%   #3 right (narrow) column
\newcommand{\cventry}[3]{%
    \begin{minipage}[t]{0.25\textwidth}
        #1
    \end{minipage}
    \begin{minipage}[t]{0.59\textwidth}
        #2
    \end{minipage}
    \begin{minipage}[t]{0.15\textwidth}
        \begin{flushright}
            #3
        \end{flushright} 
    \end{minipage}
}

% CV Entry 2 (two columns)
%	#1 left (narrow) column
% 	#2 right (wide) column
\newcommand{\cventrytwo}[2]{%
    \begin{minipage}[t]{0.25\textwidth}
        \textbf{#1}
    \end{minipage}
    \begin{minipage}[t]{0.74\textwidth}
        #2
    \end{minipage}\\[1ex]
}

% CV Entry 3 (two columns)
%	#1 left (wide) column
% 	#2 right (narrow) column
\newcommand{\cventrythree}[2]{%
    \begin{minipage}[t]{0.84\textwidth}
        #1
    \end{minipage}
    \begin{minipage}[t]{0.15\textwidth}
        \begin{flushright}
            #2
        \end{flushright}
    \end{minipage}\\
}

% Work in progress (title links to the research page):
%	#1 status, flush right (optional, e.g. Draft coming soon)
%	#2 title
% 	#3 coauthors (can be left empty)
\newcommand{\progress}[3][]{%
\href{https://agrawe.eu/research\#work-in-progress}{#2}%
% Check if coauthors are empty
\if\relax\detokenize{#3}\relax
\else
  , \textit{with #3}%
\fi
.%
% Check if optional status is empty
\if\relax\detokenize{#1}\relax
\else
  \hfill{\small\textit{#1}}%
\fi\par
\vspace{0.5ex}
}

% Coauthor link (uncolored, underlined)
%	#1 URL
% 	#2 name
\newcommand{\coauthor}[2]{%
{\hypersetup{urlcolor=black}\href{#1}{\underline{#2}}}%
}